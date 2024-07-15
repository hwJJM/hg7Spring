<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
	</head>
	<body>
		<h2>로그인</h2>
		<form action="doLogin" method="post" name="frm">
			<label>아이디</label>
			<input type="text" id="id" name="id"> <br>
			<label>비밀번호</label>
			<input type="text" id="pw" name="pw"> <br>
			<br>
			<input type="submit" value="로그인">
		</form>
	</body>
</html>