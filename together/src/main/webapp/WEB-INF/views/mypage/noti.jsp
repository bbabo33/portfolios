<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<title>together</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/include/toplink.jsp"%>
<style>

</style>
</head>
<body>
	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle">
			<i></i>
		</a>
		
		<!-- aside 좌측 메뉴 -->
		<jsp:include page="/WEB-INF/views/include/aside.jsp" />
		
		<!-- header 상단 메뉴 -->
		<jsp:include page="/WEB-INF/views/include/topMenu.jsp" />
		
		<!-- main, footer -->
		<div id="colorlib-main">
			<!-- 모바일 헤더  -->
			<jsp:include page="/WEB-INF/views/include/topMenuMo.jsp" />
		

			<section class="ftco-section">
				<div class="container">
					<div class="row justify-content-center mb-5 pb-2">
						<div class="col-md-7 heading-section text-center ftco-animate">
							<h2 class="mb-4">알림</h2>
							<p></p>
						</div>
					</div>
					<div class="container py-2 ftco-animate alarmcon">
						<div class="dvdv row">
							<div id="myalarm" class="col-md my-3">
								<h6 class="regdate">2018/12/17</h6><h5>홍성진 님께서 쪽지를 보내셨습니다</h5> 
								서울에 처음 와보신다고요ㅋ?<br> 제가 강북은 빠삭하게...<br>
								<div class="col-md-1.5 ">
									<button class="btn alarmbu">바로가기</button>
								</div>
							</div>
						</div>
						<div class="dvdv row">
							<div id="myalarm" class="col-md my-3">
								<h6 class="regdate">2018/12/13</h6><h5>여행 지역의 거주자가 답변했습니다</h5>	
								제가 강남에 살아서 아는데 의외로 강남쪽은 신기한게...<br>
								<div class="col-md-1.5 ">
									<button class="btn alarmbu">바로가기</button>
								</div>
							</div>
						</div>
						<div class="dvdv row">
							<div id="myalarm" class="col-md my-3">
								<h6 class="regdate">2018/12/08</h6><h5>게시물에 댓글이 추가되었습니다</h5>		
								여행 일정이 3주인거에 비해 예산이 많이 부족한것같습니다 <br>교통비 말고도 음식을 먹을 돈이나...<br>
								<div class="col-md-1.5 ">
									<button class="btn alarmbu">바로가기</button>
								</div>
							</div>
						</div>
						<div class="dvdv row">
							<div id="myalarm" class="col-md my-3">
								<h6 class="regdate">2018/12/01</h6><h5>여행지의 거주자 21명이 현재 로그인중입니다 함께 대화를 나눠보세요!</h5> 
								서초구 매헌로 양재시민의숲,강남구 강남대로 94길<br>
								<div class="col-md-1.5 ">
									<button class="btn alarmbu">바로가기</button>
								</div>
							</div>
						</div>
						<!--<br>
						 <div>
						<button class="btn btn-secondary moreif"
							>더보기</button>
						</div> 
						<br>-->
						<br>	
					</div>
				</div>
			</section>
			
			<!-- footer  -->
		    <%@ include file="/WEB-INF/views/include/footer.jsp"%>


		</div>
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
</body>
</html>
