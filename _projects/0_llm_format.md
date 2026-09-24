---
layout: page
title: "From Reasoning to Code: GRPO for Underrepresented Languages"
description: Reinforcement learning with interpreter feedback to teach small LLMs to write Prolog
importance: 1
category: research
badge: TPLP
authors: Federico Pennino, Bianca Raimondi, <em>Massimo Rondelli</em>, Andrea Gurioli, Maurizio Gabbrielli
period: Theory and Practice of Logic Programming, 2026 · Python, GRPO, Qwen2.5-Coder, SWI-Prolog
summary: Small Qwen2.5-Coder models (0.5B–7B) are trained with Group Relative Policy Optimization to solve GSM8K problems by reasoning and then writing Prolog. Each answer is executed by a live SWI-Prolog interpreter inside the RL loop, and a composite reward scores both logical correctness and output structure, improving reasoning quality and code accuracy on underrepresented languages.
code: https://github.com/biancaraimondi/LLM_Format
paper: https://doi.org/10.1017/S1471068426100489
arxiv: 2506.11027
related_publications: true
---

Large Language Models write fluent Python but struggle with **underrepresented languages such as Prolog and Lisp**, where public training data is scarce.
This project introduces a generalizable **reinforcement learning** approach: small versions of **Qwen2.5-Coder** are fine-tuned with **Group Relative Policy Optimization (GRPO)**, and the reward comes from actually **executing the generated code**.

**How it works.**
The model is trained on GSM8K math word problems and must answer each one in a fixed structure:

```
<reasoning> ...chain-of-thought reasoning... </reasoning>
<code>      ...Prolog facts and rules...     </code>
<query>     ...Prolog query for the answer... </query>
```

At training time the generated knowledge base and query are run against a live **SWI-Prolog** interpreter (via `pyswip`, with a 5-second timeout).
A composite reward combines a correctness signal (the numerical answer matches the ground truth) with partial credit for respecting the output format, so the model learns both to reason and to produce valid, executable code.

**Setup.**
Qwen2.5-Coder-Instruct at 0.5B, 1.5B, 3B and 7B parameters, trained with 4-bit quantization and LoRA (rank 32), in zero-, one- and five-shot prompting modes.

**Links:**
[Code](https://github.com/biancaraimondi/LLM_Format) ·
[Paper (TPLP)](https://doi.org/10.1017/S1471068426100489) ·
[arXiv](https://arxiv.org/abs/2506.11027)

Paper: {% cite pennino2026reasoning %}
