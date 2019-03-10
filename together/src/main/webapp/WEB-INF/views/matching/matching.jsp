<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
<title>together : 함께하는 여행</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/include/toplink.jsp"%>
<script>
	$(document).ready(function(){
		
		console.log('${endPage}');
		
		//프로필 이미지 클릭시 채팅하기 버튼 보이기
		$('.talk_btn_go').on('click', function(){
			if($(this).parent().find('a').attr('data-click-state') == 1){
				$(this).parent().find('a').attr('data-click-state', 0);
				$(this).parent().find('a').css('display', 'block');
			} else {
				$(this).parent().find('a').attr('data-click-state', 1);
				$(this).parent().find('a').css('display', 'none');
			}			
		}); 
		
	});

	function goPage(pageNum){
		
		location.href="${pageContext.request.contextPath}/matching/matching/"+pageNum;
	}
	
</script>
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
			
			<section class="ftco-section">
				<div class="container">
					<!-- title -->
					<div class="row justify-content-center mb-5 pb-2">
						<div class="col-md-7 heading-section text-center ftco-animate">
							<h2 class="mb-4">Together Write</h2>
		           			<p>Please find your travel partner</p> 
		            		<p>Enjoy the happiness of the day <br> others will not experience</p>
						</div>
					</div><!-- // end title -->
					
					<!-- 동행 글 리스트 -->
					<div class="row">
						 <c:forEach var="matchingvo" items="${matchingBList}">
							<!-- 동행 글 -->
							<div class="col-md-4">
								<div class="blog-entry ftco-animate">
									<div class="travel_list">
										<a href="${ pageContext.request.contextPath }/matching/searchDetail/${matchingvo.no}" class="img img-2" >
											<p class="travel_img" style="background-image: url(${ pageContext.request.contextPath }/upload/country/${matchingvo.member.country}.jpg);">
												<span class="con_name">From ${matchingvo.member.country}</span>
											</p>
											<span class="category mb-3 d-block">${matchingvo.member.country}</span>
											<h3 class="mb-4">${matchingvo.title }</h3>
										</a>
										
									</div>
									<!-- <div class="text text-2 pt-2 mt-3"> -->
									<div class="text text-2 pt-2 travle_info">
										<p>Language : <b>${matchingvo.languages }</b></p>
										<p>Travel Date : <b>${matchingvo.matchingDate }</b></p>
										<div class="author mb-4 d-flex align-items-center profile_info">
											<p class="talk_btn_go " id="${matchingvo.no }" style="background-image: url(${ pageContext.request.contextPath }/upload/userImg/${matchingvo.member.profileImg });"></p>
											<div class="ml-3 info">
												<span>Writer</span>
												<h3>${matchingvo.writer} </h3>
												<span>${matchingvo.regDate}</span>
											</div>
											<a href="${pageContext.request.contextPath }/mypage/talk" id="btn_${matchingvo.no }" class="talk_btn" data-click-state=1>Chatting</a>
										</div>
										
									</div>
								</div>
							</div><!-- // end 동행 글 -->
						</c:forEach> 
						
			
					</div><!-- // end 동행 글 리스트 -->
					<div id="pageList">
                     <c:forEach var="i" begin="1" end="${endPage}">
                        <c:if test="${ no eq i }">
                           <button onclick="goPage(${i})"><b style="color:#333;">${i}</b></button>
                        </c:if>
                        <c:if test="${ no != i }">
                           <button onclick="goPage(${i})">${i}</button>
                        </c:if>
                     </c:forEach>
               		</div>
				</div><!-- // end container -->
			</section>


			<!-- footer  -->
		    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
    
		</div><!-- END COLORLIB-MAIN -->
	</div><!-- END COLORLIB-PAGE -->

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
