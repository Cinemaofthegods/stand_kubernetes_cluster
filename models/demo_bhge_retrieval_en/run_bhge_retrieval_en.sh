#!/bin/bash
export CUDA_VISIBLE_DEVICES=0 &&
source ./env/bin/activate &&
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64/ &&
nohup python3.6 -m deeppavlov.deep riseapi DeepPavlov/deeppavlov/configs/odqa/bhge/bhge_retrieval_demo_optimized_2.json > ./demo_bhge_retrieval_en.log 2>&1 &