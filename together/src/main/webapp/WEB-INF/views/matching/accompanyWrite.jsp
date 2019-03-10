<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<title>together</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/include/toplink.jsp"%>

<!-- date,time picker css-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/jquery.datetimepicker.min.css" />
<!-- 주소검색하여 마커, 주소텍스트 추가 및 form 유효성 검사 js파일  -->
<script
	src="${pageContext.request.contextPath}/resources/js/accompanyWrite_map_addrSearch.js"></script>
<script>	
	
	function goPopup(){
		// 주소검색을 수행할 팝업 페이지를 호출, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrEngUrl.do)를 호출하게 됩니다.
		var pop = window.open("${pageContext.request.contextPath}/matching/matchingPopUp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	
	function jusoCallBack(roadFullAddr, roadAddr, addrDetail, jibunAddr, zipNo, admCd, rnMgtSn, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, korAddr){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		console.log("line34: "+roadFullAddr, roadAddr, addrDetail, jibunAddr, zipNo, admCd, rnMgtSn, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, korAddr);
		cntLocation++;
		/* 위치 추가  */
		if(cntLocation <= 4){
			//console.log(cntLocation);
			//텍스트에 주소 추가하는 함수 실행
			addLocationList(korAddr, roadAddr);
		}else{
			alert("Maximum Adding location is 4");
		}
	}

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
			<!-- 모바일 헤더  -->
			<jsp:include page="/WEB-INF/views/include/topMenuMo.jsp" />

			<section class="ftco-section">
				<div class="container">
					<!-- title -->
					<div class="row justify-content-center mb-5 pb-2">
						<div class="col-md-7 heading-section text-center ftco-animate">
							<h2 class="mb-4">Together Write</h2>
							<p>Please find your travel partner</p>
							<p>Enjoy the happiness of the day that others will not
								experience</p>
						</div>
					</div>
					<div class="row">
						<div class="blog-entry ftco-animate accompanyWrite">
							<form name="travelPlanForm"
								action="${ pageContext.request.contextPath }/matching/accompanyWriteUp"
								method="post" onsubmit="return inputInfo()">
								<input type="hidden" id="kor" name="korLocations" value="">
								<input type="hidden" id="eng" name="engLocations" value="">
								<input type="hidden" id="langs" name="languages" value="">
								<input type="hidden" name="writer" value="${userVO.name}">
								<input type="hidden" name="email" value="${userVO.email }">

								<div class="form-travelSpot-top">
									<div class="form-travelSpot" id="travelSpotInfo">Travel
										Location</div>
									<div class="form-travelSpot" id="travelSpotBtn">
										<input type="button" value="Add Location"
											class="btn btn-primary py-3 px-5" class="accompanyWriteBtn"
											onClick="goPopup()">
									</div>
								</div>

								<div class="form-align">
									<div class="form-travelSpot">
										<div id="map"></div>
									</div>

									<!-- 지도 api , id='map' 인 div 보다 밑에 있어야 함  -->
									<script>
										var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
										    mapOption = {
										        center: new daum.maps.LatLng(37.5532017297038, 126.97280752153232), // 지도의 중심좌표
										        level: 4 // 지도의 확대 레벨
										    };  
										
										// 지도를 생성합니다    
										var map = new daum.maps.Map(mapContainer, mapOption);
										// 지도에 교통정보 표시 
										//map.addOverlayMapTypeId(daum.maps.MapTypeId.TRAFFIC);
									</script>
									<div>
										<div class="form-travelSpot locaAlert">
											Adding LocationList<span></span>
										</div>
										<div class="form-travelSpot">Korea address</div>
										<div id="korLocations" class="location_list"></div>
										<div class="form-travelSpot">English address</div>
										<div id="engLocations" class="location_list"></div>
									</div>

									<div class="datePakage">
										<div class="form-travelSpot">
											<div class="titleAlert">
												<b>Title</b><span></span>
											</div>
											<div>
												<input type="text" name="title"
													placeholder="please input your travelTitle here" size="100">
											</div>
										</div>
										<dl>
											<dt>Travel Schedule</dt>
											<dd class="form-travelSpot">Please be careful when you
												make a plan.</dd>
										</dl>

										<dl>
											<dt class="form-travelSpot dateAlert">
												Together Date <span></span>
											</dt>
											<dd class="form-travelSpot">
												<input type="text" id="datepicker1" class="accompanyWrite"
													size="10" name="matchingDate" readonly>
											</dd>
										</dl>
										<dl>
											<dt class="form-travelSpot timeAlert">Together Time</dt>
											<dd class="form-travelSpot">
												<input type="text" id="timepicker" class="accompanyWrite"
													size="10" name="matchingTime" readonly>
											</dd>
										</dl>
										<div class="datePakage msgAlert">Message</div>
										<div class="form-travelSpot">
											<textarea rows="5" cols="30" class="accompanyWrite"
												name="matchingMsg"></textarea>
										</div>
										<dl>
											<dt class="form-travelSpot remarkAlert">
												Remarks<span></span>
											</dt>
											<dd class="form-travelSpot">
												<div class="form-travelSpot">* Check language you can
													communicate</div>
												<div
													class="form-travelSpot langs join_checkbox remarks_checkbox">
													<label><input type="checkbox" name="language"
														value="korea">Korea</label> <label><input
														type="checkbox" name="language" value="english">English</label>
													<label><input type="checkbox" name="language"
														value="china">China</label>
												</div>
											</dd>
											<dt class="vegeAlert">
												* Are you a Vegetarian?<span></span>
											</dt>
											<dd class="form-travelSpot">
												<div class="form-travelSpot join_radio">
													<label><input type="radio" name="remarks" value="y">Yes,
														i'm a Vegetarian</label> <label><input type="radio"
														name="remarks" value="n">No, i'm not</label>
												</div>
											</dd>
										</dl>
									</div>
									<!-- // end datePakage -->
									<div>
										<input type="submit" value="Submit"
											class="btn btn-primary py-3 px-5" class="accompanyWriteBtn">
									</div>
								</div>
								<!-- form-align -->
							</form>
						</div>
						<!-- // end accompanyWrite -->
					</div>
					<!-- // end row -->
				</div>
				<!-- // end container -->
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

	<script src="${pageContext.request.contextPath}/resources/js/jquery.datetimepicker.js"></script>
	<script>
	
	$(document).ready(function() {
		$('#datepicker1').datetimepicker({
			 format:'Y-m-d',	//년, 월, 일만 나오게
		     timepicker:false,	//시간 안나오게
		     minDate:'-1970/01/01'	//오늘부터 캘린더 픽 할 수 있게 만듦
		     
		});
		
		$('#timepicker').datetimepicker({
			format:'H:i',		// 시간, 분 
			datepicker:false,	//달력 안나오게
			step : 15,
			
		});
    });
	
</script>

</body>
</html>