{% assign round_number = include.round.number %}
{% assign game_date = include.round.date %}
{% assign result = include.round.result %}
{% assign rating_change = include.round.rating_change %}
{% assign player = include.player %}
{% assign opponent = include.round.opponent %}
{% assign player_colour = include.round.colour %}
{% assign opponent_colour = include.round.opponent_colour %}

> **Round {{ round_number }}**
>
> **Date:** {{ game_date }}
>
> **Result:** {{ result }}
>
> **Rating Change:** {{ rating_change }}

{% include round_player.md player=opponent colour=opponent_colour is_opponent=true %}
