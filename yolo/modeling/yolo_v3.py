import tensorflow as tf
import tensorflow.keras as ks
from yolo.modeling.backbones.backbone_builder import Backbone_Builder
from yolo.utils.get_weights import load_weights, get_darknet53_tf_format


class DarkNet53(ks.Model):
    """The Darknet Image Classification Network Using Darknet53 Backbone"""

    def __init__(
            self,
            classes=1000,
            load_backbone_weights=False,
            config_file="yolov3.cfg",
            weights_file=None):
        super(DarkNet53, self).__init__()
        self.back_bone = Backbone_Builder("darknet53")
        self.head = ks.Sequential([
            ks.layers.GlobalAveragePooling2D(),
            ks.layers.Dense(classes, activation="sigmoid")
        ])
        if load_backbone_weights:
            self._load_backbone_weights(config_file, weights_file)
        return

    def call(self, inputs):
        out_dict = self.back_bone(inputs)
        x = out_dict[list(out_dict.keys())[-1]]
        return self.head(x)

    def _load_backbone_weights(self, config, weights):
        encoder, decoder, outputs, _ = load_weights(config, weights)
        encoder, weight_list = get_darknet53_tf_format(encoder[:])
        print(
            f"\nno. layers: {len(self.back_bone.layers)}, no. weights: {len(weight_list)}")
        for i, (layer, weights) in enumerate(
                zip(self.back_bone.layers, weight_list)):
            print(
                f"loaded weights for layer: {i}  -> name: {layer.name}",
                sep='      ',
                end="\r")
            layer.set_weights(weights)
        self.back_bone.trainable = False
        print(
            f"\nsetting back_bone.trainable to: {self.back_bone.trainable}\n")
        print(f"...training will only affect classification head...")
        return

    def get_summary(self):
        self.back_bone.summary()
        self.head.build(input_shape=[None, None, None, 1024])
        self.head.summary()
        print(f"backbone trainable: {self.back_bone.trainable}")
        print(f"head trainable: {self.head.trainable}")
        return


class Yolov3():
    def __init__(self):
        pass


class Yolov3_tiny():
    def __init__(self):
        pass


class Yolov3_spp():
    def __init__(self):
        pass


x = tf.ones(shape=[1, 224, 224, 3], dtype=tf.float32)
model = DarkNet53(
    classes=2,
    load_backbone_weights=True,
    weights_file="yolov3_416.weights")
model.get_summary()
y = model(x)

print(y.shape)
