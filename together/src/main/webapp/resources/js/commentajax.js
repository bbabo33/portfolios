/**
 * 
 */
$(document).ready(function() {
	var result = $('.copr').val();
	$.ajax({
		url : "${ pageContext.request.contextPath }/comment/commentlist",
		type : "get",
		data : {
			no :"${param.no}"
		},
		success : callback
	});
	$('#commentbtn').click(function() {
		
		var commentval = $('#replyText').val();
		
		$.ajax({
			url : "${ pageContext.request.contextPath }/comment/commentlist",
			type : "get",
			data : {
				no :"${param.no}",
				id : "임시아이디", // ${userVO.id}
				comment : commentval,
			}, 
			success : callback
		});
	});
});
function callback(data) {
	$('#replyText').empty();
	$('#replyUL').empty();
	$('#replyUL').append(data);
}