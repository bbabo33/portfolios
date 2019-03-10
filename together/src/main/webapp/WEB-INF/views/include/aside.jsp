<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<script>
	$(document).ready(function(){
		
		// aside 마이페이지 클릭시 하단으로 메뉴 뿌려주는 기능
		/* $('#mypage').on('click', function() {
			if ($(this).attr('data-click-state') == 1) {
				$(this).attr('data-click-state', 0);
				$('#mypage_de').slideToggle(500);
				$('#mypage a').css({
					'color' : 'black'
				});
			} else {
				$(this).attr('data-click-state', 1);
				$('#mypage_de').slideToggle(500);
				$('#mypage a').css({
					'color' : '#999999'
				});
			}
		}); */
		
		$('#myMatching').on('click', function() {
			if ($(this).attr('data-click-state') == 2) {
				$(this).attr('data-click-state', 0);
				$('#myMatching_de').slideToggle(500);
				$('#myMatching a').css({
					'color' : 'black'
				});
			} else {
				$(this).attr('data-click-state', 2);
				$('#myMatching_de').slideToggle(500);
				$('#myMatching a').css({
					"color" : '#999999'
				});
			}
		});
		
		$('#myPick').on('click', function() {
			if ($(this).attr('data-click-state') == 3) {
				$(this).attr('data-click-state', 0);
				$('#myPick_de').slideToggle(500);
				$('#myPick a').css({
					'color' : 'black'
				});
			} else {
				$(this).attr('data-click-state', 2);
				$('#myPick_de').slideToggle(500);
				$('#myPick a').css({
					'color' : '#999999'
				});
			}
		});
		
	});
	
	function myPostFunc(){
		$('input[name=email]').val('${userVO.email}');
		$('form[name=emailForm]').submit();
	}
	
</script>    
<aside id="colorlib-aside" role="complementary" class="js-fullheight text-center">
	<h1 id="colorlib-logo"><a href="${ pageContext.request.contextPath }">together<span>.</span></a></h1>
	<div class="profile_img">
		<c:if test="${empty userVO}">
			<img alt="프로필이미지" src="${ pageContext.request.contextPath }/upload/userImg/proImg.png">
		</c:if>
		<c:if test="${! empty userVO}">
			<img alt="프로필이미지" src="${ pageContext.request.contextPath }/upload/userImg/${userVO.profileImg}">
		</c:if>
	</div>
	<nav id="colorlib-main-menu" role="navigation">
		<ul>
			<c:choose>
				<c:when test="${ empty userVO and empty faceVO }">
					<li><a href="${ pageContext.request.contextPath }/login/loginForm">login</a></li>
					<li><a href="${ pageContext.request.contextPath }/login/joinForm">join</a></li>
				</c:when>
				<c:otherwise>
					<li id="mypage" data-click-state="1" class="mypage"><a>My Page</a></li>
					<div id="mypage_de">
						<!-- 클릭했을 때 화면 밑으로 뿌려주게 하고 싶으면 "display_n" class를 div id="mypage_de"에 추가 --> 
						<!-- class="display_n" -->
						<ul>
							<li><a href="${ pageContext.request.contextPath }/mypage/noti">Alarm</a></li>
							<li><a href="javascript:myPostFunc()">My Post</a></li>
							<li><a href="${ pageContext.request.contextPath }/mypage/talk">Massages</a></li>
							<%-- <li><a href="#">스템프</a></li> --%>
							<c:choose>
								<c:when test="${ empty faceVO }">
									<li><a href="${ pageContext.request.contextPath }/mypage/pwCheck">update me</a></li>
									<li><a href="${ pageContext.request.contextPath }/login/logout">logout</a></li>
								</c:when>
								<c:otherwise>
 									<li><a  href="${ pageContext.request.contextPath }/login/fbLogout">logout</a></li> 
								</c:otherwise>
							</c:choose>
						</ul>
						<!-- form으로 email보냄. email은 (.)이 포함되어 get방식으로 보낼 경우 짤림. 때문에 post방식으로 보내야함-->
						<form name="emailForm" method="post" action="${pageContext.request.contextPath}/mypage/my">
							<input type="hidden" name="email" value="">
						</form>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="header_sub">
				<ul>
					<li id="myMatching" data-click-state="2" class="mypage"><a>Together</a></li>
					<div id="myMatching_de" class="display_n">
						<ul>
							<li><a href="${ pageContext.request.contextPath }/matching/matching/1">List</a></li>
							<li><a href="${ pageContext.request.contextPath }/matching/accompanyWrite">Write</a></li>
							<li><a href="${ pageContext.request.contextPath }/matching/accompanyAfter">Review</a></li>
						</ul>
					</div>
					<li id="myPick" data-click-state="3" class="mypage"><a>Recommand</a></li>
					<div id="myPick_de" class="display_n">
						<ul>
							<li><a href="${ pageContext.request.contextPath }/board/pick/foodList">Food</a></li>
							<li><a href="${ pageContext.request.contextPath }/board/pick/tourList">Tour</a></li>
						</ul>
					</div>
					<li><a href="#">한국어</a></li>
					<li><a href="#">English</a></li>
					<li><a href="${ pageContext.request.contextPath }/resources/admin/admin.jsp">Admin</a></li>
				</ul>
			</div>
		</ul>
	</nav>
</aside> <!-- // end aside 좌측 메뉴 끝 -->