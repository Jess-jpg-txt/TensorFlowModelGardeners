�%  *=
ףp�~@l�t��a�@2�
\Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap��ݯB@!<�;�G@)��ݯB@1<�;�G@:Preprocessing2T
Iterator::Prefetch::Generator�����#9@!n�<��@@)�����#9@1n�<��@@:Preprocessing2�
OIterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2�<��G@!I>Vb�wO@)9}=_+'@128��ܒ.@:Preprocessing2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch::ParallelMap�:�p�'@!M�	H�@)�:�p�'@1M�	H�@:Preprocessing2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch::ParallelMap::ParallelMap::AssertCardinality::ParallelInterleaveV3[7]::FlatMap[0]::TFRecord�,g~�?!�B��s��?)�,g~�?1�B��s��?:Advanced file read2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch::ParallelMap::ParallelMap::AssertCardinality::ParallelInterleaveV3g���d��?!�g����?)g���d��?1�g����?:Preprocessing2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch::ParallelMap::ParallelMap{��!U�?!t���ut�?){��!U�?1t���ut�?:Preprocessing2�
xIterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTakeu����?!]���MY�?)�Y����?1�����|�?:Preprocessing2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch::ParallelMap::ParallelMap::AssertCardinality����%�?!e�m+T9�?)L3�뤾�?18���_�?:Preprocessing2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::PrefetchKs+��X�?!!zm_�5�?)Ks+��X�?1!zm_�5�?:Preprocessing2F
Iterator::Model$d �.ߚ?!��SGȺ�?)/�
ҌE�?1��h*n�?:Preprocessing2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch::ParallelMap::ParallelMap::AssertCardinality::ParallelInterleaveV3[7]::FlatMap�����U�?!�+q��?)g���ْ?1_}�Υߘ?:Preprocessing2j
3Iterator::Model::Prefetch::Rebatch::Map::FiniteTakeٴR��?!oܷ��r�?)ĵ��^(�?1ǣ�;R�?:Preprocessing2Y
"Iterator::Model::Prefetch::Rebatch�֦���?!�!</5��?)��P�Bȉ?1"8>��?:Preprocessing2�
iIterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate^��jGq�?!]���L��?)K���J̃?1x���?:Preprocessing2I
Iterator::Prefetch��"��?!uu]�p,�?)��"��?1uu]�p,�?:Preprocessing2P
Iterator::Model::PrefetchҧU�f~?!^�L��?)ҧU�f~?1^�L��?:Preprocessing2w
@Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMapT���{?!Oq�@�?)T���{?1Oq�@�?:Preprocessing2^
'Iterator::Model::Prefetch::Rebatch::Mapgc%�YI�?!��� �?)8�Jw��p?1��j<v?:Preprocessing:�
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
�Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
�Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
�Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
�Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)�
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysisg
unknownTNo step time measured. Therefore we cannot tell where the performance bottleneck is.no*no#You may skip the rest of this page.BX
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown
  " * 2 : B J R Z JGPU�*�WARNING: No step markers observed and hence the step time is actually unknown. This may happen if your profiling duration is shorter than the step time. In that case, you may try to profile longer.2red"�
unknownTNo step time measured. Therefore we cannot tell where the performance bottleneck is.b
`input_pipeline_analyzer (especially Section 3 for the breakdown of input operations on the Host)m
ktrace_viewer (look at the activities on the timeline of each Host Thread near the bottom of the trace view)"O
Mtensorflow_stats (identify the time-consuming operations executed on the GPU)"U
Strace_viewer (look at the activities on the timeline of each GPU in the trace view)*y
w<a href="https://www.tensorflow.org/guide/data_performance" target="_blank">Better performance with the tf.data API</a>2I
=type.googleapis.com/tensorflow.profiler.GenericRecommendation
nono:
Refer to the TF2 Profiler FAQ2"GPU(: 