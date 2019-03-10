<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<title>together : 함께하는 여행</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/include/toplink.jsp"%>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
 -->
<!--목요일 주석 : bottomlink.jsp에 chart.js 추가해야 작동  -->
</head>
<body>

	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"> <i></i>
		</a>

		<!-- aside 좌측 메뉴 -->
		<%-- <jsp:include page="/WEB-INF/views/include/aside.jsp" /> --%>

		<!-- header 상단 메뉴 -->
		<jsp:include page="/WEB-INF/views/include/topMenuadmin.jsp" />

		<!-- main, footer -->

			<!-- main content -->
			<br><br><br><br>
			<div class="container">
				<div class="row justify-content-center mb-5 pb-2">
					<div
						class="col-md-7 heading-section text-center ftco-animate signwrape chartdiv">
						<!-- Area Chart Example-->
						<div class="card mb-3 ">
							<div class="card-header">
								<h4>&nbsp;WebSite visitor count</h4>
							</div>
							<div class="card-body">
								<canvas id="myAreaChart" width="100%" height="30"></canvas>
								<canvas id="myAreaChart2" width="100%" height="30"></canvas>
							</div>
							<div class="card-footer small text-muted">Updated
								2018/12/19 at 11:59 PM</div>
						</div>
					</div>
				</div>
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Data Table Example
					</div>
					<div class="card-body">
						<div class="piecanvas">
							<canvas id="chart-area"></canvas>
						</div>
						<div class="piecanvas mb-3">
							<canvas id="chart-area2"></canvas>
						</div>
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th width="50%">게시판 종류</th>
										<th width="50%">게시글 수</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>채식 게시판</td>
										<td>72</td>
									</tr>
									<tr>
										<td>동행 게시판</td>
										<td>392</td>
									</tr>
									<tr>
										<td>자유 게시판</td>
										<td>336</td>
									</tr>
								</tbody>
							</table>
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th width="50%">페이스북 사용자</th>
										<td>1572 명</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th width="50%">사이트 회원</th>
										<td>3668 명</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="card-footer small text-muted">Updated 2018/12/19
						at 11:59 PM</div>
				</div>
			</div>
			<!-- // end container -->

			<!-- footer  -->
			<%@ include file="/WEB-INF/views/include/footer.jsp"%>
			<script src="${ pageContext.request.contextPath }/resources/js/Chart.js"></script>
		<!-- END COLORLIB-MAIN -->
	</div>
	<!-- END COLORLIB-PAGE -->

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#e89981" /></svg>
	</div>

	<%@ include file="/WEB-INF/views/include/bottomlink.jsp"%>
	<script>
		//아..
		Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		Chart.defaults.global.defaultFontColor = '#292b2c';

		// 이게 다 뭐여
		var ctx = document.getElementById("myAreaChart"); //캔버스 찾음
		var randomScalingFactor = function() {
			return Math.round(Math.random() * 100);
		};

		var config = {
			type: 'pie',
			data: {
				datasets: [{
					data: [
						9,
						42,
						49,
					],
					backgroundColor: [
						"rgba(254,226,215,0.8)",
						"rgba(235,130,152,0.3)",
						"rgba(232,153,129,0.4)",
					],
					label: 'Dataset 1'
				}],
				labels: [
					'채식 게시판',
					'자유 게시판',
					'동행 게시판'
				]
			},
			options: {
				responsive: true
			}
		};
		var config2 = {
				type: 'pie',
				data: {
					datasets: [{
						data: [
							68,
							32,
						],
						backgroundColor: [
							"rgba(232,153,129,0.8)",
							"rgba(59,130,152,0.7)",
						],
						label: 'Dataset 1'
					}],
					labels: [
						'기존 이용자',
						'페이스북 이용자',
					]
				},
				options: {
					responsive: true
				}
			};
		window.onload = function() {
			var ctx2 = document.getElementById('chart-area').getContext('2d');
			window.myPie = new Chart(ctx2, config);
			var ctx3 = document.getElementById('chart-area2').getContext('2d');
			window.myPie = new Chart(ctx3, config2);
		};
		var myLineChart = new Chart(ctx, { //차트 하나 새로 생성
			type : 'line', //선형 차트
			data : {
				labels : [ "1월", "2월", "3월", "4월", "5월", //밑에 값
				"6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
				datasets : [ {
					label : "사이트 방문자 수", //뭐에 대한 그래프인가?
					lineTension : 0.3, //얼마나 구부려져있는가? 높을수록 쇠막대기에 불로 달군거처럼 휨
					backgroundColor : "rgba(232,153,129,0.2)", //차트 수치의 뒷배경 색
					borderColor : "rgba(232,153,129,1)", //선 색깔
					pointRadius : 5, //점 좌표의 둥글기
					pointBackgroundColor : "rgba(232,153,129,1)", //점의 배경색
					pointBorderColor : "rgba(252,153,129,0.8)", //그래프의 동그란 점의 border
					pointHoverRadius : 5, //hover시 둥글기
					pointHoverBackgroundColor : "rgba(252,153,129,1)", // 점 hover 색깔
					pointHitRadius : 50, //
					pointBorderWidth : 2,
					data : [ 323, 824, 1863, 1682, 1471, 2265, 3689, 2989,
							5128, 4680, 6892, 13881 ],
				} ],
			},
			options : {
				scales : {
					xAxes : [ { //x값
						time : {
							unit : 'date'
						},
						gridLines : {
							display : false
						},
						ticks : {
							maxTicksLimit : 8
						}
					} ],
					yAxes : [ { //y값
						ticks : {
							min : 0, //좌측값 최저치
							max : 15000, //		 최고치
							maxTicksLimit : 6
						// 
						},
						gridLines : {
							color : "rgba(0, 0, 255, .125)", //외각선
						}
					} ],
				},
				legend : {
					display : false
				}
			}
		});
	</script>
</body>
</html>
