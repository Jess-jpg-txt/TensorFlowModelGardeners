�%  *����U@ףp�\�@2�
\Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMapO��'�U9@!F���"I@)O��'�U9@1F���"I@:Preprocessing2�
OIterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2`��-0B@!��~t�R@)�����&@1����d�5@:Preprocessing2T
Iterator::Prefetch::Generatorχg	2�#@!=�^�3@)χg	2�#@1=�^�3@:Preprocessing2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch::ParallelMap<0��d@!���4�5@)<0��d@1���4�5@:Preprocessing2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch::ParallelMap::ParallelMap::AssertCardinality::ParallelInterleaveV3[10]::FlatMap[0]::TFRecord��c?�?!��s����?)��c?�?1��s����?:Advanced file read2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch::ParallelMap::ParallelMap�f�8��?!K����?)�f�8��?1K����?:Preprocessing2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch::ParallelMap::ParallelMap::AssertCardinalityC;�Y�ݵ?!�}���?)B_z�sѨ?1zLS���?:Preprocessing2�
xIterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTakeg)YNB�?!J��#��?)��l�?3�?1��I?��?:Preprocessing2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::PrefetchgE�D��?!L��o�?)gE�D��?1L��o�?:Preprocessing2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch::ParallelMap::ParallelMap::AssertCardinality::ParallelInterleaveV3DԷ��?!��N�ò?)DԷ��?1��N�ò?:Preprocessing2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch::ParallelMap::ParallelMap::AssertCardinality::ParallelInterleaveV3[10]::FlatMap��{�?!���W&��?)�/��C�?15�;V#�?:Preprocessing2�
iIterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate�i�*��?!�Br_h��?)~�p�?11�����?:Preprocessing2w
@Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMapr��Õ?!R_"J��?)r��Õ?1R_"J��?:Preprocessing2j
3Iterator::Model::Prefetch::Rebatch::Map::FiniteTake�=�$@M�?!Y���a"�?)���jה?1a9��y��?:Preprocessing2F
Iterator::Model�!�Q*�?!����?)�Ϛi�?1	ף�tF�?:Preprocessing2I
Iterator::Prefetch��\m���?!	7�j�ؒ?)��\m���?1	7�j�ؒ?:Preprocessing2P
Iterator::Model::PrefetchQ��dV�?!�i��A͐?)Q��dV�?1�i��A͐?:Preprocessing2Y
"Iterator::Model::Prefetch::Rebatch��w���?!x�
�7ü?)Afg�;�?1�qN��?:Preprocessing2^
'Iterator::Model::Prefetch::Rebatch::Map�@��?!;e< Ƹ?)<2V��W}?1��2��?:Preprocessing:�
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