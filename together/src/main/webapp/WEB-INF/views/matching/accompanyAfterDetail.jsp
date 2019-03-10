<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>together</title>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/include/toplink.jsp"%>

<!-- 동행 후기 게시판 css-->
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/together/accompanyAfterDetail.css"> --%>
<script>
	$(document).ready(function() {
	   var result = $('.copr').val();
	   $.ajax({
	      url : "${ pageContext.request.contextPath }/comment/commentlist/${afterdt.no}/review",
	      type : "get",
	      dataType:'JSON',
	      success : callback
	   });
	   
	   $('.parent_btn').click(function() {
	      
	      var commentval = $('#replyText').val();
	      
	      $.ajax({
	         url : "${ pageContext.request.contextPath }/comment/commentwrite/${afterdt.no}/review",
	         type : "POST",
	         dataType:'JSON',
	         data : 'boardno=${afterdt.no}&writer=${userVO.name}&content='+commentval, 
	         success : callback
	      });
	   });
	   
	   $(document).on('click','.parent_subBtn',function(){
	      var replyNo = $(this).attr('id');
	      $.ajax({
	         url : "${pageContext.request.contextPath}/comment/commentdelete/" + replyNo+"/${afterdt.no}/review",
	         type : 'get',
	         dataType:'JSON',
	         success : callback
	      });
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
      <a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"> <i></i>
      </a>

      <!-- aside 좌측 메뉴 -->
      <jsp:include page="/WEB-INF/views/include/aside.jsp" />

      <!-- header 상단 메뉴 -->
      <jsp:include page="/WEB-INF/views/include/topMenu.jsp" />

      <!-- main, footer -->
      <!-- 동행후기게시글 폼 -->
      <div id="colorlib-main">
         <section class="ftco-section">
            <!-- 정보 표시 div -->

            <div id="matching_DetailTbl">
               <div class="matching_After_Detail_Info">
                  <div class="matching_After_Detail_title">${afterdt.title}</div>
                  <div class="after_Detail_Info">
                     <span class="after_Detail_pro"> <img alt="프로필이미지"
                        src="${ pageContext.request.contextPath }/upload/userImg/${afterdt.member.profileImg}">
                     </span> <span class="after_Detail_name">${afterdt.writer}</span> <span
                        class="after_Detail_date">${afterdt.regDate}</span> <span
                        class="after_Detail_vCnt">조회수 : ${afterdt.viewCnt}</span>
                  </div>
                  <div class="matching_After_Detail">
                     <div id="matchingAfter_pic">
                        <c:forEach items="${afterimg}" var="img">
                           <img alt="놀고 난 후"
                              src="${pageContext.request.contextPath}/upload/review/${img.fileSaveName}">
                        </c:forEach>
                     </div>
                     ${afterdt.content}
                  </div>
                  <input type="submit" value="Delete" style="float: right;margin-left: 10px;"
                                 class="btn btn-primary py-3 px-5" class="accompanyWriteBtn" onclick="window.location.href='${pageContext.request.contextPath}/matching/accompanyAfterDelete/${afterdt.no}'">
                  <input type="submit" value="Update" style="float: right;"
                                 class="btn btn-primary py-3 px-5" class="accompanyWriteBtn" onclick="window.location.href='${pageContext.request.contextPath}/matching/accompanyAfterUpdate/${afterdt.no}'">
               </div>
            </div>

            <!-- 댓글 쓰기 -->
               <div class="parent_write">
                  <p>Comment</p>
                  <div class="parent">
                     <textarea id="replyText" class="" name="content" cols="30"
                        rows="10" placeholder="Comments that are irrelevant to the subject can be removed by admin."></textarea>
                     <button class="parent_btn">Reply</button>
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