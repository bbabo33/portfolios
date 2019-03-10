<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<title>together : 함께하는 여행</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/include/toplink.jsp"%>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
 -->
<script>
	$(document).ready(function(){
		if('${param.msg}'){
			alert('${param.msg}');
		}
	});
	
	
</script> 
</head>
<body>

	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"> <i></i>
		</a>

		<!-- aside 좌측 메뉴 -->
		<jsp:include page="/WEB-INF/views/include/aside.jsp" />

		<!-- header 상단 메뉴 -->
		<jsp:include page="/WEB-INF/views/include/topMenu.jsp" />

		<!-- main, footer -->
		<div id="colorlib-main">

			<!-- main content -->
			<section class="ftco-section">
				<div class="container">
					<div class="row justify-content-center mb-5 pb-2">
						<div class="col-md-7 heading-section text-center ftco-animate signwrape">
							<h2 class="mb-4">Please login</h2>
							<div class="wrapper">
								<form class="form-signin" action="${pageContext.request.contextPath }/login/login" method="post">
									
									<input type="text" class="form-control idinput" id="userEmail" name="email" placeholder="Email Address" value="${cookie.email.value }" required autofocus/> 
									<input type="password" class="form-control pswdinput" name="password" placeholder="Password" required />
									<div class="rmbme">
										<c:choose>
											<c:when test="${ empty cookie.email.value }">
												<label class="checkbox"> 
													<input type="checkbox"  id="rememberMe" name="rememberMe" value="rememberMe">
													Remember me
												</label> 
											</c:when>
											<c:otherwise>
												<label class="checkbox"> 
													<input type="checkbox"  id="rememberMe" name="rememberMe" value="rememberMe" checked="checked">
													Remember me
												</label> 
											</c:otherwise>
										</c:choose> 
									</div>
									<div class="" style="overflow: hidden; width: 100%;">
										<button class="btn btn-lg btn-primary btn-block lgnbt" type="submit">Login</button>
										<a href="${facebook_url}">
											<button type="button" class="btn fbbtn">
                                    			<i class="fa fa-facebook" aria-hidden="true"></i>Facebook
                               				</button>
                                		</a>
									</div><!-- // 로그인 버튼 -->
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- // end container -->
			</section>

			<!-- footer  -->
			<%@ include file="/WEB-INF/views/include/footer.jsp"%>

		</div>
		<!-- END COLORLIB-MAIN -->
	</div>
	<!-- END COLORLIB-PAGE -->

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#e89981" /></svg>
	</div>

	<%@ include file="/WEB-INF/views/include/bottomlink.jsp"%>
</body>
</html>
