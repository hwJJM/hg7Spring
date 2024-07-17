<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<title>회원가입</title>
		<style>
			*{margin: 0; padding: 0; }
			div{width: 400px; margin: 30px auto; text-align:center;}
			h1{margin-bottom: 30px;}
			table, th, td{border: 1px solid black; border-collapse: collapse;
							font-size: 16px;}
			th{width: 200px; height: 40px;}
			td{width: 400px; height: 40px;}
			button{width: 150px; height: 40px; margin-top: 30px;}
		</style>
		<script>
		$(function(){
			$("#fbtn").click(function(){
				alert("회원가입");
				m_frm.submit();
			});//fbtn
		});//jquery
		</script>
	</head>
	<body>
		<div>
			<h1>회원가입</h1>
			<form action="join" name="m_frm" method="post">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" id="id" name="id"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="pw" name="pw"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" id="name" name="name"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" id="phone" name="phone"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" id="Male" name="gender" value="Male">
						<label for="Male">남성</label>
						<input type="radio" id="Female" name="gender" value="Female">
						<label for="Female">여성</label>
					</td>
				</tr>
				<tr>
					<th>취미</th>
					<td>
						<input type="checkbox" name="hobby" id="game" value="game">
						<label for="game">게임</label>
						<input type="checkbox" name="hobby" id="golf" value="golf">
						<label for="golf">골프</label>
						<input type="checkbox" name="hobby" id="run" value="run">
						<label for="run">조깅</label>
						<input type="checkbox" name="hobby" id="cook" value="cook">
						<label for="cook">요리</label>
						<input type="checkbox" name="hobby" id="book" value="book">
						<label for="book">독서</label>
					</td>
				</tr>
			</table>
			<button type="button" id="fbtn">저장</button>			
			<button type="button" onclick="javascript:history.back()">취소</button>			
			</form>
		
		</div>
	
	</body>
</html>