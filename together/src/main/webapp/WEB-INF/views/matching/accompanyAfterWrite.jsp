<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


			<section class="ftco-section">
				<div class="container">
					<!-- title -->
					<div class="row justify-content-center mb-5 pb-2">
						<div class="col-md-7 heading-section text-center ftco-animate">
							<h2 class="mb-4">Together Review</h2>
							<p>It is the place to write the testimony</p>
							<p>Please tell your adventure</p>
						</div>
					</div>

					<div class="row">
						<div class="blog-entry ftco-animate accompanyWrite">
							<form name="travelPlanForm" action="accompanyAfterWriteUp"
								enctype="multipart/form-data" method="post">
								<input type="hidden" name="writer" value="${userVO.name}">
								<input type="hidden" name="email" value="${userVO.email }">
								<!-- <div class="form-align"> -->

								<div class="datePakage">
									<!-- <div class="form-travelSpot"></div> -->
									<dl>
										<dt class="form-travelSpot">Title</dt>
										<dd class="form-travelSpot">
											<input type="text" class="accompanyWrite" size="30"
												name="title">
										</dd>
									</dl>
									<dl class="form-travel_con">
										<dt class="form-travelSpot">Content</dt>
										<dd class="form-travelSpot">
											<textarea rows="12" cols="30" class="accompanyWrite"
												name="content"></textarea>
										</dd>
									</dl>
									<div>
										<input type="file" name="attachFile" value="이미지등록">
									</div>
									<div class="form-travel_btn">
										<input type="button" value="cancel"
											class="btn btn-primary py-3 px-5 accompanyWriteBtn"
											onclick="window.location.href='${pageContext.request.contextPath}/matching/accompanyAfter'">
										<input type="submit" value="Submit"
											class="btn btn-primary py-3 px-5 accompanyWriteBtn">
									</div>
								</div>
								<!-- // datePakage -->
							</form>
						</div>
						<!-- // blog-entry ftco-animate accompanyWrite -->
					</div>
					<!-- // row -->


				</div>
				<!-- // container -->
			</section>
			<!-- end section -->

			<!-- <form name="form" id="form" method="post">
                도로명주소(한글) <input type="text"  style="width:500px;" id="korAddr"  name="korAddr" />
             </form> -->

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

	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.datetimepicker.js"></script>
</body>
</html>