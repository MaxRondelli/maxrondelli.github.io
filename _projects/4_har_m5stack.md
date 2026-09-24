---
layout: page
title: Human Activity Recognition with LSTM on M5Stack
description: An LSTM trained on the UCI HAR dataset and deployed on an M5Stack Gray for real-time on-device inference
importance: 2
category: personal
badge: Embedded ML
img: assets/img/projects/har-m5stack-inference.jpeg
authors: On-device activity recognition from IMU data
period: 2024 · Python, PyTorch, TensorFlow Lite, ESP32 / M5Stack
summary: An LSTM trained on the UCI Human Activity Recognition dataset to classify six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying). The PyTorch model is converted to TensorFlow Lite and then to a C header, and runs in real time on an M5Stack Gray using its built-in IMU. Test accuracy settles at about 92%.
code: https://github.com/MaxRondelli/Human-Activity-Recognition-with-LSTM-on-M5Stack
---

This project implements **Human Activity Recognition (HAR)** with a **Long Short-Term Memory (LSTM)** network and deploys it on an **M5Stack Gray**, an ESP32-based IoT device, for real-time inference from its built-in IMU sensor.
The model is trained on the [UCI Human Activity Recognition dataset](https://archive.ics.uci.edu/dataset/240/human+activity+recognition+using+smartphones) to recognize six activities: walking, walking upstairs, walking downstairs, sitting, standing and laying.

**From PyTorch to the device.**

1. Train the LSTM in PyTorch and keep the best checkpoint.
2. Convert the model to **TensorFlow Lite**.
3. Convert the `.tflite` file into a C header (`xxd -i`) and mark the arrays `const`, so the model fits in the device flash.
4. Load it with **TensorFlowLite for ESP32** in an Arduino sketch and classify live IMU readings on the M5Stack.

<div class="row">
  <div class="col-sm mt-3 mt-md-0">
    {% include figure.liquid loading="eager" path="assets/img/projects/har-confusion-matrix.png" title="Confusion matrix" class="img-fluid rounded z-depth-1" %}
  </div>
  <div class="col-sm mt-3 mt-md-0">
    {% include figure.liquid loading="eager" path="assets/img/projects/har-m5stack-inference.jpeg" title="Inference on M5Stack" class="img-fluid rounded z-depth-1" %}
  </div>
</div>
<div class="caption">
  Left: confusion matrix on the test set (normalized to % of total test data). Right: real-time prediction running on the M5Stack.
</div>

<div class="row">
  <div class="col-sm mt-3 mt-md-0">
    {% include figure.liquid path="assets/img/projects/har-accuracy.png" title="Training accuracy" class="img-fluid rounded z-depth-1" %}
  </div>
</div>
<div class="caption">
  Accuracy over 650 training epochs (learning rate 0.0015).
</div>

**Links:**
[Code](https://github.com/MaxRondelli/Human-Activity-Recognition-with-LSTM-on-M5Stack)
