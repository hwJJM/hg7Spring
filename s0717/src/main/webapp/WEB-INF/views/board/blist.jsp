<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>list.jsp</title>
		<style type="text/css">
		*{margin:0; padding:0;}
		div{width:1000px; margin: 30px auto; text-align:center;}
		h1{margin-bottom: 30px;}
		table,th,td{border: 1px solid black; border-collapse:collapse; 
				font-size: 16px;}
		th,td { width: 200px; height: 40px;}
		button{width:200px; height: 60px; margin-top: 30px;}
		</style>
	</head>
	<body>
		<div><h1>게시판</h1>
			<table>
				<colgroup>
					<col width="12%">	
					<col width="40%">
					<col width="18%">
					<col width="18%">
					<col width="12%">
				</colgroup>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			<c:forEach var="b" items="${list }">
				<tr>
					<td> ${b.bno }</td>
					<td><a href="bview?bno=${b.bno}"> ${b.btitle }</a></td>
					<td> ${b.id }</td>
					<td> ${b.bdate }</td>
					<td> ${b.bhit }</td>
				</tr>			 
			</c:forEach>
			

				
			</table>
			<a href = "bwrite"><button type="button">글쓰기</button></a>
			<a href = "/"><button type="button">홈으로</button></a>
		</div>
	
	</body>
</html>