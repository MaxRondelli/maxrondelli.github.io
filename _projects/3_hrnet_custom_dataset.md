---
layout: page
title: HRNet with Custom Dataset
description: Training High-Resolution Networks for human pose estimation on a custom COCO-style keypoint dataset
importance: 1
category: personal
badge: Computer Vision
authors: Human pose estimation on a custom COCO-style keypoint dataset
period: 2024 · Python, PyTorch, CUDA, HRNet
summary: A fork of the official HRNet implementation with the instructions and code changes needed to train it on your own keypoint dataset (COCO format, 12 keypoints instead of 17), plus inference on images and videos. On a 374-image custom dataset, HRNet-W48 (384×288, pretrained) reached 0.568 AP and 0.950 AP50.
code: https://github.com/MaxRondelli/HRNet-with-Custom-Dataset
---

A fork of the official [HRNet](https://github.com/leoxiaobin/deep-high-resolution-net.pytorch) (High-Resolution Network) implementation, with the instructions and code changes needed to train it for **human pose estimation on your own dataset**.

The repository covers:

- organizing a **custom dataset in COCO format** (images plus `train.json` / `val.json` keypoint annotations);
- adapting the configuration for a **different number of keypoints** (12 instead of COCO's 17);
- **training** and running **inference on images and videos** with the resulting checkpoint.

**Results on the custom dataset** (374 images: 296 train, 78 validation).
The best configuration, **HRNet-W48 at 384×288 with ImageNet pretraining**, reached **0.568 AP**, **0.950 AP<sup>50</sup>** and **0.665 AR**.
These are below the numbers reported on COCO, which is expected given the dataset size, but good enough for practical pose estimation at inference time.

| Backbone  | Pretrain | Input size | AP        | AP<sup>50</sup> | AP<sup>75</sup> | AR        |
| --------- | :------: | :--------: | :-------: | :-------------: | :-------------: | :-------: |
| HRNet-W32 |    Y     |  384×288   |   0.396   |      0.826      |      0.338      |   0.509   |
| HRNet-W48 |    N     |  384×288   |   0.526   |      0.831      |      0.537      |   0.581   |
| HRNet-W48 |    Y     |  384×288   | **0.568** |    **0.950**    |    **0.579**    | **0.665** |

**Links:**
[Code](https://github.com/MaxRondelli/HRNet-with-Custom-Dataset) ·
[Original HRNet](https://github.com/leoxiaobin/deep-high-resolution-net.pytorch)
