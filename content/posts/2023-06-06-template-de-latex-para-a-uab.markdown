---
layout: post
title: "Template de latex para a UAb"
date: "2023-06-06 16:25:50 +0100"
tags: [dev]
mathjax: true
---

Mal comecei a tirar a [Licenciatura de Matemática e Aplicações], na
Universidade Aberta([UAb]), vi uma
necessidade em criar templates de $$\LaTeX$$ para os meus trabalhos. No
decorrer do primeiro semestre, fui desenvolvendo este template, que reside no
repositório:

> <https://github.com/cpmachado/uab-efolio-template>

Actualmente suporta tudo o que um estudante de Matemática pode necessitar para
cadeiras de 1º ano, excepto no que toca a código. Este é um tema que sempre
assombrou, porque nunca gostei das listagens de código. Se tiver uma boa
ideia, por amor de Deus, envie um [e-mail](mailto:cpmachado@protonmail.com).

Actualmente, além do costume, este tem funcionalidades para lidar com:

- Capa: Tem um template da capa, com as imagens fornecidas pela [UAb], nos
    seus templates de Word.
- Matrizes: incluindo os extendidos para alinhar elementos, com o mathtools.
- Teoremas: Define ambientes para Teorema e Proposição, e possui o pacote
    thmtools, que permite a listagem dos mesmos.
- Bibliografia: usando o biblatex, dado que tive más experiências com o
    default.

Estou sempre a pensar em mais funcionalidades, pelo que se tiver uma ideia,
envie um e-mail.

[Licenciatura de Matemática e Aplicações]: https://guiadoscursos.uab.pt/cursos/licenciatura-em-matematica-e-aplicacoes/
[UAb]: https://uab.pt
