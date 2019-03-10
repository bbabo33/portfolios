<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
<title>together</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/include/toplink.jsp"%>

<!-- 카카오 맵 api -->
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5bf9ccbd97a21e86fc6689488b54cd2e&libraries=services"></script> -->

<!-- 주소검색하여 마커, 주소텍스트 추가하는 js파일  -->
<script src="${pageContext.request.contextPath}/resources/js/accompanyWrite_map_addrSearch.js"></script>
<script>
	$(document).ready(function(){
		/* 페이지 로딩후, 지도와 장소 텍스트 찍어주는 부분 */
		korAddrs='${matchingBoard.korLocations}'.split('/');
		engAddrs='${matchingBoard.engLocations}'.split('/');
		//console.log(korAddrs);
		//console.log(engAddrs);
		for(var i=0; i<engAddrs.length;i++){	
			$('#engloca').append('<div>-'+engAddrs[i]+'</div>');
		}
		makeMarker(korAddrs, engAddrs);
		
		/* 페이지 로딩 후, 댓글 가져오는 부분 */
		$.ajax({
		      url : "${ pageContext.request.contextPath }/comment/commentlist/${matchingBoard.no}/matchingComment",
		      type : "get",
		      dataType:'JSON',
		      success : callback
		});
		
		/* 페이지 댓글 추가 */
		$('.matching_Co_Btn').click(function(){
			var commentval = $('#replyText').val();
			
			$.ajax({
		         url : "${ pageContext.request.contextPath }/comment/commentwrite/${matchingBoard.no}/matchingComment",
		         type : "POST",
		         dataType:'JSON',
		         data : 'boardno=${matchingBoard.no}&writer=${userVO.name}&content='+commentval, 
		         success : callback
		    });
		});
		
		/* 페이지 댓글 삭제 */
		$(document).on('click','.parent_subBtn',function(){
		      var replyNo = $(this).attr('id');
		      $.ajax({
		         url : "${pageContext.request.contextPath}/comment/commentdelete/" + replyNo+"/${matchingBoard.no}/matchingComment",
		         type : 'get',
		         dataType:'JSON',
		         success : callback
		      });
		 });
		
		//프로필 이미지 클릭시 채팅하기 버튼 보이기
		$('#matching_Detail_writerInfo').on('click', function(){
			if($('.talk_btn').attr('data-click-state') == 1){
				$('.talk_btn').attr('data-click-state', 0);
				$('.talk_btn').css('display', 'block');
			} else {
				$('.talk_btn').attr('data-click-state', 1);
				$('.talk_btn').css('display', 'none');
			}			
		}); 
	});
	
	function callback(data) {
	   console.log(data);
	   $('#replyText').val("");
	   $('#replyUL').empty();
	   $(data).each(function(){
	      var str = '<li><div class="parent_con">';
	      str += '<span>' + this.writer +'</span>';
	      str += '<span>' + this.regdate +'</span><p>'+ this.content +'</p>';
	      
	      if('${userVO.name}' == this.writer){
	      	str += '<button class="parent_subBtn" id='+this.no+'>삭제</button></div></li>'
	      }	
	      $('#replyUL').append(str);
	   });
	}
	
</script>
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
		
		<!-- main, footer --><!-- 동행게시글 쓰기 폼 -->
		<div id="colorlib-main">
			<section class="ftco-section">
		    	<!-- 정보 표시 div -->
				
		    	<div id="matching_DetailTbl">
		    		<div id="matching_Detail_writerInfo">
		    			<!-- <div class="author mb-4 d-flex align-items-center"> -->
		    			<div class="writer_simpleInfo">
							<div id="writer_img">
								<img alt="프로필이미지" src="${ pageContext.request.contextPath }/upload/userImg/${matchingBoard.member.profileImg}">
							</div>
							<div id="writer_profile">
								<span>Writer</span>
								<h3>
									<a>${matchingBoard.writer }</a>
								</h3>
								<span>${matchingBoard.regDate }</span>
							</div>	
						</div>
						<a href="${pageContext.request.contextPath }/mypage/talk" class="talk_btn" data-click-state=1>Chatting</a>
					</div>
		    	
			    	<div class="space"></div>
		    		<div class="matching_Detail_Map">
		    			<div id="map"></div>
		    		</div>
		    		
	    		<!-- 지도 api , id='map' 인 div 보다 밑에 있어야 함  -->
   				<script>
					var container = document.getElementById('map');
					var options = {
						center: new daum.maps.LatLng(37.5532017297038, 126.97280752153232),
						level: 7
					};
					var map = new daum.maps.Map(container, options);
				</script>
					
		    		<div class="matching_Detail_Info">
		    			<div class="title">Location</div>
		    			<%-- <div>${matchingBoard.engLocations}</div> --%>
		    			<div id="engloca" class="location_list"></div> 
		    			
		    			<div class="title">Travel Date</div>
		    			<div class="location_list">${matchingBoard.matchingDate }</div>
		    			
		    			<div class="title">Travel Time</div>
		    			<div class="location_list">${matchingBoard.matchingTime }</div>
		    			
		    			<div class="title">Language</div>
		    			<div class="location_list">${matchingBoard.languages }</div>
		    			
		    			<div class="title">Massage</div>
		    			<div class="location_list">
		    				${matchingBoard.matchingMsg }
		    			</div>
		    			
		    		</div>
		    	</div>
		    	<!-- 상세페이지와 댓글 테이블 간격용 div -->
		    	<div class="space"></div>
		    	
		    	<!-- 댓글 쓰기 -->
               <div class="parent_write">
                  <p>Comment</p>
                  <div class="parent">
                     <textarea id="replyText" class="" name="content" cols="30"
                        rows="10" placeholder="Comments that are irrelevant to the subject can be removed by admin."></textarea>
                     <button class="parent_btn matching_Co_Btn">Reply</button>
                  </div>
               </div>

	            <div class="parent_list" id="replyDIV">
	               <ul id="replyUL">
	               </ul>
	            </div>
			        
		    </section>
			
		    <!-- end section -->
    
   			<!-- footer  -->
		    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
    
		</div><!-- END COLORLIB-MAIN -->
	</div><!-- END COLORLIB-PAGE -->

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