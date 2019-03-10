<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<!-- Bootstrap core & JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/resources/css/bookConfirm.css" rel="stylesheet">
<head>
	
<script>
	
	$(document).ready(function(){
		
		/* 취소버튼 눌렀을 때 */
		$('input[type=button]').click(function(){
			
			var no =$(this).parent().siblings()[0];
			$.ajax({
				url :'${pageContext.request.contextPath}/booking/cancelReservation',
				data : {no : no.value }, 
				type : 'get',
				success : cancelReserSuccess,
				error : cancelReserFail
			})
		});
	});
	
	function cancelReserSuccess(data){
		alert(data);
		location.href="${pageContext.request.contextPath}/booking/confirm";
	}
	
	function cancelReserFail(data){
		alert("fail");
	}
	
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

	<div class="center_column">
			<p><strong>펫시팅 예약확인</strong></p>
			<div id="confirmText">
				펫시팅 예약하신 내용을 확인할 수 있습니다<br>
				<span>예약 취소</span>는 예약날짜 하루 전까지 가능합니다
			</div>
			
			<!-- 예약한 건수(예약대기) 확인 -->
			<c:set var="cnt" value="0" />
			<c:forEach var="list" items="${confirmLists}">
				<c:if test="${list.bookStatus eq 'W'}">
					<c:set var="cnt" value="${cnt+1}" />
				</c:if>
			</c:forEach>
			
			<div>총 ${cnt} 건의 예약이 있습니다</div>
			
			<c:forEach var="list" items="${confirmLists}">
				 <c:if test="${list.bookStatus eq 'W'}">
				 	<c:set var="cnt" value="${cnt+1}" />
					<div class="confirmBoard">
						<input type="hidden" value="${list.no}">		
						<div><span>예약자명</span> <strong>${list.bookingName}</strong></div>
						<div><span>방문날짜</span> <strong>${list.bookingDate}</strong></div>
						<div><span>연락번호</span> <strong>${list.bookingPhone}</strong></div>
						<div><span>방문장소</span> <strong>${list.bookLocation}</strong></div>
						<div><span>반려동물 정보</span></div>
						<div id="animalInfo">${list.bookingInfo}</div>
						<div id="bookingCancelBtn"><input type="button" class="btn btn-primary" value="예약취소"></div>
					</div>
				</c:if>	
			</c:forEach>
	</div>
    
	<jsp:include page="/WEB-INF/views/footer/footer.jsp"/>
	
</body>

</html>
