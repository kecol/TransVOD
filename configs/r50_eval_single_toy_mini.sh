#!/usr/bin/env bash

set -x
T=`date +%m%d%H%M`

EXP_DIR=exps/singlebaseline/toy_mini_RESIZE_r50_e200_nf4_ld6,7_lr0.0002_nq25_bs8_wbox_joint_MEGA_detrNorm_class4_pretrain_coco_dc5
mkdir -p ${EXP_DIR}
PY_ARGS=${@:1}
python -u main.py \
    --num_classes 4 \
    --vid_path ${TOY_DIR} \
    --epochs 3 \
    --eval \
    --num_feature_levels 1 \
    --num_queries 25 \
    --dilation \
    --batch_size 1 \
    --resume ${EXP_DIR}/checkpoint0099.pth \
    --lr_drop_epochs 4 6 \
    --num_workers 12 \
    --with_box_refine \
    --dataset_file toy_single \
    --output_dir ${EXP_DIR} \
    ${PY_ARGS} 2>&1 | tee ${EXP_DIR}/log.train.$T
