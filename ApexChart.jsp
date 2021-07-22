<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">

<!-- Bootstrap JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<style>
#chart {
	width: 800px;
	height: 500px;
	margin: 0 auto;
	display: block;
}

#id_btn {
	text-align: center;
	display: block;
	margin: 0 auto;
}
</style>

<body>

	<br>
	<input id="id_btn" type=button value="실행" onclick="f_chg()"
		class="btn btn-outline-secondary btn-lg">
	<div>
		<div id="chart" style="width: 800px; height: 500px"></div>
	</div>

	<script>
		function f_chg() {
			for (var i = 0; i <= options.series[0].data.length - 1; i++) {

				var ranColor1 = Math.round(Math.random() * 255) + 0;
				var ranColor2 = Math.round(Math.random() * 255) + 0;
				var ranColor3 = Math.round(Math.random() * 255) + 0;

				options.series[0].data[i] = Math.round(Math.random() * 60) + 0;
				//console.log(options.series[0].data[i]);
				/* 			options.chart.type = "area";
				 options.stroke.curve = "smooth"; */
				//options.grid.row.colors[0] = "f3f3f3"
				console.log(options.fill.colors[0]);
				options.fill.colors[0] = 'rgb(' + ranColor1 + ',' + ranColor2
						+ ',' + ranColor3 + ')'
			}
			setTimeout(f_chg, 1000);
			chart.update();
			chart.render();
		}

		var options = {
			series : [ {
				name : "Desktops",
				data : [ 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 16, 17,
						18, 19, 20 ]
			} ],
			chart : {
				height : 350,
				type : 'area',
				zoom : {
					enabled : false
				}
			},
			dataLabels : {
				enabled : false
			},
			stroke : {
				curve : 'smooth'
			},
			fill : {
				colors : [ 'rgba(20, 99, 132)' ]
			},
			title : {
				text : '랜덤',
				align : 'center',
			},
			grid : {
				row : {
					colors : [ '#f3f3f3', 'transparent' ], // takes an array which will be repeated on columns
					opacity : 0.5
				},
			},
			xaxis : {
				categories : [ '1', '2', '3', '4', '5', '6', '7', '8', '9',
						'10', '11', '12', '13', '14', '15', '16', '17', '18',
						'19', '20' ],
			}
		};

		var chart = new ApexCharts(document.querySelector("#chart"), options);
		chart.render();
	</script>
</body>
</html>
