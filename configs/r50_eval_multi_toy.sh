#!/usr/bin/env bash

set -x
T=`date +%m%d%H%M`

EXP_DIR=exps/multibaseline/toy_r50
mkdir -p ${EXP_DIR}
PY_ARGS=${@:1}
python -u main.py \
    --epochs 1 \
    --eval \
    --num_feature_levels 1 \
    --num_queries 300 \
    --dilation \
    --batch_size 1 \
    --num_ref_frames 14 \
    --resume ${EXP_DIR}/checkpoint0001.pth \
    --lr_drop_epochs 4 6 \
    --num_workers 16 \
    --with_box_refine \
    --dataset_file toy_multi \
    --output_dir ${EXP_DIR} \
    ${PY_ARGS} 2>&1 | tee ${EXP_DIR}/log.train.$T
