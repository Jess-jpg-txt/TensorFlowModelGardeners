�%  *�I+�@�Mb���@2�
\Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMapۥ��E9@!�+�_B@)ۥ��E9@1�+�_B@:Preprocessing2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch::ParallelMap� 5�l7@!�(��@@)� 5�l7@1�(��@@:Preprocessing2�
OIterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2���CC@!K?�TL@) ��L�*@11�m��F3@:Preprocessing2T
Iterator::Prefetch::GeneratorE*�-�@!���"@)E*�-�@1���"@:Preprocessing2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch::ParallelMap::ParallelMap::AssertCardinality::ParallelInterleaveV3[3]::FlatMap[0]::TFRecordm�?3���?!
t�Jp�?)m�?3���?1
t�Jp�?:Advanced file read2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch::ParallelMap::ParallelMap::AssertCardinality::ParallelInterleaveV3�i4��?!w���?)�i4��?1w���?:Preprocessing2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch::ParallelMap::ParallelMap��ި��?!$ ��0�?)��ި��?1$ ��0�?:Preprocessing2�
xIterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTakeߨ��5�?!�2p�8b�?)�S^-�?1=���*ٰ?:Preprocessing2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch::ParallelMap::ParallelMap::AssertCardinality�S[� �?!�̞���?)<�)�?1k�d<a۫?:Preprocessing2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch��E�>�?! ���?)��E�>�?1 ���?:Preprocessing2�
�Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate[0]::FiniteTake::Prefetch::ParallelMap::ParallelMap::AssertCardinality::ParallelInterleaveV3[3]::FlatMaprP�L[�?!�~Y���?)n3�x�?1yMWN��?:Preprocessing2F
Iterator::Modelr��9��?!I�\�VU�?) ��WW�?1gB���?:Preprocessing2j
3Iterator::Model::Prefetch::Rebatch::Map::FiniteTake�I�?!~�Ӎ���?)�$y��?17y6���?:Preprocessing2�
iIterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap::PaddedBatchV2::ParallelMap::Concatenate�[�����?!��-��?)��ݓ���?1��g�G�?:Preprocessing2P
Iterator::Model::Prefetch�K�;���?!Td�dG�?)�K�;���?1Td�dG�?:Preprocessing2I
Iterator::Prefetcht��Y5�?!���Uc�?)t��Y5�?1���Uc�?:Preprocessing2w
@Iterator::Model::Prefetch::Rebatch::Map::FiniteTake::ParallelMap�J�4�?!�����?)�J�4�?1�����?:Preprocessing2^
'Iterator::Model::Prefetch::Rebatch::Map4�f�?!���}ק?)C�8
q?1:�[F��x?:Preprocessing2Y
"Iterator::Model::Prefetch::RebatchН`�un�?!L&+7̪?)�T���Bp?15=`;�w?:Preprocessing:�
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