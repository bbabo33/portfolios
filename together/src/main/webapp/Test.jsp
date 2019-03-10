<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<script>
$(document).ready(function () {
	$('.location_list').on("click",function(){
		alert('!!!');
	})
});	
</script>
</head>
<body>
	<button class="location_list">클릭</button>
</body>
</html>