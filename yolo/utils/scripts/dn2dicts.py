#!/usr/bin/env python3
"Convert a DarkNet config file into a Python literal file in a list of dictionaries format"

from absl import app, flags
from absl.flags import argparse_flags

import argparse
import collections
import configparser
from itertools import zip_longest
from pprint import pprint
import io
import sys

from typing import Dict, List

if sys.version_info < (3, 10):
    # shim for Python 3.9 and older
    from more_itertools import zip_equal
    def zip(*iterables, strict=False):
        if strict:
            return zip_equal(*iterables)
        else:
            return __builtins__.zip(*iterables)



def _parseValue(key, val):
    """
    Parse non-string literals found in darknet config files
    """
    if ',' in val:
        vals = val.split(',')
        raw_list = tuple(_parseValue(key, v) for v in vals)
        if key == 'anchors':
            # Group the anchors list into pairs
            # https://docs.python.org/3.10/library/functions.html#zip
            raw_list = list(zip(*[iter(raw_list)]*2, strict=True))
        return raw_list
    else:
        if '.' in val:
            try:
                return float(val.strip())
            except ValueError:
                return val
        else:
            try:
                return int(val.strip())
            except ValueError:
                return val


class multidict(collections.OrderedDict):
    """
    A dict subclass that allows for multiple sections in a config file to share
    names.

    From: https://stackoverflow.com/a/9888814
    """
    _unique = 0   # class variable

    def __setitem__(self, key, val):
        if isinstance(val, dict):
            # This should only happen at the top-most level
            self._unique += 1
            val['_type'] = key
            key = self._unique
        elif isinstance(val, str):
            val = _parseValue(key, val)
        super().__setitem__(key, val)


class DNConfigParser(configparser.RawConfigParser):
    def __init__(self, **kwargs):
        super().__init__(defaults=None, dict_type=multidict, strict=False, **kwargs)

    def as_list(self) -> List[Dict[str, str]]:
        """
        Converts a ConfigParser object into a dictionary.

        The resulting dictionary has sections as keys which point to a dict of the
        sections options as key => value pairs.
        """
        the_list = []
        for section in self.sections():
            the_list.append(dict(self.items(section)))
        return the_list

    def as_dict(self) -> Dict[str, Dict[str, str]]:
        """
        Converts a ConfigParser object into a dictionary.

        The resulting dictionary has sections as keys which point to a dict of the
        sections options as key => value pairs.

        https://stackoverflow.com/a/23944270
        """
        the_dict = {}
        for section in self.sections():
            the_dict[section] = dict(self.items(section))
        return the_dict


def convertConfigFile(configfile):
    parser = DNConfigParser()
    if isinstance(configfile, io.IOBase):
        if hasattr(configfile, 'name'):
            print(configfile.name)
            parser.read_file(configfile, source=configfile.name)
        else:
            parser.read_file(configfile)
    else:
        parser.read(configfile)
    return parser.as_list()


# ABSEIL SCRIPT BELOW


def _makeParser(parser):
    """
    Make a parser for the Abseil utility script. This is not the Darknet parser.
    """
    parser.add_argument(
        'config',
        default=None,
        help='name of the config file. Defaults to YOLOv3',
        nargs='?',
        type=argparse.FileType('r'))
    parser.add_argument(
        'dictsfile',
        default=sys.stdout,
        nargs='?',
        help='name of the Python literal file',
        type=argparse.FileType('w'))


_parser = argparse_flags.ArgumentParser()
_makeParser(_parser)

def main(argv, args=None):
    if args is None:
        args = _parser.parse_args(argv[1:])

    config = args.config
    dictsfile = args.dictsfile

    if config is None:
        from ..file_manager import download
        with open(download('yolov3.cfg')) as config:
            output = list(convertConfigFile(config))
    else:
        output = list(convertConfigFile(config))

    pprint(output, dictsfile)


if __name__ == '__main__':
    app.run(main)
