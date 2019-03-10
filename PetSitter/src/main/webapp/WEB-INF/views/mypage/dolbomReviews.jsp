<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<!-- Bootstrap core & JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/resources/css/DolBom.css" rel="stylesheet">
<head>

<script>
	
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
	
	<!-- Page Content -->
	<div class="container">

		<h2>오늘 하루는 어떠셨나요?</h2>
		<!-- Portfolio Section -->
		<div class="row">
			<c:forEach var="review" items="${reviews}">
				<div class="col-lg-4 col-sm-6 portfolio-item">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="${pageContext.request.contextPath }/resources/images/review/${review.serPic}" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="${pageContext.request.contextPath}">${review.title}</a>
							</h4>
							<p class="card-text">${review.good}</p>
						</div>
					</div>
				</div>
			</c:forEach>	
		</div>
		
		<!-- /.row -->
	</div>
	
	<jsp:include page="/WEB-INF/views/footer/footer.jsp"/>
	
</body>

</html>
