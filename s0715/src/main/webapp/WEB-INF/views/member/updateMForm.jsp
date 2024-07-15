<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>updateMForm</title>
	</head>
	<body>
		<h2>회원정보수정</h2>
		<%-- ${member.id } //확인 --%>
		<form action="doUpdateMForm" method="post" name="frm">
		<label>아이디</label>
		<input type="text" name="id" id="id" value="${member.id }">
		<br>
		<label>비밀번호</label>
		<input type="text" name="pw" id="pw" value="${member.pw }">
		<br>
		<label>이름</label>
		<input type="text" name="name" id="name" value="${member.name }">
		<br>
		<label>성별</label>
		<c:if test="${member.gender == 'male' }">
		<input type="radio" name="gender" id="male" value="male" checked>
		<label for="male">남성</label>
		</c:if>
		<c:if test="${member.gender != 'male' }">
		<input type="radio" name="gender" id="male" value="male">
		<label for="male">남성</label>
		</c:if>
		
		<input type="radio" name="gender" id="female" value="female"
		 <c:if test="${member.gender == 'female' }"> checked </c:if>>
		<label for="female">여성</label>
		
		<br>
		<label>직업</label>
		<select name="job">
		<!-- 방법 1 -->
			<c:if test="${member.job=='worker' }">
				<option value="worker" >회사원</option>
			</c:if>
			<c:if test="${member.job=='self' }">
				<option value="self" >자영업자</option>
			</c:if>
			<c:if test="${member.job=='freelancer' }">
				<option value="freelancer">프리랜서</option>
			</c:if>
			<c:if test="${member.job=='housewife' }">
				<option value="housewife" >전업주부</option>
			</c:if>
		</select>
		<!-- 방법 2 -->
		<select name="job">
			<c:if test="${member.job=='worker' }">
				<option value="worker" selected>회사원</option>
			</c:if>
			<option value="self" <c:if test="${member.job=='self' }">selected</c:if>>자영업자</option>
			<option value="freelancer" <c:if test="${member.job=='freelancer' }">selected</c:if>>프리랜서</option>
			<option value="housewife" <c:if test="${member.job=='housewife' }">selected</c:if>>전업주부</option>
		</select>
		<br>
		<label>취미</label><br>
		<!-- 방법 1 -->
		<c:if test="${fn:contains(member.hobby,'game') }">
		<input type="checkbox" name="hobbys" id="game" value="game" checked>
		<label for="game">게임</label>
		</c:if>
		<c:if test="${not fn:contains(member.hobby,'game') }">
		<input type="checkbox" name="hobbys" id="game" value="game">
		<label for="game">게임</label>
		</c:if>
		<!-- 방법 2 -->
		<input type="checkbox" name="hobbys" id="golf" value="golf"
			<c:if test="${fn:contains(member.hobby,'golf') }">checked</c:if>>
		<label for="golf">골프</label>
		<input type="checkbox" name="hobbys" id="run" value="run"<c:if test="${fn:contains(member.hobby,'run') }">checked</c:if>>
		<label for="run">달리기</label>
		<input type="checkbox" name="hobbys" id="book" value="book"<c:if test="${fn:contains(member.hobby,'book') }">checked</c:if>>
		<label for="book">독서</label>
		<input type="checkbox" name="hobbys" id="swim" value="swim"<c:if test="${fn:contains(member.hobby,'swim') }">checked</c:if>>
		<label for="swim">수영</label>
		<br><br>
		<input type="submit" value="전송">
		</form>
	</body>
</html>