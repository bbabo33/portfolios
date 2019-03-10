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

<!-- 동행 후기 게시판 css-->
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/together/accompanyAfter.css"> --%>
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
							<h2 class="mb-4">together After</h2>
							<p>Share the days in your memories</p>
						</div>
					</div>
					<!-- // end title -->

					<!-- 동행 글 리스트 -->
					<div class="row">
						<!-- 동행 글 -->
						<c:forEach items="${afterlist}" var="board">
							<div class="col-md-4">
								<div class="blog-entry ftco-animate">

									<div class="travel_list">
										<a
											href="${ pageContext.request.contextPath }/matching/accompanyAfterDetail/${board.no}"
											class="img img-2"> 
											<c:forEach items="${imglist}" var="img">
												<c:if test="${img.boardno eq board.no}">
													<p class="travel_img"
														style="background-image: url(${pageContext.request.contextPath}/upload/review/${img.fileSaveName});"></p>
												</c:if>
											</c:forEach> <%-- <img class="" alt="여행지 사진" src="${ pageContext.request.contextPath }/resources/images/image_1.jpg"> --%>
											<span class="category mb-3 d-block">review</span>
											<h3 class="mb-4">${board.title}</h3>
										</a>
									</div>
									<div class="text text-2 pt-2 travle_info">
										<p class="mb-4">
											<br> ${board.regDate}<br>
										</p>
										<div class="author mb-4 d-flex align-items-center">
											<a href="#" class="img profile_info">
												<p
													style="background-image: url(${ pageContext.request.contextPath }/upload/userImg/${board.member.profileImg});"></p>
												<div class="ml-3 info">
													<span>작성자</span>
													<h3>
														${board.writer} <span>${board.regDate}</span>
													</h3>
												</div>
											</a>
										</div>
										<div class="meta-wrap align-items-center">
											<div class="half order-md-last">
												<p class="meta">
													<span><i class="icon-heart"></i>3</span> <span><i
														class="icon-eye"></i>${board.viewCnt}</span> <span><i
														class="icon-comment"></i>${board.commentCnt }</span>
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						<input type="submit" value="Write" style="margin-left: 78%;"
											class="btn btn-primary py-3 px-5" class="accompanyWriteBtn" onclick="window.location.href='${pageContext.request.contextPath}/matching/accompanyAfterWrite'">
						<!-- // end 동행 글 -->


						<!-- // end 동행 글 -->
					</div>
					<!-- // end 동행 글 리스트 -->
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
</body>
</html>