#!/usr/bin/env bash

set -x
T=`date +%m%d%H%M`

EXP_DIR=exps/multibaseline/toy_r50_f3
mkdir -p ${EXP_DIR}
PY_ARGS=${@:1}
python -u main.py \
    --num_classes 4 \
    --vid_path ${TOY_DIR} \
    --epochs 1 \
    --eval \
    --num_feature_levels 1 \
    --num_queries 25 \
    --dilation \
    --batch_size 1 \
    --num_ref_frames 3 \
    --resume ${EXP_DIR}/checkpoint0001.pth \
    --lr_drop_epochs 4 6 \
    --num_workers 12 \
    --with_box_refine \
    --dataset_file toy_multi \
    --output_dir ${EXP_DIR} \
    ${PY_ARGS} 2>&1 | tee ${EXP_DIR}/log.train.$T
