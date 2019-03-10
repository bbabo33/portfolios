<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>

<!-- date,time picker css-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/jquery.datetimepicker.min.css" />
<%-- <script src="${pageContext.request.contextPath}/resources/js/jquery.datetimepicker.js"></script> --%>

<script>
		
	
	$(document).ready(function() {
		/* $.datetimepicker.setLocale('ru'); */
		$('#datepicker1').datetimepicker({
			 format:'Y-m-d H:i',	
		     timepicker:true,
		     step : 15,
		     minDate:'-1970/01/01'	//오늘부터 캘린더 픽 할 수 있게 만듦   
		});
	}); 
	
</script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<input type="text" id="datepicker1" readonly>
	
</body>
</html>