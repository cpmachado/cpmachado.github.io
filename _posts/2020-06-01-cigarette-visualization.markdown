---
layout: post
title: "Cigarette Visualization"
date: "2020-06-01 17:04:25 +0100"
category: journal
---

I started the day, by contemplating the need to change some habits. The other
day, I decided to buy some shag tobacco. To evaluate the efficiency and the
overall smoking habits of little old me, I decided to try to graph it here.

Using ***Chart.js***, I don't know if people are still using it nowadays. It
has been some year, since my last data viz project/job.

{% assign cigs = site.data.cigs %}

<canvas id="cigaretteViz"></canvas>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<script>
	var ctx = document.getElementById('cigaretteViz').getContext('2d');
	var labels = {{cigs.labels | jsonify}};
	var steppedLine = true;
	var options = {
		responsive: true,
		title: {
			display: true,
			text: 'Shag Cigarette Statistic'
		},
		tooltips: {
			mode: 'index',
			intersect: false,
		},
		hover: {
			mode: 'nearest',
			intersect: true
		}
	};
	var prod = {
		label: 'Rolled',
		borderColor: 'rgb(0, 255, 0)',
		cubicInterpolationMode: 'monotone',
		data: {{cigs.produced | jsonify}}
	};
	var smoked = {
		label: 'Smoked',
		borderColor: 'rgb(255, 0, 0)',
		cubicInterpolationMode: 'monotone',
		data: {{cigs.smoked | jsonify}}
	};
	var savg = [];
	smoked.data.reduce(((a, b, i) => {
		savg[i] = Math.round((a + b) / (i + 1) * 10) / 10;
		return a + b;
	}), 0);
	var avg_smoked = {
		label: 'Average smoked',
		borderColor: 'rgb(0, 0, 255)',
		cubicInterpolationMode: 'monotone',
		data: savg
	};

	var chart = new Chart(ctx, {
		type: 'line',
		data: {
			labels,
			datasets: [prod, smoked, avg_smoked]
		},
		options
	});
</script>




## The Data:

Yesterday(31st of May), I bought some Amber Leaf, and a pack of Marlboro XL.


I smoked the pack, and 6 hand rolled cigarettes



<table>
<thead>
<tr>
<td> Day </td>
<td> Smoked </td>
<td> Rolled </td>
</tr>
</thead>
<tbody>
{% for day in cigs.labels %}
<tr>
<td> {{day}} </td>
<td> {{cigs.smoked[forloop.index0]}}</td>
<td> {{cigs.produced[forloop.index0]}}</td>
</tr>
{%endfor%}
</tbody>
</table>


