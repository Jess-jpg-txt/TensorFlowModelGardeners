from absl.testing import parameterized
import tensorflow as tf
import numpy as np

try:
    from importlib import resources as importlib_resources
except BaseException:
    # Shim for Python 3.6 and older
    import importlib_resources

from yolo.modeling.yolo_v3 import DarkNet53


class darknet2tf_test(tf.test.TestCase, parameterized.TestCase):
    def test_load_yolov3_weights(self):
        x = tf.ones(shape=[1, 224, 224, 3], dtype=tf.float32)
        model = DarkNet53(classes=1000, load_backbone_weights=True)
        model.get_summary()
        y: tf.Tensor = model(x)
        self.assertEqual(y.get_shape(), (1, 1000))


if __name__ == "__main__":
    tf.test.main()
