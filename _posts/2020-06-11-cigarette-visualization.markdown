---
layout: post
title: "Cigarette Visualization"
date: "2020-06-11 12:41:20 +0100"
category: journal
---

Data visualization of my tobacco use.
Updated every couple of days.

> First published on 2020-06-01 17:04:25 +0100
>
> Edited:
> - 2020-06-03 12:25:43 +0100
> - 2020-06-03 17:42:55 +0100
> - 2020-06-05 07:53:58 +0100
> - 2020-06-09 01:45:03 +0100
> - 2020-06-11 12:41:20 +0100

I started the day, by contemplating the need to change some habits. The other
day, I decided to buy some shag tobacco. To evaluate the efficiency and the
overall smoking habits of little old me, I decided to try to graph it here.

Using ***Chart.js***, I don't know if people are still using it nowadays. It
has been some year, since my last data visualization project/job.


<canvas id="cigaretteViz"></canvas>
<script src="/res/chart.js"></script>

<script>
	var ctx = document.getElementById('cigaretteViz').getContext('2d');
	var options = {
		title: {
			display: true,
			text: 'My smoking statistics'
		},
		legend: {
			position: 'bottom'
		},
		tooltips: {
			mode: 'index',
			intersect: false
		},
		hover: {
			mode: 'nearest',
			intersect: true
		},
		scales: {
			xAxes: [{
				display: true,
				scaleLabel: {
					display: true,
					labelString: 'Days'
				}
			}],
			yAxes: [{
				display: true,
				scaleLabel: {
					display: true,
					labelString: 'Number of Cigarettes'
				}
			}]
		}
	};

	{% assign series = site.data.cigs.series %}
	var series = {{series | jsonify}};
	/* bump apropriately by property name */
	function bap(pname) {
		return series.map(function(e) {
			return (e[pname]? e[pname]: 0);
		});
	};

	var smoked = {
		label: 'Smoked',
		borderColor: 'purple',
		cubicInterpolationMode: 'monotone',
		data: bap('smoked')
	};
	var savg = [];
	smoked.data.reduce(((a, b, i) => {
		savg[i] = Math.round((a + b) / (i + 1) * 10) / 10;
		return a + b;
	}), 0);
	var avg_smoked = {
		label: 'Average smoked',
		borderColor: 'blue',
		fill: false,
		borderDash: [5, 5],
		cubicInterpolationMode: 'monotone',
		data: savg
	};
	var marlboro = {
		label: 'Marlboro',
		borderColor: 'red',
		fill: false,
		cubicInterpolationMode: 'monotone',
		data: bap('marlboro')
	};
	var amber = {
		label: 'Amber leaf',
		borderColor: 'yellow',
		fill: false,
		cubicInterpolationMode: 'monotone',
		data: bap('amber')
	};
	var bummed = {
		label: 'Bummed',
		borderColor: 'black',
		fill: false,
		cubicInterpolationMode: 'monotone',
		data: bap('bummed')
	};
	var golden = {
		label: 'Golden Virginia',
		borderColor: 'green',
		fill: false,
		cubicInterpolationMode: 'monotone',
		data: bap('golden')
	};
	var port_red = {
		label: 'Portuguese Red',
		borderColor: 'pink',
		fill: false,
		cubicInterpolationMode: 'monotone',
		data: bap('portuguese_red')
	};
	var camel = {
		label: 'Camel',
		borderColor: 'orange',
		fill: false,
		cubicInterpolationMode: 'monotone',
		data: bap('camel')
	};


	var chart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: bap('day'),
			datasets: [smoked, avg_smoked, marlboro, amber, bummed, golden,
			port_red, camel]
		},
		options
	});
</script>




## The Data:

Stored in the repo in [\_data/cigs.json](https://github.com/cpmachado/cpmachado.github.io/blob/master/_data/cigs.json).

Also [here](/res/cigs.json).

<div style="background:grey;padding:10px">
	<h3 style="text-align:center"> Update </h3>
	<p> Just came to update the numbers. I managed to make 57 cigarettes out of
	a 30g <b>Amber Leaf</b> bag.</p>
	<p>I do need to start smoking less, or leave it altogether.</p>
	<p>Decided to gradually stop until the 16th of June.</p>
</div>

<div style="background:yellow;padding:10px">
	<h3 style="text-align:center"> Last Update </h3>
	<p> Managed to make 112 cigarettes out of
	a 50g <b>Golden Virginia</b> bag.</p>
	<p> Managed to make 103 cigarettes out of
	a 50g <b>Amber Leaf</b> bag.</p>
	<p> Going to post a table below the comments, analysing superficially the
	consumption efficiency</p>
</div>

<div style="padding:10px">
	<table style="background:white;text-align:center">
		<tr>
			<th>
				Tobacco
			</th>
			<th>
				Quantity(g)
			</th>
			<th>
				Cigarrete
			</th>
			<th>
				Tobacco per cigarrete(g)
			</th>
		</tr>
		<tr>
			<td>
				Amber Leaf
			</td>
			<td>
				30g
			</td>
			<td>
				57
			</td>
			<td>
				0.526 g
			</td>
		</tr>
		<tr>
			<td>
				Golden Virginia
			</td>
			<td>
				50g
			</td>
			<td>
				112
			</td>
			<td>
				0.446 g
			</td>
		</tr>
		<tr>
			<td>
				Amber Leaf
			</td>
			<td>
				50g
			</td>
			<td>
				103
			</td>
			<td>
				0.485 g
			</td>
		</tr>
	</table>
</div>
