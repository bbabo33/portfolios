<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<title>together</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/include/toplink.jsp"%>
<style>

</style>
</head>
<body>
   <div id="colorlib-page">
      <a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle">
         <i></i>
      </a>
      
      <!-- aside 좌측 메뉴 -->
      <jsp:include page="/WEB-INF/views/include/aside.jsp" />
      
      <!-- header 상단 메뉴 -->
      <jsp:include page="/WEB-INF/views/include/topMenu.jsp" />
      
      <!-- main, footer -->
      <div id="colorlib-main">
         <!-- 모바일 헤더  -->
         <jsp:include page="/WEB-INF/views/include/topMenuMo.jsp" />
      

         <section class="ftco-section">
            <div class="container">
               <div class="row justify-content-center mb-5 pb-2">
                  <div class="col-md-7 heading-section text-center ftco-animate">
                     <h2 class="mb-4">My Post</h2>
                     <p></p>
                  </div>
               </div>
               <div class="container py-2 ftco-animate alarmcon">

               <!-- 부트 탭 -->
               <ul class="nav nav-tabs my_tab_nav" id="myTab" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">My together List</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">My together After</a>
                  </li>
               </ul>
               <div class="tab-content" id="myTabContent">
                  <!-- 동행글 보기 시작 -->
                  
                  
                  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                     <div class="row">   
                     	<c:forEach var="matchingVO" items="${myMatchingList}">
	                     	<!-- 동행 글 -->
	                        <div class="col-md-4">
	                           <div class="blog-entry ftco-animate">
	                              <div class="travel_list">
	                                 <a href="${ pageContext.request.contextPath }/matching/searchDetail/${matchingVO.no}" class="img img-2" >
	                                    <p class="travel_img" style="background-image: url(${ pageContext.request.contextPath }/upload/country/${matchingVO.member.country}.jpg);"></p>
	                                    <span class="category mb-3 d-block">${matchingVO.member.country}</span>
	                                    <h3 class="mb-4">${matchingVO.title}</h3>
	                                 </a>
	                              </div>
	                              <div class="text text-2 pt-2 travle_info">
	                                 <p class="mb-4">
	                               Date : ${matchingVO.matchingDate },${matchingVO.matchingTime}<br>
	                               Language : ${matchingVO.languages}
	                                 </p>
	                                 <div class="author mb-4 d-flex align-items-center">
	                                    <a href="#" class="img profile_info">
	                                       <p style="background-image: url(${ pageContext.request.contextPath }/upload/userImg/${matchingVO.member.profileImg});"></p>   
	                                       <div class="ml-3 info">
	                                          <span>Writer</span>
	                                          <h3>${matchingVO.writer} <span>${matchingVO.regDate }</span></h3>
	                                       </div>
	                                    </a>
	                                 </div>
	                              </div>
	                           </div>
	                        </div><!-- // end 동행 글 -->
                     	</c:forEach>
                     
                     </div><!-- // end row -->

                  </div><!-- 동행글 보기 끝 -->
                  <!-- 후기글 보기 시작 -->
                  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                  
                     <div class="row"> 
                     <c:forEach var="myReviewVO" items="${myReviewList}">
	                        <!-- 동행 글 -->
	                        <div class="col-md-4">
	                           <div class="blog-entry ftco-animate">
	                              <div class="travel_list">
	                                 <a href="${ pageContext.request.contextPath }/matching/accompanyAfterDetail/${myReviewVO.no}" class="img img-2" >
	                                    <p class="travel_img" style="background-image: url(${ pageContext.request.contextPath }/upload/country/${myReviewVO.member.country}.jpg);"></p>
	                                    <span class="category mb-3 d-block">${myReviewVO.member.country}</span>
	                                    <h3 class="mb-4">${myReviewVO.title}</h3>
	                                 </a>
	                              </div>
	                              <div class="text text-2 pt-2 travle_info">
	                                 <p class="mb-4">
	                               Regist Date : ${myReviewVO.regDate}<br>
	                               
	                                 </p>
	                                 <div class="author mb-4 d-flex align-items-center">
	                                    <a href="#" class="img profile_info">
	                                       <p style="background-image: url(${ pageContext.request.contextPath }/upload/userImg/${myReviewVO.member.profileImg});"></p>   
	                                       <div class="ml-3 info">
	                                          <span>Writer</span>
	                                          <h3>${myReviewVO.writer}</h3>
	                                       </div>
	                                    </a>
	                                 </div>
	                              </div>
	                           </div>
	                        </div><!-- // end 동행 글 -->
                        </c:forEach>
                     </div><!-- // end row -->

                  </div><!-- 후기글 보기 끝 -->
               </div><!-- // 부트 탭 -->

               </div>
            </div>
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