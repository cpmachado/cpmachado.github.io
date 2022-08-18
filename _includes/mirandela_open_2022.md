{% assign rounds = site.data.mirandela_open_2022.rounds %}
{% assign player = site.data.mirandela_open_2022.player %}
{% assign win = 0 %}
{% assign loss = 0 %}
{% assign draw = 0 %}
{% assign round_number = include.round_number %}
{% assign the_round = null %}
{% assign rating_change = 0 %}

{% for round in rounds %}

  {% if round.number == include.round_number %}
    {% assign the_round = round %}
  {% endif %}

  {% if round.result == 1 %}
    {% assign win = win | plus: 1 %}
  {% elsif round.result == 0 %}
    {% assign loss = loss | plus: 1 %}
  {% elsif round.result == 0.5 %}
    {% assign draw = draw | plus: 1 %}
  {% endif %}

  {% assign rating_change = rating_change | plus: round.rating_change %}
{% endfor %}

{% assign balance = win | minus: loss %}
{% assign points = 0.5 | times: draw | plus: win %}

> Mirandela Open 2022 General Results
>
> \+ {{ win }} - {{ loss }} = {{ draw }}
>
> Points: {{ points }}
>
> Balance: {{ balance }}
>
> Rating Change: {{ rating_change }}

{% if the_round != null %}

  {% include round_result.md round=the_round player=player %}

{% endif %}

