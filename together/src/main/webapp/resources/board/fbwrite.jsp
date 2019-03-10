<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>together : 함께하는 여행</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/include/toplink.jsp"%>
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
		<div id="colorlib-main">


			<!-- main content -->
			<div class="container themain">
				<div class="row justify-content-center mb-5 pb-2">
					<div class="col-md-7 heading-section text-center ftco-animate">
						<h2 class="mb-4">자유게시글</h2>
						<p>자유롭게 하고싶은 말을 해보세요</p>
						<p>사람들과 즐거운 이야기를 나누어보세요</p>
					</div>
				</div>
				<form class="freeform" action="${ pageContext.request.contextPath }/resources/board/board.jsp">
					<div class="form-group">
						<label for="formGroupExampleInput">제목</label> <input type="text"
							class="form-control" id="formGroupExampleInput">
					</div>
					<div class="form-group">
						<label for="formGroupExampleInput2">내용</label>
						<textarea class="form-control" id="formGroupExampleInput2"
							rows="12"></textarea>
						<button type="submit" class="btn btn-primary mt-3 sbmbtn">등록</button>
					</div>

				</form>
			</div>

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
