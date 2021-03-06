"""Contains common building blocks for yolo neural networks."""
import tensorflow as tf
import tensorflow.keras as ks
import DarkConv


@ks.utils.register_keras_serializable(package='yolo')
class DarkTiny(ks.layers.Layer):
    def __init__(self,
                 filters=1,
                 use_bias=True,
                 strides=2,
                 kernel_initializer='glorot_uniform',
                 bias_initializer='zeros',
                 use_bn=True,
                 use_sync_bn=False,
                 norm_moment=0.99,
                 norm_epsilon=0.001,
                 conv_activation='leaky',
                 leaky_alpha=0.1,
                 sc_activation='linear',
                 **kwargs):

        # darkconv params
        self._filters = filters
        self._use_bias = use_bias
        self._kernel_initializer = kernel_initializer
        self._bias_initializer = bias_initializer
        self._use_bn = use_bn
        self._use_sync_bn = use_sync_bn
        self._strides = strides

        # normal params
        self._norm_moment = norm_moment
        self._norm_epsilon = norm_epsilon

        # activation params
        self._conv_activation = conv_activation
        self._leaky_alpha = leaky_alpha
        self._sc_activation = sc_activation

        super().__init__(**kwargs)
        return

    def build(self, input_shape):
        # if self._strides == 2:
        #     self._zeropad = ks.layers.ZeroPadding2D(((1,0), (1,0)))
        #     padding = "valid"
        # else:
        #     self._zeropad = ks.layers.ZeroPadding2D(((0,1), (0,1)))#nn_blocks.Identity()#ks.layers.ZeroPadding2D(((1,0), (1,0)))
        #     padding = "valid"
        self._maxpool = tf.keras.layers.MaxPool2D(pool_size=2, strides=self._strides, padding="same", data_format=None)

        self._convlayer = DarkConv(filters=self._filters,
                                  kernel_size=(3, 3),
                                  strides=(1, 1),
                                  padding='same',
                                  use_bias=self._use_bias,
                                  kernel_initializer=self._kernel_initializer,
                                  bias_initializer=self._bias_initializer,
                                  use_bn=self._use_bn,
                                  use_sync_bn=self._use_sync_bn,
                                  norm_moment=self._norm_moment,
                                  norm_epsilon=self._norm_epsilon,
                                  activation=self._conv_activation,
                                  leaky_alpha=self._leaky_alpha)

        super().build(input_shape)
        return

    def call(self, inputs):
        output = self._maxpool(inputs)
        output = self._convlayer(output)
        return output

    def get_config(self):
        # used to store/share parameters to reconsturct the model
        layer_config = {
            "filters": self._filters,
            "use_bias": self._use_bias,
            "strides": self._strides,
            "kernel_initializer": self._kernel_initializer,
            "bias_initializer": self._bias_initializer,
            "use_bn": self._use_bn,
            "use_sync_bn": self._use_sync_bn,
            "norm_moment": self._norm_moment,
            "norm_epsilon": self._norm_epsilon,
            "conv_activation": self._conv_activation,
            "leaky_alpha": self._leaky_alpha,
            "sc_activation": self._sc_activation,
        }
        layer_config.update(super().get_config())
        return layer_config
