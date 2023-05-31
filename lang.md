---
layout: post
title: Languages
permalink: /lang
---

List of Languages:

{%-assign enposts = site.posts | where: 'lang', 'en' %}
{%-assign ptposts = site.posts | where: 'lang', 'pt' %}

- [English](en): {{ enposts | size }}
- [Portuguese](pt): {{ ptposts | size }}

