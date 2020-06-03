---
layout: post
title: "Cigarette Visualization"
date: "2020-06-03 12:25:43 +0100"
category: journal
---

Data visualization of my tobacco use.
Updated every couple of days.

> First published on 2020/06/012020-06-01 17:04:25 +0100
>
> Edited:
> - 2020-06-03 12:25:43 +0100

I started the day, by contemplating the need to change some habits. The other
day, I decided to buy some shag tobacco. To evaluate the efficiency and the
overall smoking habits of little old me, I decided to try to graph it here.

Using ***Chart.js***, I don't know if people are still using it nowadays. It
has been some year, since my last data visualization project/job.


<canvas id="cigaretteViz"></canvas>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<script>
	var ctx = document.getElementById('cigaretteViz').getContext('2d');
	var options = {
		responsive: true,
		title: {
			display: true,
			text: 'My smoking statistics'
		},
		tooltips: {
			mode: 'index',
			intersect: false,
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
	function bap(pname) {
		return series.map(function(e) {
			return (e[pname]? e[pname]: 0);
		});
	}

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
	var amber = {
		label: 'Amber leaf',
		borderColor: 'yellow',
		fill: false,
		cubicInterpolationMode: 'monotone',
		data: bap('amber')
	};
	var marlboro = {
		label: 'Marlboro',
		borderColor: 'red',
		fill: false,
		cubicInterpolationMode: 'monotone',
		data: bap('marlboro')
	}
	var golden = {
		label: 'Golden Virginia',
		borderColor: 'green',
		fill: false,
		cubicInterpolationMode: 'monotone',
		data: bap('golden')
	}
	var bummed = {
		label: 'Bummed',
		borderColor: 'black',
		fill: false,
		cubicInterpolationMode: 'monotone',
		data: bap('bummed')
	}

	var chart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: bap('day'),
			datasets: [smoked, avg_smoked, amber, marlboro, golden, bummed]
		},
		options
	});
</script>




## The Data:

Stored in the repo in [\data/cigs.json](https://github.com/cpmachado/cpmachado.github.io/blob/master/_data/cigs.json).

<div style="background:yellow;padding:10px">
	<h3 style="text-align:center"> Update </h3>
	<p> Just came to update the numbers. I managed to make 57 cigarettes out of
	a 30g <b>Amber Leaf</b> bag.</p>
	<p>I do need to start smoking less, or leave it altogether.</p>
</div>


