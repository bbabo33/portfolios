<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<!-- Bootstrap core & JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/resources/css/DolBomIntroduce.css" rel="stylesheet">
<head>

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

	<div class="bg_div" style="background-image: url('${pageContext.request.contextPath}/resources/images/dog_bed.jpg');">
		<div class="bg_insideDiv">
			<div>혼자 있는 시간이 많은</div> 
			<div>우리 반려견에게 </div>
			<div>펫시터를 선물하세요</div>
		</div>
	</div>
	
	<div class="con_header">
		<div class="con_main">혼자 남은 나의 반려동물</div>
		<div class="con_main">돌봄 펫시터에게 믿고 맡겨보세요</div>
		<div class="con_sub"><p>외출할 때마다 혼자 있는 반려동물을 위한 </p>우리동네 전문 펫시터의 1:1 맞춤 케어</div>
	</div>
	
	<div class="con_body">
		<div class="con_body_back1"></div>
		<div class="con_body_back2"></div>
		<div class="con_img">
			<img class="imgsource1" src="${pageContext.request.contextPath }/resources/images/intro_img_slide_4.jpg">
		</div>
	</div>
	
	<div class="con_header">
		<div class="con_main">펫시터 집으로 부르기</div>
		<div class="con_sub">원하는 날짜, 시간에 펫시터가 집으로 찾아갑니다!</div>
	</div>
	
	<div class="con_body2">
		<div class="con_body_back1"></div>
		<div class="con_body_back3"></div>
		<div class="con_img">
			<img class="imgsource2" src="${pageContext.request.contextPath }/resources/images/intro_img_intro.png">
		</div>
	</div>
	
	<div class="con_moveBody">
		<div>
			<img src="${pageContext.request.contextPath }/resources/images/intro_img_petsitting_04.gif">
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/footer/footer.jsp"/>
	
</body>

</html>
