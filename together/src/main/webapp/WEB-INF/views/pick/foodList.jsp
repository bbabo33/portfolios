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
			<div class="container themain">
				<div class="row justify-content-center mb-5 pb-2">
					<div class="col-md-7 heading-section text-center ftco-animate">
						<h2 class="mb-4">Restaurant List</h2>
						<p>Meet delicious food</p>
					</div>
				</div>
				
				<div class="container py-2 ftco-animate alarmcon"><!-- 탭 + 상세 div -->

						<!-- 부트 탭 -->
	                  <ul class="nav nav-tabs food_tab_nav" id="foodTab" role="tablist">
	                     <li class="nav-item">
	                       <a class="nav-link active" id="foodAll-tab" data-toggle="tab" href="#all" role="tab" aria-controls="all" aria-selected="true">ALL</a>
	                     </li>
	                     <li class="nav-item">
	                       <a class="nav-link" id="korean-tab" data-toggle="tab" href="#korean" role="tab" aria-controls="korean" aria-selected="false">Tradition</a>
	                     </li>
	                     <li class="nav-item">
	                       <a class="nav-link" id="snack-tab" data-toggle="tab" href="#snack" role="tab" aria-controls="snack" aria-selected="false">Snack</a>
	                     </li>
	                     <li class="nav-item">
	                       <a class="nav-link" id="meat-tab" data-toggle="tab" href="#meat" role="tab" aria-controls="meat" aria-selected="false">Meat</a>
	                     </li>
	                  </ul>
						<div class="tab-content" id="myTabContent"><!-- 상세 컨테이너 div -->
							<!-- 전체 보기 시작 -->
							<div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="foodAll-tab">
								<div class="row">
								
								<c:forEach items="${ all }" var="food">
								<div class="col-lg-4 col-md-6 mb-4">
								 <div class="card h-100">
						                
						                <c:forEach items="${ images }" var ="image">
						              
						                <c:if test="${(food.no eq image.boardno) and (image.tablename eq 'food')}" >
						                	
						                 	<a href="${ pageContext.request.contextPath }/board/pick/foodDetail/${food.no}/${image.no}"><img class="card-img-top" src="${pageContext.request.contextPath }/upload/food/${image.fileSaveName }" alt=""></a> 
						                </c:if>
						                 </c:forEach>
						                <div class="card-body">
						                  <h5 class="food_list_title">${food.name }</h5>
						                  <p class="card-text food_list_con">${food.content }</p>
						                </div>
						                <div class="card-footer">
						                  <span class="board_viewCnt"><i class="icon-eye"></i>${food.viewCnt }</span>
						                  <span class="phone-number">${food.tel }</span>
						                </div>
						              </div>
						            </div>
						           
									</c:forEach>
				
				        		</div><!-- // end row -->
			        		</div><!-- // end 전체보기 끝 -->
			        		
			        		<!-- 한식 -->
			        		<div class="tab-pane fade" id="korean" role="tabpanel" aria-labelledby="korean-tab">
								<div class="row">
								
								<c:forEach items="${ koreanFood }" var="food">
								<div class="col-lg-4 col-md-6 mb-4">
								 <div class="card h-100">
						                
						                <c:forEach items="${ images }" var ="image">
						              
						                <c:if test="${(food.no eq image.boardno) and (image.tablename eq 'food')}" >
						                	
						                 	<a href="${ pageContext.request.contextPath }/board/pick/foodDetail/${food.no}/${image.no}"><img class="card-img-top" src="${pageContext.request.contextPath }/upload/food/${image.fileSaveName }" alt=""></a> 
						                </c:if>
						                 </c:forEach>
						                <div class="card-body">
						                  <h5 class="food_list_title">${food.name }</h5>
						                  <p class="card-text food_list_con">${food.content }</p>
						                </div>
						                <div class="card-footer">
						                  <span class="board_viewCnt"><i class="icon-eye"></i>${food.viewCnt }</span>
						                  <span class="phone-number">${food.tel }</span>
						                </div>
						              </div>
						            </div>
						           
									</c:forEach>
				
				        		</div><!-- // end row -->
			        		</div><!-- // end 한식보기 끝 -->
			        		<!-- s -->
			        		<div class="tab-pane fade" id="snack" role="tabpanel" aria-labelledby="snack-tab">
								<div class="row">
								
								<c:forEach items="${ snack }" var="food">
								<div class="col-lg-4 col-md-6 mb-4">
								 <div class="card h-100">
						                
						                <c:forEach items="${ images }" var ="image">
						              
						                <c:if test="${(food.no eq image.boardno) and (image.tablename eq 'food')}" >
						                	
						                 	<a href="${ pageContext.request.contextPath }/board/pick/foodDetail/${food.no}/${image.no}"><img class="card-img-top" src="${pageContext.request.contextPath }/upload/food/${image.fileSaveName }" alt=""></a> 
						                </c:if>
						                 </c:forEach>
						                <div class="card-body">
						                  <h5 class="food_list_title">${food.name }</h5>
						                  <p class="card-text food_list_con">${food.content }</p>
						                </div>
						                <div class="card-footer">
						                  <span class="board_viewCnt"><i class="icon-eye"></i>${food.viewCnt }</span>
						                  <span class="phone-number">${food.tel }</span>
						                </div>
						              </div>
						            </div>
						           
									</c:forEach>
				
				
				        		</div><!-- // end row -->
			        		</div><!-- // end 한식보기 끝 -->
			        		<!-- s -->
			        		<div class="tab-pane fade" id="meat" role="tabpanel" aria-labelledby="snack-tab">
								<div class="row">
								
								<c:forEach items="${ meat }" var="food">
								<div class="col-lg-4 col-md-6 mb-4">
								 <div class="card h-100">
						                
						                <c:forEach items="${ images }" var ="image">
						              
						                <c:if test="${(food.no eq image.boardno) and (image.tablename eq 'food')}" >
						                	
						                 	<a href="${ pageContext.request.contextPath }/board/pick/foodDetail/${food.no}/${image.no}"><img class="card-img-top" src="${pageContext.request.contextPath }/upload/food/${image.fileSaveName }" alt=""></a> 
						                </c:if>
						                 </c:forEach>
						                <div class="card-body">
						                  <h5 class="food_list_title">${food.name }</h5>
						                  <p class="card-text food_list_con">${food.content }</p>
						                </div>
						                <div class="card-footer">
                                   		  <span class="board_viewCnt"><i class="icon-eye"></i>${food.viewCnt }</span>
						                  <span class="phone-number">${food.tel }</span>
						                </div>
						              </div>
						            </div>
						           
									</c:forEach>
				
				        		</div><!-- // end row -->
			        		</div><!-- // end 한식보기 끝 -->
		        		</div><!-- // end 상세 컨테이너 div 끝 -->
	        		</div><!-- // end 탭 + 상세 div 끝 -->
			</div>

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
