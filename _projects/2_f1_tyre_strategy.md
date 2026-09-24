---
layout: page
title: Formula 1 Tyre Strategy Prediction
description: LSTM, GRU and MLP models to predict the best tyre compound lap by lap during a Formula 1 race
importance: 3
category: research
badge: B.Sc. Thesis
img: assets/img/projects/f1-tyre-usage.png
authors: <em>Massimo Rondelli</em>
period: B.Sc. thesis, University of Bologna, 2023 · Python, FastF1, LSTM / GRU / MLP
summary: Recurrent and feed-forward networks trained on FastF1 telemetry to predict the best tyre compound for each lap of a Formula 1 race. The GRU reached 51.4% accuracy, against 28.1% for the LSTM, 27.1% for the MLP and 24.5% for a blind classifier.
code: https://github.com/MaxRondelli/Formula-1-Tyre-Strategy-Prediction
paper: https://amslaurea.unibo.it/id/eprint/27922/
related_publications: true
---

Tyre strategy is one of the most decisive factors in a Formula 1 race: teams must balance the grip, durability and speed of each compound against track temperature, tyre wear and weather.
This project, developed for my B.Sc. thesis, studies recurrent and feed-forward neural networks (**LSTM**, **GRU** and **MLP**) to predict the best tyre for each lap of a race, using telemetry data from the [FastF1](https://theoehrly.github.io/Fast-F1/) library.
The "best tyre" is defined through a best-lap-time metric.

**Results.**
The GRU consistently outperformed the other models, reaching **51.4% accuracy** (learning rate 1e-4), against 28.1% for the LSTM, 27.1% for the MLP, and 24.5% for a blind classifier that predicts from class priors only.
Its recurrent structure captures the sequential nature of race data better than the alternatives.

<div class="row">
  <div class="col-sm mt-3 mt-md-0">
    {% include figure.liquid loading="eager" path="assets/img/projects/f1-blind-classifier.png" title="Model accuracy comparison" class="img-fluid rounded z-depth-1" %}
  </div>
  <div class="col-sm mt-3 mt-md-0">
    {% include figure.liquid loading="eager" path="assets/img/projects/f1-tyre-usage.png" title="Tyre usage percentages" class="img-fluid rounded z-depth-1" %}
  </div>
</div>
<div class="caption">
  Left: accuracy of GRU, LSTM and MLP compared with a blind classifier. Right: tyre compound usage in the dataset.
</div>

<div class="row">
  <div class="col-sm mt-3 mt-md-0">
    {% include figure.liquid path="assets/img/projects/f1-results-table.jpg" title="Accuracy and loss per model" class="img-fluid rounded z-depth-1" %}
  </div>
</div>
<div class="caption">
  Accuracy and loss of each model across learning rates.
</div>

**Links:**
[Code](https://github.com/MaxRondelli/Formula-1-Tyre-Strategy-Prediction) ·
[Thesis](https://amslaurea.unibo.it/id/eprint/27922/)

Thesis: {% cite rondelli2023formula1 %}
