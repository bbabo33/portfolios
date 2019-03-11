<%@page import="kr.vo.BoardVO"%>
<%@page import="kr.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("input[name = post_list]").click(function() {
			location.href = "free_board.jsp";
		});
		
		$("input").click(function(event) {
			var name = $(event.target).attr("name");
			switch (name) {
				case "post_cancle":
					location.href = "detail_board.do?post_type=${post_type}&no=${no}";
					break;
				case "post_list":
					location.href = "board_list.do?post_type=${post_type}";
					break;
			}
		});
 		$("form[name=wForm]").submit(function(e) {
 			if(!checkForm())
 				return false;
 			e.preventDefault();
 			$.ajax({
				url : '<%=request.getContextPath()%>/board/update_board.do',
				type : 'post',
				data : {
					'no' : $("input[name=no]").val(),
					'title' : $("input[name=title]").val(),
					'content' : $("textarea[name=content]").val()
				},
				success : function(data){
					if(data.trim() == 1){
						alert("게시글이 업데이트되었습니다");
					} else {
						alert("게시글 업데이트에 실패했습니다");
					}
					location.href="<%=request.getContextPath()%>/board/detail_board.do?post_type=${post_type}&no=${ board.board_no }";
				},
				error : function(xhr, ajaxOptions, thrownError) {
					alert(xhr.status + " " + thrownError);
				}
			});
		});
 		function checkForm() {
			var f = document.wForm;
			if (f.title.value == '') {
				alert('제목을 입력하세요');
				f.title.focus();
				return false;
			}
 			if (f.content.value == '') {
				alert('내용을 입력하세요');
				f.content.focus();
				return false;
			}
			return true;
		}
 	});
</script>
<div align="center">
	<hr>
	<h3>게시글 수정</h3>
 	<form name="wForm" method="post"
		action="<%=request.getContextPath() %>/board/update_board.do">
		<table>
			<tr>
				<th width="23%">번호</th>
				<td class="L">
				<span>${ board.board_no }</span>
				<input type="hidden" name="no" value="${ board.board_no }"> 
				</td>
			</tr>
			<tr>
				<th width="23%">제목</th>
				<td><input type="text" name="title" value="${ board.title }"
					style="width: 100%;"></td>
			</tr>
			<tr>
				<th width="23%">글쓴이</th>
				<td class="L">
					<span>${ board.id }</span>
					<input type="hidden" name="writer" value="${ board.id }" style="width: 100%;">
				</td>
			</tr>
			<tr>
				<th width="23%">내용</th>
				<td>
				<textarea rows="7" cols="20" name="content" style="width: 100%;">${ board.content }</textarea></td>
			</tr>
		</table>
		<input class="btn" type="submit" name="post_edit" value="수정"> 
		<input class="btn" type="button" name="post_list" value="목록"> 
		<input class="btn" type="button" name="post_cancle" value="취소">
	</form>
</div> 