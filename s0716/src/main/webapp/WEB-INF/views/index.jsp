<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>index.jsp</title>
	</head>
	<body>
		<h2>메인페이지</h2>
		<ul>
		<c:if test="${sessionId==null }">
			<h2>로그인해주세요</h2>
			<li><a href="/member/login">로그인</a></li>
			<li><a href="/member/join">회원가입</a></li>
		</c:if>
		<c:if test="${sessionId!=null }">
			<h2>${sessionName }님 환영합니다</h2>
			<li><a href="/member/logout">로그아웃</a></li>
			<li><a href="/member/memList">회원정보</a></li>
		</c:if>
		</ul>
	</body>
</html>