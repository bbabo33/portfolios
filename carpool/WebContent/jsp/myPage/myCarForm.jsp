<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/carpool/assets/css/myPageCss.css">
<div class="myProfileArea">
	<div class="wrap">
		<form method="post" action="/carpool/myPage/MyCarProcess.do">
			<h2>차량등록</h2>
			<table>
				<tr>
					<th>차종</th>
					<td><input type="text" id="model" name="carName"><br>
					</td>
				</tr>
				<tr>
					<th>차번호</th>
					<td><input type="text" id=carNo name="carNo"></td>
				</tr>
				<tr>
					<th>흡연여부</th>
					<td><input type="radio" name="smoking" value="smoker">흡연
						<input type="radio" name="smoking" value="nonSmoker">금연</td>
				</tr>
				<tr>
					<th>탑승인원</th>
					<td><select name="rideNo">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
					</select></td>
				</tr>
				<tr>
					<th>대인배상</th>
					<td><input type="radio" name="direct" value="none">미가입
						<input type="radio" name="direct" value="joined">가입 <input
						type="radio" name="direct" value="dnk">모름</td>
				</tr>

			</table>
			<input type="submit" class="btn R" value="차량등록">
		</form>
	</div>
		<jsp:include page="/jsp/myPage/myPageMenu.jsp" />
		<div class="clear"></div>
</div>
