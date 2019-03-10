<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!-- 쪽지 -->
<link href="${pageContext.request.contextPath }/resources/css/talk.css"
   rel="stylesheet">
<script
   src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
   src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<html>
<head>
<title>together</title>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/views/include/toplink.jsp"%>
<!-- Timepicker 관련 -->
<link rel="stylesheet"
   href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<!-- end timepicker -->

<!-- 제이쿼리 datepicker 관련  -->
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- end datepicker  -->

<!-- 제이쿼리 timepicker -->
<script
   src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<!-- end timepicker -->

<!-- 제이쿼리 구버전과 최신버전의 혼용을 위한 쿼리소스 -->
<script
   src="${pageContext.request.contextPath }/resources/js/jquery-migrate-3.0.1.min.js"></script>
<!-- migrate end -->

<!-- 카카오 맵 api -->
<!-- <script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5bf9ccbd97a21e86fc6689488b54cd2e"></script> -->
<link
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
   type="text/css" rel="stylesheet">
<style>
.cttag {
   background-color: #abcdef;
}

.tagplusc {
   border: 1px solid #888888;
}
</style>
<script src="http://cdn.sockjs.org/sockjs-0.3.4.js"></script>
<script>























   $(document).ready(function() {
       $("#sendBtn").click(function() {
         sendMessage();
         $('#message').val('');
      });
      $("#message").keydown(function(key) {
         if (key.keyCode == 13) {// 엔터
            sendMessage();
            $('#message').val('');
         }
      });

      /* $.ajax({
         url : "${ pageContext.request.contextPath }/chatlist",
         type : "get",
         data : 'roomno=5',
         success : function(data) {
            $("#data").html('');
            console.log(data.chatmsg);
            for(var i = 0;i<data.chatmsg.length;i++){
               if(i==0){
                  $("#data").append("<hr>"+data.chatmsg[i].receiveDate+"<hr>");
               }else if(data.chatmsg[i].receiveDate != data.chatmsg[i-1].receiveDate){
                  $("#data").append("<hr>"+data.chatmsg[i].receiveDate+"<hr>");
               }
               $("#data").append("["+data.chatmsg[i].receiveTime+"]"+data.chatmsg[i].send+":"+data.chatmsg[i].content + "<br/>");
            }
         }
      }); */
      
      
      
      
      
      
      
      
      
      $('.vvosearch').on('click keyup',function(){
         var vtype = $(".vvotype option:selected").val();
         var vvalue = $(".vvoval").val();
         console.log(vtype+vvalue)
         $.ajax({
            url : "${ pageContext.request.contextPath }/search",
            type : "post",
            dataType:'JSON',
            data : 'type='+vtype+'&value='+vvalue,
            success : function(data){
               console.log(data);
               $('.tbdy').html('');
               $(data).each(function(){
                     var str = '<tr class="mt-5 '+this.email+'">';
                     str += '<th scope="row">'+ this.email +'</th>';
                     str += '<td>' + this.name +'</td><td>'+ this.country+','+this.gender +'</td>';
                     str += '<td style="text-align: right;" ><a href="#" > <img id="'+this.email+'" class="chatadd" src="${pageContext.request.contextPath }/resources/images/plusBtn.png" width="5%"/></a></td></tr>'
                     $('.tbdy').append(str);
               });
            }
         });
      });
      $('.tbdy').on('click', '.chatadd', function() {
         console.log($(this).attr('id'));
         var clickemail = '<span class="cttag">'+$(this).attr('id')+'</span>';
         if($('.tagplusc').html() != ""){
            $('.tagplusc').append(',');
         }
         $('.tagplusc').append(clickemail);
      });
      
      
      
      
      $('.cnewroom').on('click', function() {
         var joiners = $(".tagplusc").text();
         console.log(joiners);
         $.ajax({
            url : "${ pageContext.request.contextPath }/createroom",
            type : "post",
            dataType:'JSON',
            data : 'value='+joiners,
            success : function(data){
               if(data= 'success'){
                  sock.send("newroom");
                  location.href="${pageContext.request.contextPath}/mypage/talk";
               }
            }
         });
      });
      $.ajax({
         url : "${ pageContext.request.contextPath }/searchroom",
         type : "post",
         dataType:'JSON',
         data : 'name=${userVO.email}',
         success : function(data){
            $(data).each(function(){
               var str = '';
               str+='<div class="chat_list active_chat" id="'+this.no+'">'
                  str+='<div class="chat_people">'
                     /* str+='<div class="chat_img">'
                        str+='<img'
                           str+=' src="${pageContext.request.contextPath }/resources/images/person_2.jpg"'
                              str+='alt="sunil">'
                                 str+='</div>' */
                                    str+='<div class="chat_ib">'
                                       str+='<h5>'
                                          str+=this.roomname//+'<span class="chat_date">Dec 25</span>'
                                             str+='</h5>'
                                                str+='<p>'+this.joiner+'</p>'
                                                   str+='</div>'
                                                      str+='</div>'
                                                         str+='</div>'
               $('.inbox_chat').append(str);
            });
         }
      });
      $('.inbox_chat').on('click', '.chat_list', function() {
         var chatroomno = $(this).attr('id');
         $('#data').removeClass();
         $('#data').addClass(chatroomno);
         $.ajax({
            url : "${ pageContext.request.contextPath }/chatlist",
            type : "get",
            data : 'roomno='+chatroomno,
            success : function(data) {
               $("#data").html('');
               console.log(data.chatmsg);
               for(var i = 0;i<data.chatmsg.length;i++){
                  if(i==0){
                     $("#data").append("<hr>"+data.chatmsg[i].receiveDate+"<hr>");
                  }else if(data.chatmsg[i].receiveDate != data.chatmsg[i-1].receiveDate){
                     $("#data").append("<hr>"+data.chatmsg[i].receiveDate+"<hr>");
                  }
                  var  str='';
                        if(!('${userVO.email}' == data.chatmsg[i].send)){
                           str = '<div class="incoming_msg">'
                           str +=    '<div class="incoming_msg_img">'
                           str +='<img src="${ pageContext.request.contextPath }/upload/userImg/'+data.chatmsg[i].profile+'" alt="sunil">'
                           str +='</div>'
                           str +='<div class="received_msg">'
                           str +='<div class="received_withd_msg">'
                           str +='<p>'+data.chatmsg[i].content+'</p>'
                           str +='<span class="time_date">['+data.chatmsg[i].receiveTime+']</span>'
                           str +='</div>'
                           str +='</div>'
                           str +='</div>'
                        }else{
                           str+='<div class="outgoing_msg">'
                           str+='<div class="sent_msg">'
                           str+='<p>'+data.chatmsg[i].content+'</p>'
                           str+='<span class="time_date">['+data.chatmsg[i].receiveTime+']</span>'
                           str+='</div>'
                           str+='</div>'
                        }
                        
                        $("#data").append(str);
                  /* $("#data").append("["+data.chatmsg[i].receiveTime+"]"+data.chatmsg[i].send+":"+data.chatmsg[i].content + "<br/>"); */
               }
            }
         });
      });
   });
   
   var sock = new SockJS("<c:url value="/echo"/>");
   sock.onmessage = onMessage;
   sock.onclose = onClose;
   // 메시지 전송
   function sendMessage() {
      $.ajax({
         url : "${ pageContext.request.contextPath }/chatinput",
         type : "post",
         data : {
            send : "${userVO.email}",            //세션값
            roomno : $('#data').attr('class'),         //채팅대상 세션에 넣어서
            content : $("#message").val()
         },
         success : function(data) {
            $.ajax({
               url : "${ pageContext.request.contextPath }/chatlist",
               type : "get",
               data : 'roomno='+$('#data').attr('class'),
               success : function(data) {
                  $("#data").html('');
                  console.log(data.chatmsg);
                  for(var i = 0;i<data.chatmsg.length;i++){
                     if(i==0){
                        $("#data").append("<hr>"+data.chatmsg[i].receiveDate+"<hr>");
                     }else if(data.chatmsg[i].receiveDate != data.chatmsg[i-1].receiveDate){
                        $("#data").append("<hr>"+data.chatmsg[i].receiveDate+"<hr>");
                     }
                     var  str='';
                           if(!('${userVO.email}' == data.chatmsg[i].send)){
                              str = '<div class="incoming_msg">'
                              str +=    '<div class="incoming_msg_img">'
                              str +='<img src="${ pageContext.request.contextPath }/upload/userImg/'+data.chatmsg[i].profile+'" alt="sunil">'
                              str +='</div>'
                              str +='<div class="received_msg">'
                              str +='<div class="received_withd_msg">'
                              str +='<p>'+data.chatmsg[i].content+'</p>'
                              str +='<span class="time_date">['+data.chatmsg[i].receiveTime+']</span>'
                              str +='</div>'
                              str +='</div>'
                              str +='</div>'
                           }else{
                              str+='<div class="outgoing_msg">'
                              str+='<div class="sent_msg">'
                              str+='<p>'+data.chatmsg[i].content+'</p>'
                              str+='<span class="time_date">['+data.chatmsg[i].receiveTime+']</span>'
                              str+='</div>'
                              str+='</div>'
                           }
                           
                           $("#data").append(str);
                           $(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
                     /* $("#data").append("["+data.chatmsg[i].receiveTime+"]"+data.chatmsg[i].send+":"+data.chatmsg[i].content + "<br/>"); */
                  }
               }
            });
         }
      });
      sock.send("msg");
   }

   // 서버로부터 메시지를 받았을 때

   function onMessage(msg) {
      var dddata = msg.data;
      if(dddata=='msg'){
         var chatroomno = $(this).attr('id');
         $.ajax({
            url : "${ pageContext.request.contextPath }/chatlist",
            type : "get",
            data : 'roomno='+$('#data').attr('class'),
            success : function(data) {
               $("#data").html('');
               console.log(data.chatmsg);
               for(var i = 0;i<data.chatmsg.length;i++){
                  if(i==0){
                     $("#data").append("<hr>"+data.chatmsg[i].receiveDate+"<hr>");
                  }else if(data.chatmsg[i].receiveDate != data.chatmsg[i-1].receiveDate){
                     $("#data").append("<hr>"+data.chatmsg[i].receiveDate+"<hr>");
                  }
                  var  str='';
                        if(!('${userVO.email}' == data.chatmsg[i].send)){
                           str = '<div class="incoming_msg">'
                           str +=    '<div class="incoming_msg_img">'
                           str +='<img src="${ pageContext.request.contextPath }/upload/userImg/'+data.chatmsg[i].profile+'" alt="sunil">'
                           str +='</div>'
                           str +='<div class="received_msg">'
                           str +='<div class="received_withd_msg">'
                           str +='<p>'+data.chatmsg[i].content+'</p>'
                           str +='<span class="time_date">['+data.chatmsg[i].receiveTime+']</span>'
                           str +='</div>'
                           str +='</div>'
                           str +='</div>'
                        }else{
                           str+='<div class="outgoing_msg">'
                           str+='<div class="sent_msg">'
                           str+='<p>'+data.chatmsg[i].content+'</p>'
                           str+='<span class="time_date">['+data.chatmsg[i].receiveTime+']</span>'
                           str+='</div>'
                           str+='</div>'
                        }
                        
                        $("#data").append(str);
                        $(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);
                  /* $("#data").append("["+data.chatmsg[i].receiveTime+"]"+data.chatmsg[i].send+":"+data.chatmsg[i].content + "<br/>"); */
               }
            }
         });
      }else if(dddata='newroom'){
         $.ajax({
            url : "${ pageContext.request.contextPath }/searchroom",
            type : "post",
            dataType:'JSON',
            data : 'name=${userVO.email}',
            success : function(data){
            	$('.inbox_chat').html('');
               $(data).each(function(){	  
                  var str = '';
                  str+='<div class="chat_list active_chat" id="'+this.no+'">'
                     str+='<div class="chat_people">'
                        str+='<div class="chat_img">'
                           str+='<img'
                              str+=' src="${pageContext.request.contextPath }/resources/images/person_2.jpg"'
                                 str+='alt="sunil">'
                                    str+='</div>'
                                       str+='<div class="chat_ib">'
                                          str+='<h5>'
                                             str+=this.roomname+'<span class="chat_date">Dec 25</span>'
                                                str+='</h5>'
                                                   str+='<p>'+this.joiner+'</p>'
                                                      str+='</div>'
                                                         str+='</div>'
                                                            str+='</div>'
                  $('.inbox_chat').append(str);
               });
            }
         });
      }
   }

   // 서버와 연결을 끊었을 때

   function onClose(evt) {

      //$("#data").append("연결 끊김");

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
      <!-- 동행게시글 쓰기 폼 -->
      <div id="colorlib-main">

         <section class="ftco-section">
            <div class="container">
               <div class="row justify-content-center mb-5 pb-2">
                  <div class="col-md-7 heading-section text-center ftco-animate">
                     <h2 class="mb-4">TALK ♥ TALK</h2>
                  </div>
               </div>
               <div class="row">
                  <div class="blog-entry ftco-animate accompanyWrite">
                     <form name="travelPlanForm"
                        action="${ pageContext.request.contextPath    }">
                        <div class="form-align">
                           <div class="containers">
                              <div class="messaging">
                                 <div class="inbox_msg">
                                    <div class="inbox_people">
                                       <div class="headind_srch">
                                          <div class="recent_heading">
                                             <h4 style="display: inline;">Recent</h4>
                                             <a href="#" data-toggle="modal" data-target="#pluschat">
                                             	<span class="icon icon-plus"></span>
                                                <%-- <img
                                                src="${pageContext.request.contextPath }/resources/images/plusBtn.png"
                                                width="13%" style="margin-bottom: 3%; margin-left: 3%" /> --%>
                                             </a>

                                          </div>
                                          <div class="srch_bar">
                                             <div class="stylish-input-group">
                                                <input type="text" class="search-bar"
                                                   placeholder="Search"> <span
                                                   class="input-group-addon">
                                                   <button type="button">
                                                      <i class="fa fa-search" aria-hidden="true"></i>
                                                   </button>
                                                </span>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="inbox_chat">
                                          
                                       </div>
                                    </div>
                                    <div class="mesgs">
                                       <div class="msg_history" >
                                          <div id="data">
                                          <%-- <div class="incoming_msg">
                                             <div class="incoming_msg_img">
                                                <img
                                                   src="https://ptetutorials.com/images/user-profile.png"
                                                   alt="sunil">
                                             </div>
                                             <div class="received_msg">
                                                <div class="received_withd_msg">
                                                   <p>Test which is a new approach to have all
                                                      solutions</p>
                                                   <span class="time_date"> 11:01 AM | June 9</span>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="outgoing_msg">
                                             <div class="sent_msg">
                                                <p>Test which is a new approach to have all
                                                   solutions</p>
                                                <span class="time_date"> 11:01 AM | June 9</span>
                                             </div>
                                          </div>
                                          <div class="incoming_msg">
                                             <div class="incoming_msg_img">
                                                <img
                                                   src="${pageContext.request.contextPath }/resources/images/person_3.jpg"
                                                   alt="sunil">
                                             </div>
                                             <div class="received_msg">
                                                <div class="received_withd_msg">
                                                   <p>Test, which is a new approach to have</p>
                                                   <span class="time_date"> 11:01 AM | Yesterday</span>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="outgoing_msg">
                                             <div class="sent_msg">
                                                <p>Apollo University, Delhi, India Test</p>
                                                <span class="time_date"> 11:01 AM | Today</span>
                                             </div>
                                          </div>
                                          <div class="incoming_msg">
                                             <div class="incoming_msg_img">
                                                <img
                                                   src="https://ptetutorials.com/images/user-profile.png"
                                                   alt="sunil">
                                             </div>
                                             <div class="received_msg">
                                                <div class="received_withd_msg">
                                                   <p>We work directly with our designers and
                                                      suppliers, and sell direct to you, which means
                                                      quality, exclusive products, at a price anyone can
                                                      afford.</p>
                                                   <span class="time_date"> 11:01 AM | Today</span>
                                                </div>
                                             </div>
                                          </div> --%>
                                          </div>
                                       </div>
                                       <div class="type_msg">
                                          <div class="input_msg_write">
                                             <input type="text" class="write_msg" id="message"
                                                placeholder="Type a message" />
                                             <button class="msg_send_btn" type="button" id="sendBtn">
                                                <i class="fa fa-paper-plane-o" aria-hidden="true"></i>
                                             </button>
                                          </div>
                                       </div>
                                    </div>
                                 </div>

                              </div>
                           </div>
                        </div>
                     </form>
                  </div>
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
   <div class="modal fade" id="pluschat" tabindex="-1" role="dialog"
      aria-labelledby="pluschatLabel">
      <div class="modal-dialog modal_" role="document">
         <div class="modal-content ">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>

            </div>
            <div class="modal-body">
               <!-- <h1>Search</h1> -->
               <form class="navbar-form " role="search">
                  <select name="search" class="vvotype">
                     <option value="email">이메일</option>
                     <option value="name">이름</option>
                     <option value="all">이메일+이름</option>
                  </select> <input type="text"
                     class="form-control modal_search_text vvosearch vvoval"
                     placeholder="Search"> <a
                     class="btn btn-default modal_search_sub vvosearch">Search</a>
               </form>
               <div class="modal-result mt-5"
                  style="overflow: auto; height: 400px">
                  <h4>
                     <p class="font-weight-bold">Search Result</p>
                  </h4>
                  <table class="table table-hover mt-3">
                     <tbody class="tbdy">
                     </tbody>
                  </table>
               </div>
               <div class="tagplusc"></div>
               <button class="cnewroom btn btn-default">방만들기</button>
            </div>
         </div>
      </div>
   </div>
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