---
layout: post
title: Categories
permalink: /categories
---

List of Categories:
{% for category in site.categories %}
{% assign name = category | first %}
{% assign url = name | append: ".html" %}
- [{{ name | capitalize }}](/{{ url }})
{% endfor %}
