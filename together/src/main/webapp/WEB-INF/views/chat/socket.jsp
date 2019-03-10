<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">



<!-- jQuery CDN-->

<script src="https://code.jquery.com/jquery-1.9.0.js"
	></script>



<!-- Web socket CDN -->

<script src="http://cdn.sockjs.org/sockjs-0.3.4.js"></script>

</head>



<body>

	<input type="text" id="message" />

	<input type="button" id="sendBtn" value="전송" />



	<div id="data"></div>
</body>
<script type="text/javascript">
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

		$.ajax({
			url : "${ pageContext.request.contextPath }/chatlist",
			type : "get",
			//data로 받는사람을 넘겨줘서 selectbyreceive가 있어야함
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
		});
	});
	// 웹소켓을 지정한 url로 연결한다.
	let sock = new SockJS("<c:url value="/echo"/>");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	// 메시지 전송
	function sendMessage() {
		 var today = new Date();
		
		$.ajax({
			url : "${ pageContext.request.contextPath }/chatinput",
			type : "get",
			data : {
				send : "보낸사람",				//세션값
				receive : "받는사람",			//채팅대상 세션에 넣어서
				content : $("#message").val()
			},
			success : function(data) {
				alert("ㅅㄱ");
			}
		});
		sock.send("보낸사람‡받는사람‡" + "time" + "‡" + $("#message").val());
	}

	// 서버로부터 메시지를 받았을 때

	function onMessage(msg) {

		/* var data = msg.data;
		$("#data").append(data + "<br/>"); */
		$.ajax({
			url : "${ pageContext.request.contextPath }/chatlist",
			type : "get",
			//data로 받는사람을 넘겨줘서 selectbyreceive가 있어야함
			success : function(data) {
				$("#data").html('');
				for(var i = 0;i<data.chatmsg.length;i++){
					if(i==0){
						$("#data").append("<hr>"+data.chatmsg[i].receiveDate+"<hr>");
					}else if(data.chatmsg[i].receiveDate != data.chatmsg[i-1].receiveDate){
						$("#data").append("<hr>"+data.chatmsg[i].receiveDate+"<hr>");
					}
					$("#data").append("["+data.chatmsg[i].receiveTime+"]"+data.chatmsg[i].send+":"+data.chatmsg[i].content + "<br/>");
				}
			}
		});

	}

	// 서버와 연결을 끊었을 때

	function onClose(evt) {

		//$("#data").append("연결 끊김");

	}
</script>

</html>