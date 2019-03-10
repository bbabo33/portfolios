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
		<!-- 동행게시글 쓰기 폼 -->

			<section class="ftco-section">
				<div class="container">
					<div class="row justify-content-center mb-5 pb-2">
						<div class="col-md-7 heading-section text-center ftco-animate">
							<h2 class="mb-4">공지사항</h2>
						</div>
					</div>
					<div class="row">
						<div class="blog-entry ftco-animate accompanyWrite">
							<form name="travelPlanForm" action="${ pageContext.request.contextPath }">
								<div class="board_all_div">
									<div class="board_search">
										<select>
											<option value="전체글">전체글</option>
											<option value="운영자">운영자</option>
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
												<td><a href="${ pageContext.request.contextPath }/resources/board/vegeBoard_detail.jsp"> [공지사항] 채식게시판 양식변경안내 </a></td>
												<td>운영자</td>
												<td>2018-12-19</td>
											</tr>
											<tr>
												<td>2</td>
												<td><a href="${ pageContext.request.contextPath }/resources/board/vegeBoard_detail.jsp"> [공지사항] 동행 글쓰기 관련 안내 </a></td>
												<td>운영자</td>
												<td>2018-12-18</td>
											</tr>
											<tr>
												<td>1</td>
												<td><a href="${ pageContext.request.contextPath }/resources/board/vegeBoard_detail.jsp"> [공지사항] 사이트 이용관련 </a></td>
												<td>운영자</td>
												<td>2018-12-17</td>
											</tr>
										</table>
										<!-- <input type="submit" value="글쓰기" class="btn btn-primary py-3 px-5 board_btn"> -->
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