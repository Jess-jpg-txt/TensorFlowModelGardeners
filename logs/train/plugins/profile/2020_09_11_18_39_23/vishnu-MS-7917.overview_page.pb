�%  *�E�����@� �r2�@2�
\Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap ���[=@!���Y�E@) ���[=@1���Y�E@:Preprocessing2T
Iterator::Prefetch::Generator�'+��C,@!��("5@)�'+��C,@1��("5@:Preprocessing2�
OIterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2�z���gE@!�Y�H/P@)�����*@1���F	4@:Preprocessing2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch::ParallelMap!sePm0"@!|W�?*3+@)!sePm0"@1|W�?*3+@:Preprocessing2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch::ParallelMap::ParallelMap::AssertCardinality::ParallelInterleaveV3[11]::FlatMap[0]::TFRecord��;�$�?!҅\�
��?)��;�$�?1҅\�
��?:Advanced file read2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch::ParallelMap::ParallelMap::AssertCardinalityN����?!b��d�?)t&m��?1S�yp�?:Preprocessing2�
xIterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake#/kb���?!��u���?)y:W���?1���~��?:Preprocessing2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch�#0�ܣ?!r�����?)�#0�ܣ?1r�����?:Preprocessing2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch::ParallelMap::ParallelMap::AssertCardinality::ParallelInterleaveV3�'�XQ�?!{<6�?)�'�XQ�?1{<6�?:Preprocessing2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch::ParallelMap::ParallelMap4��yT��?!��q{]�?)4��yT��?1��q{]�?:Preprocessing2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch::ParallelMap::ParallelMap::AssertCardinality::ParallelInterleaveV3[11]::FlatMap �	���?!C��Ma��?)'i���?1�7�g�?:Preprocessing2j
3Iterator::Model::Prefetch::Rebatch::Map::FiniteTake�����B�?!1���!�?)vOjM�?1���Tݜ?:Preprocessing2F
Iterator::Model���y��?!j�~\\�?)�z��&3�?1��V����?:Preprocessing2I
Iterator::Prefetch�z�V���?!ՙu����?)�z�V���?1ՙu����?:Preprocessing2�
iIterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate�	�ʼU�?!��q�r�?)��^D�1�?1�n�±�?:Preprocessing2P
Iterator::Model::PrefetchDԷ��?!EM}^H�?)DԷ��?1EM}^H�?:Preprocessing2w
@Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap<L����?!B�/�Vˊ?)<L����?1B�/�Vˊ?:Preprocessing2^
'Iterator::Model::Prefetch::Rebatch::Map{.S���?!NT/���?)��)t^cw?1p$DF�|�?:Preprocessing2Y
"Iterator::Model::Prefetch::Rebatch㈵� �?!�����i�?)��%VF#o?1v�nHw?:Preprocessing:�
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