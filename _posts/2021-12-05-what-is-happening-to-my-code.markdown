---
layout: post
title: "What is happening to my code?"
date: "2021-12-05 12:18:09 +0000"
author: cpmachado
category: dev
---

TL&DR: Rambling about how my code quality as been consistently decreasing.

EDITED:
- Tue, 07 Dec 2021 14:01:31 +0000
  + Added metadata and summary

---

> Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live.
>
> -- John Woods

## Background

My code has consistently been growing dumber over the last year. It might be the symptom of many causes.
Nevertheless, it frustrates me a bit.

Like Romero states about coders being artists, I abhor sloppy code, and the one that hurts the most, is my own.

Example(Sloppy code I've found somewhere):

```javascript
  async function foo(elems = []) {
    /* does some stuff...*/

    for (let i = 0; i <= elems.length - 1; i += 1) {
      const elem = elems[i];

      /* do some stuff, that are independent of each other ... */
      await somefoo1(elem);
      await somefoo2(elem);
      /* etc. */
    }
  }
```

Excused to say, I almost puked. Not only it isn't performant, it could be a text book case of sloppiness.

Fortunate for the unnamed developer, I'm no psychopath, but I could be.
To find one's address is easier than you might think.

On fixing this mess:

```javascript
  async function foo(elems = []) {
    /* does some stuff...*/

    await elems.forEach(async (elem) => {
      await Promise.all([ 
        somefoo1(elem),
        somefoo2(elem),
        /* some more foo's */
      ]);
      /* etc. */
    });
  }
```

Please e-mail me, if I messed up, because God knows I want to fix it.


## Challenge

Force and challenge myself with structured puzzles, like:

- [Project Euler](https://projecteuler.net/)
- [Advent of Code](https://adventofcode.com/2021)
- etc.

Goals:
1. Get into code shape.
2. Confidently and objectively assess these kind of situations.


## Conclusion

Let us see how far I reach, until I run out of steam, as chess is a priority for me, as well.

