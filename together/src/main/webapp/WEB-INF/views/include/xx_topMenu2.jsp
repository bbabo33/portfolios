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
		
		// 검색 : 모달윈도우
	      function getPos(){//창의 넓이와 높이에 따른 중앙정렬 함수생성(함수이름은 임의로 정함)
	          var w = $(window).width();
	          var h = $(window).height();
	          var w2 = w/2;
	          var h2 = h/2;
	          
	          $('#modal').css('width',w);
	          $('#modal').css('height',h);
	          $('#showSearch').css('height',h);
	          /*$('body').css('position', 'fixed');
	          $('body').css('overflow-y', 'scroll');
	          $('body').css('width', 100%); */
	          
	          var sboxw = parseInt($('#showSearch').css('width'));
	          var sboxh = parseInt($('#showSearch').css('height'));
	          
	          $('#showSearch').css('left',(w2 - sboxw/2) );
	          $('#showSearch').css('top',(h2 - sboxh/2) );
	       }
		
		getPos()//함수호출
		$(window).resize(function(){
			getPos();
		});
		
		$('.searchOn').click(function() {
			
			$('#modal').fadeTo(500, 0.95);//시간과 투명도 조절 가능.
			//$('#showMap').fadeIn(500);
			$('#showSearch').delay(500).fadeIn(500, 0.95);//.delay지연시킨다 0.5초후에 시작.
			//showSearch 이 모두 fadeIn 된 후 검색 띄운다
			$("#showSearch").promise().done(function() {
				mapShow("${product.geoY}","${product.geoX}");
			});
		
		}); 
			
		$('.search_close').click(function() {
			$('#showSearch').fadeOut();
			$('#modal').delay(200).fadeOut();
		});
		
	});
</script>  

	<!-- web전용 큰화면 -->
	<header id="headerW">
		<nav class="topMenu_nav">
			<ul>
				<li class="top_menu"><a href="">자유게시판</a></li>
				<li class="top_menu"><a href="">채식게시판</a></li>
				<li class="top_menu"><a href="${ pageContext.request.contextPath }/resources/matching/accompanyWrite.jsp">동행 글 쓰기</a></li>
			</ul>
			<span class="top_sapn"><button class="searchOn searchBtn_w">검색</button></span>
			<%-- <span class="top_sapn"><a href="${ pageContext.request.contextPath }/resources/header/search.jsp">검색</a></span> --%>
			<span class="top_sapn"><a href="">English</a></span>
			<span class="top_sapn"><a href="">한국어</a></span>
		</nav>
	</header>  
	
	<!-- mobile 전용 작은화면 -->
	<div class="headerM">
		<h1 id="colorlib-logo" class="m_logo"><a href="${ pageContext.request.contextPath }">together<span>.</span></a></h1>
		<p class="search_m"><button class="searchOn searchBtn_m" >검색</button></p>
		<%-- <p class="search_m"><a href="${ pageContext.request.contextPath }/resources/header/search.jsp">검색</a></p> --%> 
	</div>

	<!-- 화면어둡게 덮는 div -->
	<div id="modal">
	</div>
	<!-- 검색 -->
	<div id="showSearch">
		<div class="search_close">닫기</div>	
		<form name="searchForm" method="get" action="">
			<input type="text" 	placeholder="Search">
			<button class="searchOn_btn">검색</button>
		</form>
	</div>
