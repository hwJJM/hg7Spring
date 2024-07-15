<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입창</title>
	</head>
	<body>
		<h2>회원가입</h2>
		<form action="doMemberForm" method="post" name="frm">
		<label>아이디</label>
		<input type="text" name="id" id="id">
		<br>
		<label>비밀번호</label>
		<input type="text" name="pw" id="pw">
		<br>
		<label>이름</label>
		<input type="text" name="name" id="name">
		<br>
		<label>성별</label><br>
		<input type="radio" name="gender" id="male" value="male">
		<label for="male">남성</label>
		<input type="radio" name="gender" id="female" value="female">
		<label for="female">여성</label>
		<br><br>
		<input type="submit" value="전송">
		</form>
	</body>
</html>