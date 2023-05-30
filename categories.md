---
layout: post
title: Categories
permalink: /categories
---

List of Categories:
<ul>
{% for category in site.categories %}
{% assign name = category | first %}
{% assign url = name | append: ".html" | relative-url %}
<li>
<a href="{{url}}">
  {% assign arr = name | split: "-" %}
  {% for word in arr %}
  <span> {{ word | capitalize }}</span>
  {% endfor %}
</a>
</li>
{% endfor %}
</ul>
