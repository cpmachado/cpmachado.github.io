{% assign player = include.player %}
{% assign colour = include.colour %}
{% assign is_opponent = include.is_opponent %}

> {% if is_opponent %} **Opponent** {% endif %}
>
> {% if player.title %} **{{ player.title }}** {% endif %}
> {{ player.name }} ({{ player.rating}})
>
> {% if player.fide_id %} **Fide ID:** [{{ player.fide_id }}] {% endif %}
>
> {% if player.observations %} Obs: ***{{ player.observations }}*** {% endif %}
>
> Playing as: {{ colour }}

[{{ player.fide_id }}]: https://ratings.fide.com/profile/{{ player.fide_id }}
