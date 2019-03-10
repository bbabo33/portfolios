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
	$(document).ready(function() {
		$('#fbWrite').click(function() {
			location.href="${ pageContext.request.contextPath }/resources/board/fbwrite.jsp";
		});
	});
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
				<div class="container">
					<div class="row justify-content-center mb-5 pb-2">
						<div class="col-md-7 heading-section text-center ftco-animate">
							<h2 class="mb-4">자유 게시판</h2>
						</div>
					</div>
					<div class="row">
						<div class="blog-entry ftco-animate accompanyWrite">
							<form name="travelPlanForm">
								<div class="board_all_div">
									<div class="board_search">
										<select>
											<option value="전체글">전체글</option>
											<option value="제목">제목</option>
											<option value="글쓴이">글쓴이</option>
										</select>
										<p class="board_search_p">
											<input type="text" title="검색" maxlength="255" class="snb_search_text">
											<button type="submit" class="board_search_btn">검색</button>
										</p>
									</div>
									
									<!-- 게시판 리스트 시작 -->
									<div class="board_list">
										<table class="list">
											<tr>
												<th width="8%">번호</th>
												<th>제목</th>
												<th width="16%">글쓴이</th>
												<th width="20%">등록일</th>
											</tr>
											<tr>
												<td>3</td>
												<td><a href="javascript:doAction('3')"> 안녕하세요 </a></td>
												<td>KDH</td>
												<td>2018-12-19</td>
											</tr>
											<tr>
												<td>2</td>
												<td><a href="javascript:doAction('2')"> 안녕하세요 </a></td>
												<td>KDH</td>
												<td>2018-12-18</td>
											</tr>
											<tr>
												<td>1</td>
												<td><a href="javascript:doAction('1')"> 안녕하세요 서울사는
														남자에요 </a></td>
												<td>KDH</td>
												<td>2018-12-17</td>
											</tr>
										</table>
										<input type="button" value="글쓰기" class="btn btn-primary py-3 px-5 board_btn" id="fbWrite">
									</div><!-- end board_list 게시판 리스트 끝 -->
									<div class="list_page">
										<ul>
											<li><a href="#">&laquo;</a></li>
											<li><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">4</a></li>
											<li><a href="#">5</a></li>
											<li><a href="#">&raquo;</a></li>
										</ul>
									</div>
								</div><!-- // end  전체 감싸고있는 div -->
							</form>
						</div>
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