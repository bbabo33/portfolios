<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<title>together</title>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/include/toplink.jsp"%>
<!-- Timepicker 관련 -->
<!-- <link rel="stylesheet"
   href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css"> -->
<!-- end timepicker -->

<!-- 제이쿼리 datepicker 관련  -->
<!-- <link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<!-- end datepicker  -->

<!-- 제이쿼리 timepicker -->
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script> -->
<!-- end timepicker -->

<!-- 제이쿼리 구버전과 최신버전의 혼용을 위한 쿼리소스 -->
<%-- <script src="${pageContext.request.contextPath }/resources/js/jquery-migrate-3.0.1.min.js"></script> --%>
<!-- migrate end -->

<!-- 카카오 맵 api -->
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5bf9ccbd97a21e86fc6689488b54cd2e"></script> --> 
<!-- 주소검색하여 마커, 주소텍스트 추가하는 js파일  -->
<script src="${pageContext.request.contextPath}/resources/js/foodWrite_map_addrSearch.js"></script>

<script>

   function foodUp() {
      location.href="${pageContext.request.contextPath}/admin/foodUpdate?no=${food.no}&img=${image.no}";      
   }
   
  
   
   $(document).ready(function(){
	   
	
	  
	   
      /* 페이지 로딩후, 지도와 장소 텍스트 찍어주는 부분 */
       
      korAddrs='${food.kAddress}'.split('/');
      engAddrs='${food.address}'.split('/'); 
      console.log(korAddrs);
      console.log(engAddrs);
        
      for(var i=0; i<engAddrs.length;i++){   
         $('#engloca').append('<div>-'+engAddrs[i]+'</div>');
      } 
      makeMarker(korAddrs, engAddrs);
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
      <!-- 동행게시글 쓰기 폼 -->
      <div id="colorlib-main">
         <%-- <!-- 모바일 헤더  -->
         <jsp:include page="/WEB-INF/views/include/topMenuMo.jsp" /> --%>

         <section class="ftco-section f_pick_box" >
            <div class=" f_pick_cate">
               ${food.cate }
               <button type="button" onclick="foodUp()">update</button>
            </div><!-- container -->
            
            <div class="f_pick_detail">
               <div class="f_pick_img">
                  <img alt="" src="${pageContext.request.contextPath }/upload/food/${image.fileSaveName }">
               </div>
               
               <div class="f_pick_info">
                  <div class="f_pick_title">
                     <h4>${food.name }</h4>
                     <p>${ food.regDate }</p>
                     <p><i class="icon-eye"></i>${ food.viewCnt }</p>
                  </div>
                  <ul class="f_pick_detail">
                     <li>
                        <span>주소</span>
                        ${ food.address }
                        <p>${ food.kAddress }</p>
                     </li>
                     <li><span>문의처</span>${ food.tel }</li>
                     <li>
                        <span>영업시간</span>
                        ${ food.openTime } ~ ${ food.closeTime }
                        <p>Closed days : ${ food.offday }</p>
                     </li>
                     <li><span>대표음식</span>${ food.food }</li>
                  </ul>
               </div>
               <div class="f_pick_text">
                  <p><span>소개글</span>Info</p>
                  <p> ${ food.content }</p>
               </div>
               
               <div class="f_pick_map">
                  <div class="food_map">
                     <div id="map"></div>
                  </div> 
                  <!-- 지도 api , id='map' 인 div 보다 밑에 있어야 함  --> 
                  <script>
                  $(window).resize(function() {
                 	   console.log('!!!')
                 	   relayout();
                    })
                     var container = document.getElementById('map'); // 지도를 표시할 div 
                     var options = {
                        center: new daum.maps.LatLng(37.5532017297038, 126.97280752153232),
                        level: 3
                     };
                     // 지도를 생성합니다    
                     var map = new daum.maps.Map(container, options);
                     
                     
                      function relayout() {  
                    	  console.log('re..');
                     		 map.relayout();
                  	}
                  </script> 
               </div>
            </div>
         </section>
         <!-- end section -->

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