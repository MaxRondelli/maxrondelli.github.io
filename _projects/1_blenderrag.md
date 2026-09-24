---
layout: page
title: BlenderRAG
description: High-fidelity 3D object generation via retrieval-augmented Blender code synthesis
importance: 2
category: research
badge: arXiv
img: assets/img/projects/blenderrag-thumb.jpg
authors: <em>Massimo Rondelli</em>, Francesco Pivi, Maurizio Gabbrielli
period: arXiv preprint, 2026 · Python, Blender add-on, RAG (Qdrant), LLMs
summary: A Blender add-on that turns a natural-language description into an executable Blender Python script. Retrieval over a curated dataset of 500 expert-validated (text, code, image) examples across 50 object categories raises the compilation success rate from 40.8% to 70.0% and CLIP alignment from 0.41 to 0.77 across four LLMs, with no fine-tuning.
code: https://github.com/MaxRondelli/BlenderRAG
arxiv: 2605.00632
dataset: https://huggingface.co/datasets/MaxRondelli/BlenderRAG
website: https://maxrondelli.github.io/BlenderRAG/
related_publications: true
---

BlenderRAG is a Blender add-on that turns a natural-language description (e.g. _"a modern wooden chair with armrests"_) into an executable Blender Python script and runs it directly in the viewport.
State-of-the-art LLMs frequently produce syntactically broken or geometrically inconsistent Blender code; BlenderRAG grounds generation in a curated multimodal dataset of **500 expert-validated examples** (text, code, image) across **50 object categories**.

Across four state-of-the-art LLMs, retrieval raises the **compilation success rate from 40.8% to 70.0%** and the **CLIP semantic alignment from 0.41 to 0.77**, without fine-tuning or specialized hardware.

<div class="row mt-3">
  <div class="col-sm mt-3 mt-md-0">
    {% include figure.liquid loading="eager" path="assets/img/projects/blenderrag-pipeline.jpg" title="BlenderRAG pipeline" class="img-fluid rounded z-depth-1" %}
  </div>
</div>
<div class="caption">
  The BlenderRAG pipeline: dataset construction with human correction, retrieval by embedding similarity, and LLM code synthesis.
</div>

**How it works**

1. **Embed** the query with a Nomic-AI sentence-embedding model.
2. **Retrieve** the top-_k_ most similar _(description, code)_ pairs from a local Qdrant vector database.
3. **Synthesize** a Blender Python script with a user-selected LLM (open or closed source), prompted with the retrieved examples.
4. **Execute** the script in the active Blender session, leaving the mesh selected for further editing.

**Links:**
[Code](https://github.com/MaxRondelli/BlenderRAG) ·
[Paper (arXiv)](https://arxiv.org/abs/2605.00632) ·
[Dataset (Hugging Face)](https://huggingface.co/datasets/MaxRondelli/BlenderRAG) ·
[Project page](https://maxrondelli.github.io/BlenderRAG/)

Paper: {% cite rondelli2026blenderrag %}
