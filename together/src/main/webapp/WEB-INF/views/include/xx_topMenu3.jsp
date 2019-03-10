<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		// 헤더고정
		var jbOffset = $('.topMenu_nav').offset();
		$(window).scroll(function() {
			if ($(document).scrollTop() > jbOffset.top) {
				$('header').addClass('hFixed');
			} else {
				$('header').removeClass('hFixed');
			}
		});
			
 		// 메뉴 마우스오버 슬라이드 
		$('.top_menu1').mouseenter(function(){
			$('.sub_menu1').slideToggle(200);
		}); 
		$('.top_menu2').mouseenter(function(){
			$('.sub_menu2').slideToggle(200);
		}); 
		
		// 메뉴 마우스리버 되돌아가기
	 	 $('.top_menu1, .top_menu2').mouseleave(function() {
			$('.to_sub_menu').slideUp(200);
		});  
		
	});
</script>  

	<!-- web전용 큰화면 -->
	<header id="headerW">
		<nav class="topMenu_nav">
			<ul class="top_menu1">
				<li class="top_menu "><a href="">동행</a></li>
				<!-- 동행 서브 메뉴 -->
				<div class="to_sub_menu sub_menu1">
					<ul class=" ">
						<li class="toSub_menu"><a href="${ pageContext.request.contextPath }">동행 글 보기</a></li>
						<li class="toSub_menu"><a href="${ pageContext.request.contextPath }/resources/matching/accompanyWrite.jsp">동행 글 쓰기</a></li>
					</ul>
					<!-- 최신 동행글 3개 -->
					<div class="to_sub_list">
						<!-- 동행 글 -->
						<div class="travel_list">
							<a href="${ pageContext.request.contextPath }/resources/matching/accompanyDetail.jsp" class="img img-2" >
								<p class="travel_img" style="background-image: url(${ pageContext.request.contextPath }/resources/images/image_1.jpg);">
									<%-- <img class="" alt="여행지 사진" src="${ pageContext.request.contextPath }/resources/images/image_1.jpg"> --%>
								</p>
								<span class="category mb-3 d-block">미국</span>
								<h3 class="mb-4">2019 서울로 놀러 갑니다</h3>
							</a>
						</div><!-- end 동행 글 -->
						<!-- 동행 글 -->
						<div class="travel_list">
							<a href="${ pageContext.request.contextPath }/resources/matching/accompanyDetail.jsp" class="img img-2" >
								<p class="travel_img" style="background-image: url(${ pageContext.request.contextPath }/resources/images/image_2.jpg);">
									<%-- <img class="" alt="여행지 사진" src="${ pageContext.request.contextPath }/resources/images/image_1.jpg"> --%>
								</p>
								<span class="category mb-3 d-block">미국</span>
								<h3 class="mb-4">2019 서울로 놀러 갑니다</h3>
							</a>
						</div><!-- end 동행 글 -->
						<!-- 동행 글 -->
						<div class="travel_list">
							<a href="${ pageContext.request.contextPath }/resources/matching/accompanyDetail.jsp" class="img img-2" >
								<p class="travel_img" style="background-image: url(${ pageContext.request.contextPath }/resources/images/image_3.jpg);">
									<%-- <img class="" alt="여행지 사진" src="${ pageContext.request.contextPath }/resources/images/image_1.jpg"> --%>
								</p>
								<span class="category mb-3 d-block">미국</span>
								<h3 class="mb-4">2019 서울로 놀러 갑니다</h3>
							</a>
						</div><!-- end 동행 글 -->
					</div><!-- end 최신 동행글 3개 -->
				</div><!-- end 동행 서브 메뉴 -->
			</ul>
			<ul class="top_menu2">
				<li class="top_menu "><a href="">추천</a></li>
				<!-- 추천 서브 메뉴 -->
				<div class="to_sub_menu sub_menu2">
					<ul class=" ">
						<li class="toSub_menu"><a href="${ pageContext.request.contextPath }/resources/pick/foodList.jsp">음식</a></li>
						<li class="toSub_menu"><a href="${ pageContext.request.contextPath }/resources/pick/tourList.jsp">관광</a></li>
						<li class="toSub_menu"><a href="${ pageContext.request.contextPath }/resources/matching/accompanyAfter.jsp">후기</a></li>
					</ul>
					<!-- 최신 동행글 3개 -->
					<div class="to_sub_list">
						<!-- 동행 글 -->
						<div class="travel_list">
							<a href="${ pageContext.request.contextPath }/resources/matching/accompanyDetail.jsp" class="img img-2" >
								<p class="travel_img" style="background-image: url(${ pageContext.request.contextPath }/resources/images/image_1.jpg);">
									<%-- <img class="" alt="여행지 사진" src="${ pageContext.request.contextPath }/resources/images/image_1.jpg"> --%>
								</p>
								<span class="category mb-3 d-block">미국</span>
								<h3 class="mb-4">2019 서울로 놀러 갑니다</h3>
							</a>
						</div><!-- end 동행 글 -->
						<!-- 동행 글 -->
						<div class="travel_list">
							<a href="${ pageContext.request.contextPath }/resources/matching/accompanyDetail.jsp" class="img img-2" >
								<p class="travel_img" style="background-image: url(${ pageContext.request.contextPath }/resources/images/image_2.jpg);">
									<%-- <img class="" alt="여행지 사진" src="${ pageContext.request.contextPath }/resources/images/image_1.jpg"> --%>
								</p>
								<span class="category mb-3 d-block">미국</span>
								<h3 class="mb-4">2019 서울로 놀러 갑니다</h3>
							</a>
						</div><!-- end 동행 글 -->
						<!-- 동행 글 -->
						<div class="travel_list">
							<a href="${ pageContext.request.contextPath }/resources/matching/accompanyDetail.jsp" class="img img-2" >
								<p class="travel_img" style="background-image: url(${ pageContext.request.contextPath }/resources/images/image_3.jpg);">
									<%-- <img class="" alt="여행지 사진" src="${ pageContext.request.contextPath }/resources/images/image_1.jpg"> --%>
								</p>
								<span class="category mb-3 d-block">미국</span>
								<h3 class="mb-4">2019 서울로 놀러 갑니다</h3>
							</a>
						</div><!-- end 동행 글 -->
					</div><!-- end 최신 동행글 3개 -->
				</div><!-- end 추천 서브 메뉴 -->
			</ul>
			
			<span class="top_sapn"><button class="searchOn searchBtn_w" data-toggle="modal" data-target="#myModal">검색</button></span>
			<%-- <span class="top_sapn"><a href="${ pageContext.request.contextPath }/resources/header/search.jsp">검색</a></span> --%>
			<span class="top_sapn"><a href="">English</a></span>
			<span class="top_sapn"><a href="">한국어</a></span>
			<span class="top_sapn"><a href="${ pageContext.request.contextPath }/resources/admin/admin.jsp">관리자페이지</a></span>
		</nav>
	</header>  
	
	<!-- mobile 전용 작은화면 -->
	<div class="headerM">
		<h1 id="colorlib-logo" class="m_logo"><a href="${ pageContext.request.contextPath }">together<span>.</span></a></h1>
		<p class="search_m"><button class="searchOn searchBtn_m" data-toggle="modal" data-target="#myModal">검색</button></p>
		<%-- <p class="search_m"><a href="${ pageContext.request.contextPath }/resources/header/search.jsp">검색</a></p> --%> 
	</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog modal_" role="document">
		<div class="modal-content ">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>

			</div>
			<div class="modal-body">
				<!-- <h1>Search</h1> -->
				<form class="navbar-form " role="search">
					<input type="text" class="form-control modal_search_text" placeholder="Search">
					<button type="submit" class="btn btn-default modal_search_sub">Submit</button>
				</form>
				
			</div>
		</div>
	</div>
</div>

