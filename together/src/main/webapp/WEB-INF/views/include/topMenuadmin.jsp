<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		// 헤더고정
		/* var jbOffset = $('.topMenu_nav').offset();
		$('header').addClass('hFixed'); */
		
		// 메뉴 마우스오버 슬라이드 
	 	$('.admin_top_menu1').on({
			'mouseenter':function() {
				$('.admin_sub_menu1').stop().animate({
					width:'100%',
					height:'140px',
					"display":"block" 
				});
			}, 'mouseleave':function() {
				$('.admin_sub_menu1').stop().animate({
					width:'0px',
					height:'0px',
					'display':'none'
				});
			}
		}); // end top_menu1 on 
		
	});
</script>

<header class="topMenuAdmin">
	<nav>
		<ul class="adminTopMenu_nav">
			<li class="admin_top_menu"><a href="${ pageContext.request.contextPath }/admin/admin">사용자 통계</a></li>
			<li class="admin_top_menu"><a href="${ pageContext.request.contextPath }/admin/userInfo">회원 정보</a></li>
			<li class="admin_top_menu admin_top_menu1">
				<a href="">게시글</a>
				<ul class="admin_sub_menu1">
					<li><a href="${pageContext.request.contextPath }/admin/food">음식</a></li>
					<li><a href="${pageContext.request.contextPath }/admin/tour">관광</a></li>
					<li><a href="${ pageContext.request.contextPath }/admin/noticeBoard">공지</a></li>
				</ul>
			</li>
		</ul>
		<span class="admin_top_span"><a href="${ pageContext.request.contextPath }">투게더</a></span>
	</nav>
</header>

