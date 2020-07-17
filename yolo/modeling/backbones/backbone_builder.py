import tensorflow as tf
import tensorflow.keras as ks

import yolo.modeling.building_blocks as nn_blocks
from yolo.modeling.backbones.get_config import build_block_specs
from yolo.modeling.backbones.configs.darknet_53 import darknet53_config


class backbone_builder(ks.Model):
    def __init__(self, layer_specs, **kwargs):
        self.layers = layer_specs
        self._layer_dict = {"DarkConv", nn_blocks.DarkConv,
                            "DarkRes", nn_blocks.DarkResidual,
                            "DarkRoute", nn_blocks.DarkRoute,
                            "DarkLite", None}

        output = self
        
        super(DarkNet_builder, self).__init__(**kwargs)
        return

    def _build_struct(self, net):
        endpoints = dict()
        for layer in self.layerspecs:
            continue
        return endpoints

    def _build_block(self):
        return


block_specs = build_block_specs(darknet53_config)  # current model input
print(block_specs)
