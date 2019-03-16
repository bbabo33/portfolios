<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<!-- Bootstrap core & JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/resources/css/mySummary.css" rel="stylesheet">
<head>

<script>
	/* 예약번호 */
	var no=0;
	
	$(document).ready(function(){
		/* 일지보기 */
		$(".seeAdminWrite").click(function(){
			no = $(this).parent().attr('class');
			location.href="${pageContext.request.contextPath}/admin/seeDolbomWrite/"+no;
		});
		
		/* 후기작성으로 */
		$(".reviewBtn").click(function(){
			/* 예약번호 */
			no = $(this).parent().attr('class');
			location.href="${pageContext.request.contextPath}/mypage/reviewForm/"+no;
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
	
	<div class="center_column">
		<img src="${pageContext.request.contextPath }/resources/images/summaryDog.jpg">
		<p class="onlyP"><strong>펫시팅 이용내역</strong></p>
			<div id="confirmText">
				펫시팅을 이용하신 내용을 확인할 수 있습니다<br>
				<span>후기작성</span>은 돌봄 플래너가 더 나은 서비스를 제공하도록 만듭니다.
		</div>
		
		<table class="table table-hover summaryTable">
		  <thead>
		    <tr>
		      <th scope="col">날짜</th>
		      <th scope="col">장소</th>
		      <th scope="col">돌봄</th>
		      <th scope="col">후기</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:if test="${empty confirmLists }">
		  		<tr>
		  			<td colspan="4">내역이 존재하지 않습니다</td>
		  		</tr>
		  	</c:if>
		  	<c:forEach var="list" items="${confirmLists}">
			  	<tr>
			      <th scope="row">${list.bookingDate}</th>
			      <td>${list.bookLocation}</td>
			      <c:choose>
			      	  <c:when test="${list.bookStatus eq 'W' }">	
					      <td><input type="button" class="btn" value="작성전"></td>
					      <td>내용 없음</td>
				      </c:when>
				      <c:when test="${list.bookStatus eq 'D' }">	
					      <td class="${list.no}"><input type="button" class="btn btn-primary seeAdminWrite" value="일지보기"></td>
					      <td class="${list.no}"><input type="button" class="btn btn-primary reviewBtn" value="후기작성"></td>
				      </c:when>
				      <c:when test="${list.bookStatus eq 'C' }">	
					      <td></td>
					      <td><input type="button" class="btn" value="예약취소"></td>
				      </c:when>
				      <c:when test="${list.bookStatus eq 'R' }">	
					      <td class="${list.no}"><input type="button" class="btn btn-primary seeAdminWrite" value="일지보기"></td>
					      <td><input type="button" class="btn" value="작성완료"></td>
				      </c:when>
			      </c:choose>
			    </tr>
		  	</c:forEach>
		  
		  </tbody>
		</table>
	</div>
	
	<jsp:include page="/WEB-INF/views/footer/footer.jsp"/>
	
</body>

</html>
