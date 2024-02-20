---
layout: post
title: "p^{mdc(a,b)} = 1 mod n"
date: "2023-06-02 23:24:17 +0100"
tags: [mathematics,discrete-mathematics]
mathjax: true
---


***Teorema***:

Seja $$p \in \mathbb{Z}$$, e $$a, b, n \in \mathbb{N}$$, se
$$p^a \equiv 1 \text{ mod } n$$ e $$p^b \equiv 1 \text{ mod } n$$,
então $$p^{\text{mdc}(a,b)} \equiv 1 \text{ mod } n$$.

***Demonstração***:

Seja $$a,b \in \mathbb{N}$$, pelo Teorema de Bachet-Bézout
{% cite Martinez -L Teorema -l Teorema 1.7 %}, existe
$$x, y \in \mathbb{Z}$$, tal que $$ax + by = \text{mdc}(a, b)$$, então:

$$ p^{\text{mdc}(a, b)} = p^{ax + by} = (p^a)^x \cdot (p^b)^y \equiv 1^x
\cdot 1^y \text{ mod } n \equiv 1 \text{ mod } n$$

q.e.d.


## Bibliografia

{% bibliography --cited %}


