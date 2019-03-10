<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<!-- Bootstrap core & JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/resources/css/reviewForm.css" rel="stylesheet">
<head>

<script>
	$(document).ready(function(){
		$('span[id=loginBtn]').click(function(){
			alert('!!!');
		});
		
		$('span[id=enrollBtn]').click(function(){
			location.href="${pageContext.request.contextPath}/login/joinForm";
		});	
	})
	
	
	
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

	<div class="review_head" style="background-image: url('${pageContext.request.contextPath}/resources/images/walkDog.png')">
		<div id="reviewHead">
			펫시팅 후기작성
		</div>
		<div id="reviewBody">
			<div>후기작성을 통한 피드백은 돌봄 플래너에게 큰 힘이 됩니다</div>
			<div>돌봄을 이용하시면서 좋았던 점과 불편했던 점들을 적어주세요</div>
			<div>다른 반려동물에게 더 나은 서비스로 보답하겠습니다</div>
		</div>
	</div>
	
	<form action="${pageContext.request.contextPath }/mypage/reviewUp" method="post" enctype="multipart/form-data">	
		<input type="hidden" name="bookNo" value="${bookNo}">
		<div class="notiBoard">		
				<p><span class="badge badge-danger">!</span><strong>제목을 적어주세요</strong></p>
				<input type="text" class="bookFormInput" name="title"> 
		</div>
		<div class="notiBoard">		
				<p><span class="badge badge-danger">!</span><strong>좋았던 점을 적어주세요</strong></p>
				<input type="text" class="bookFormInput" name="goodSide"> 
		</div>
		
		<div class="notiBoard">		
				<p><span class="badge badge-danger">!</span><strong>싫었던 점을 적어주세요</strong></p>
				<input type="text" class="bookFormInput" name="badSide"> 
		</div>
		
		<div class="notiBoard">		
				<p class="floatText"><span class="badge badge-danger">!</span><strong>후기에 올라갈 사진을 올려주세요</strong></p>
				<input type="file" name="file" class="btn btn-primary uploadPic"> 
		</div>
		<input type="submit" class="btn btn-primary formBtn" value="등록">
	</form>
	
	<jsp:include page="/WEB-INF/views/footer/footer.jsp"/>
	
</body>

</html>
