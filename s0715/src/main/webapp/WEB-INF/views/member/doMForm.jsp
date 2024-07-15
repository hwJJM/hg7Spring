<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>doMForm.jsp</title>
	</head>
	<body>
		<h1>회원가입확인</h1>
		<h3>아이디 : ${member.id }</h3>
		<h3>비밀번호 : ${member.pw }</h3>
		<h3>이름 : ${member.name }</h3>
		<h3>성별 : ${member.gender}</h3>
		<h3>직업 : ${member.job }</h3>
		<h3>취미 : ${member.hobby }</h3>
		
		<form action="updateMForm" method="post" name="frm">
		<input type="hidden" name="id" value="${member.id }">
		<input type="hidden" name="pw" value="${member.pw }">
		<input type="hidden" name="name" value="${member.name }">
		<input type="hidden" name="gender" value="${member.gender }">
		<input type="hidden" name="job" value="${member.job }">
		<input type="hidden" name="hobby" value="${member.hobby }">
		<input type="submit" value="수정">
		</form>
	</body>
</html>