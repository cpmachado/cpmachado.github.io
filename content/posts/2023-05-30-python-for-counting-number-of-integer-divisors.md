---
layout: post
title: "Counting integer divisors"
date: "2023-05-30 18:37:46 +0100"
tags: [dev,mathematics,python,discrete-mathematics]
---

TL&DR: Although I've been using Python for years, its set notation still
amazes me for its expressiveness. In this case to count integer divisors,
given a specific predicate.

---

# Context

This semester I'm doing a course on [Discrete Mathematics].
I had an exercise to count integer divisors of a given number, which weren't
divisible by another given number.

To verify my reply, which involved a bit more of analysis, Python enabled me
to write a quick script that could do it.

I'll link up my proper solution in Portuguese at a later date.


# The question

Count the number of integer divisors of 37800, which aren't divisible by 6.

# The script

```python
n = 37800
k = 6
p = (lambda i, n, k: n % i == 0 and i % k != 0)
s = (lambda n, p, k:
    [i for i in range(1, n + 1)
        if p(i, n, k)])
A = s(n, p, k)
print(len(A)) # 42, I wonder why? :-P
```

Description:
- n: Our number
- p: Predicate, which is that it is a divisor and not divisible by 6
- s: Sequence generator, given n and a predicate
- A: The set of integer divisors verifying the predicate


[Discrete Mathematics]: https://guiadoscursos.uab.pt/en/ucs/matematica-finita/
