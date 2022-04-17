#!/usr/bin/env bash

set -x
T=`date +%m%d%H%M`

EXP_DIR=exps/baselines/toy_r50_e100
mkdir -p ${EXP_DIR}
PY_ARGS=${@:1}
python -u main.py \
    --num_classes 4 \
    --vid_path ${TOY_DIR} \
    --epochs 1 \
    --inference \
    --num_feature_levels 1 \
    --num_queries 25 \
    --dilation \
    --batch_size 1 \
    --resume ${EXP_DIR}/checkpoint0041.pth \
    --num_workers 12 \
    --with_box_refine \
    --dataset_file toy_single \
    --output_dir ${EXP_DIR} \
    ${PY_ARGS} 2>&1 | tee ${EXP_DIR}/log.train.$T
