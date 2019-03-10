<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<!-- Bootstrap core & JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> 

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/resources/css/faq.css" rel="stylesheet">
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

	<div class="center_column">
		<p><strong>돌봄 FAQ</strong></p>
				<div id="confirmText">
					돌봄에서 자주 받는 질문입니다
				</div>
				
	    <div id="accordion">
		 <div class="card">
		    <div class="card-header" id="headingOne">
		      <h5 class="mb-0">
		        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
		          <span class="badge badge-pill badge-info">Q .</span><span class="sub_title">펫시팅 요금은 어떻게 계산되나요?</span>
		        </button>
		      </h5>
		    </div>
		    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
		      <div class="card-body" style="border: 0.5px solid #f2f4fd;">
		      	펫시팅 금액은 <span>1시간</span>을 기준으로 측정하며, 부가세가 포함되지 않은 가격입니다.<br>
		      	1시간 펫시팅 비용은 <span>8000원</span>입니다.<br>
		      	예를 들어  3시간을 예약한 경우 8,000 X 3 = 2,4000원에 부가세 <span>10%</span>가 가산된 26400원이 결제됩니다.<br>
		      	<span>24시간의 경우 하루 9만원</span>으로 별도의 요금체계를 가지고 있습니다.<br>
		      	1인 펫시팅의 특성상, 2박이상의 서비스는 불가함을 알려드립니다.
		      	<div class="addComment">더 궁금하신 점이 있으시다면 언제든지 문의 부탁드립니다.</div>  
		      </div>
		    </div>
		  </div>
		  
		  <div class="card">
		    <div class="card-header" id="headingTwo">
		      <h5 class="mb-0">
		        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		          <span class="badge badge-pill badge-info">Q .</span><span class="sub_title">외부거래는 무엇이며, 왜 안되는건가요?</span>
		        </button>
		      </h5>
		    </div>
		    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
		      <div class="card-body" style="border: 0.5px solid #f2f4fd;">
			        돌봄을 통해 결제하지 않고 진행한 펫시팅을 <span>외부거래</span>라 합니다.<br>
			    펫시터에게 직접 현금을 건네거나, 계좌이체 또는 이에 준하는 방법으로 돌봄을 통해 결제되지 않은 펫시팅을 의미합니다.<br>
				외부거래를 이용 시 돌봄을 통한 펫시팅 진행상황 확인 및 긴급 상황 대처, 돌봄 안전 보상 프로그램의 <span>보상 대상에서 제외</span>됩니다.
				<div class="addComment">고객님의 소중한 반려동물의 안전을 위해 되도록 돌봄을 통해 결제를 해 주시길 부탁드립니다.</div>
		      </div>
		    </div>
		  </div>
		  
		  <div class="card">
		    <div class="card-header" id="headingThree">
		      <h5 class="mb-0">
		        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
		          <span class="badge badge-pill badge-info">Q .</span><span class="sub_title">취소/환불은 어떻게 이루어지나요?</span>
		        </button>
		      </h5>
		    </div>
		    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
		      <div class="card-body" style="border: 0.5px solid #f2f4fd;">
			       펫시터와 상호 합의하여 의뢰를 <span>취소</span>하고 <span>환불</span>할 수 있습니다.<br>
				환불을 요청할 경우 페팸은 결제대행사에 취소를 요청합니다. 이후 결제대행사는 카드사에 취소를 요청합니다. <br>
				그리고 카드사가 최종 취소를 할 경우 환불이 완료됩니다. 결제대행사를 거치지 않는 <span>무통장 입금</span>의 경우 더 빠르게 환불이 진행됩니다.<br>
				일주일 전 취소시 100%, 3일 전 취소시 50% 환불 가능합니다.단, 당일 예약의 경우 환불이 불가합니다.
				
				<div class="addComment">더 궁금한 점이 있으신 경우 언제든지 카카오톡 또는 전화로 페팸 플래너에게 문의해주세요.</div>
		      </div>
		    </div>
		  </div>
		  
		  <div class="card">
		    <div class="card-header" id="headingFour">
		      <h5 class="mb-0">
		        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
		          <span class="badge badge-pill badge-info">Q .</span><span class="sub_title">펫시팅 이용시 사고가 발생하면 어떻게 하나요?</span>
		        </button>
		      </h5>
		    </div>
		    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordion">
		      <div class="card-body" style="border: 0.5px solid #f2f4fd;">
			      돌봄을 통한 펫시팅은 돌봄 <span>안전보상 제도</span>가 적용됩니다.<br>
				만에 하나 발생할 수 있는 안전사고에 대해 최대 50만원의 <span>반려동물 치료비</span>를 지원하는 제도입니다.<br> 
				단, 돌봄을 통하지 않은 외부거래 또는 펫시터 과실로 발생한 사고, 고객이 사전에 명시하지 않은 내용으로 발생한 경우는 제외합니다. <br>
				
				<div class="addComment">더 궁금한 점이 있으신 경우 언제든지 카카오톡 또는 전화로 페팸 플래너에게 문의해주세요.</div>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/footer/footer.jsp"/>
	
</body>

</html>
