<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<!-- Bootstrap core & JavaScript -->
<script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 
<head>
<script>
	$(document).ready(function(){
		$('#goReview').click(function(){
			location.href="${pageContext.request.contextPath}/mypage/dolbomReviews";
		});
	});
</script>	
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>DolBom</title>

</head>

<body>
	<!-- topMenu + scss, css파일 -->
	<jsp:include page="/WEB-INF/views/topMenu/topMenu.jsp" />

	<header>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item active"
					style="background-image: url('${pageContext.request.contextPath}/resources/images/Main_dog4.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<!-- <h3>First Slide</h3>
              			<p>This is a description for the first slide.</p> -->
					</div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('${pageContext.request.contextPath}/resources/images/Main_dog7.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<!-- <h3>Second Slide</h3>
              			<p>This is a description for the second slide.</p> -->
					</div>
				</div>
				<!-- Slide Three - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('${pageContext.request.contextPath}/resources/images/Main_dog6.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<!-- <h3>Third Slide</h3>
            			<p>This is a description for the third slide.</p> -->
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</header>

	<!-- Page Content -->
	<div class="container">

		<h2 class="my-4">펫시터와 함께하는 하루를 선물하세요</h2>
		<div id="goReview">후기 더 보기 →</div>
		<!-- Portfolio Section -->
		<div class="row">
			<c:forEach var="review" items="${reviews}">
				<div class="col-lg-4 col-sm-6 portfolio-item">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="${pageContext.request.contextPath }/resources/images/review/${review.serPic}"></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">${review.title}</a>
							</h4>
							<p class="card-text">${review.good}</p>
						</div>
					</div>
				</div>
			</c:forEach>	
		</div>
		
		<!-- /.row -->

		<!-- Features Section -->
		<div class="row">
			<div class="col-lg-6" style="margin: auto;">
				<h3>펫시터 집으로 부르기</h3>
				<br>
				<p>도그메이트 펫시터가 집으로 찾아와 반려동물을 돌봐드려요</p>
				<ul>
					<li>애견호텔은 불편하다면, 1박 돌봄</li>
					<br>
					<li>3시간 이상, 오랜 시간 외출할 때에는 데이 케어</li>
					<br>
					<li>반려동물을 키우는 펫시터가 함께합니다</li>
				</ul>
			</div>
			<div class="col-lg-6">
				<img class="img-fluid rounded"
					src="${pageContext.request.contextPath }/resources/images/sub_dog.jpg"
					alt="">
			</div>
		</div>

		<!-- /.row -->

		<hr>
	</div>

	<jsp:include page="/WEB-INF/views/footer/footer.jsp"/>
	
</body>

</html>
