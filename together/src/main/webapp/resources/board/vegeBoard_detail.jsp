<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>together</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/include/toplink.jsp"%>
<!-- 음식점 상세내용 관련 -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/together/vegeBoardDetail.css">
<!-- Timepicker 관련 -->
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<!-- end timepicker -->

<!-- 제이쿼리 datepicker 관련  -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- end datepicker  -->

<!-- 제이쿼리 timepicker -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<!-- end timepicker -->

<!-- 제이쿼리 구버전과 최신버전의 혼용을 위한 쿼리소스 -->
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-migrate-3.0.1.min.js"></script>
<!-- migrate end -->

<!-- 카카오 맵 api -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5bf9ccbd97a21e86fc6689488b54cd2e"></script>

<script>

</script>
</head>
<body>
	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"> <i></i>
		</a>

		<!-- aside 좌측 메뉴 -->
		<jsp:include page="/WEB-INF/views/include/aside.jsp" />

		<!-- header 상단 메뉴 -->
		<jsp:include page="/WEB-INF/views/include/topMenu.jsp" />

		<!-- main, footer -->
		<!-- 동행게시글 쓰기 폼 -->
		<div id="colorlib-main">
			<%-- <!-- 모바일 헤더  -->
			<jsp:include page="/WEB-INF/views/include/topMenuMo.jsp" /> --%>

			<section class="ftco-section">
				<div class="container to_board_title">
					<div><h3>음식점 상세</h3></div>
				</div>
				<div class="KorRes_detail">
					<div id="KorRes_pic">
						<img id="KorRes_pic_main" alt="" src="${ pageContext.request.contextPath }/resources/images/KorResPic.jpg">
					</div>
					<div id="KorRes_texts">
						<div><h4>한국 비빔밥</h4></div>
						<div>
							<ul>
								<li><span>주소</span>서울시 강북구 송중동</li>
								<li><span>문의처</span>02)000-0000</li>
								<li><span>대표</span>김현주</li>
								<li><span>대표음식</span>스팸, 천하장사 소시지</li>
							</ul>
						</div>	
					</div>
					<div id="KorRes_texts_detail">
				
						<p><b>상세정보</b></p>
						
							 잔반정리 끝판왕. 밥에 각종 나물과 각종 장, 그리고 기타 재료(계란 등)을 넣고 비벼서 만드는 요리다. 
							고추장 대신 간장을 소스로 사용하는 경우도 있다. 매운 것을 잘 먹지 못하는 서양인에게 비빔밥을 만들어 줄 때 
							간장을 소스로 이용하곤 하는데, 윤식당2에서 간장 비빔밥이 주 메뉴로 등장한 바 있다.
					
					</div>
				</div>
			</section>
			<!-- end section -->

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