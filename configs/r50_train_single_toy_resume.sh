#!/usr/bin/env bash

set -x
T=`date +%m%d%H%M`

EXP_DIR=exps/singlebaseline/toy_r50_e3_resume
mkdir ${EXP_DIR}
PY_ARGS=${@:1}
python -u main.py \
    --num_classes 4 \
    --vid_path ${TOY_DIR} \
    --epochs 3 \
    --num_feature_levels 1 \
    --num_queries 25 \
    --dilation \
    --batch_size 8 \
    --num_workers 8 \
    --lr_drop_epochs 6 7 \
    --with_box_refine \
    --dataset_file toy_single \
    --coco_pretrain \
    --resume ./exps/singlebaseline/toy_r50_e10_nf4_ld6,7_lr0.0002_nq25_bs8_wbox_joint_MEGA_detrNorm_class4_pretrain_coco_dc5/checkpoint0009.pth \
    --output_dir ${EXP_DIR} \
    ${PY_ARGS} 2>&1 | tee ${EXP_DIR}/log.train.$T
