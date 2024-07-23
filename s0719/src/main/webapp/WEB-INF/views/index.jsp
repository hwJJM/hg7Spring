<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>index</title>
	</head>
	<body>
		<h1>메인페이지</h1>
		<ul>
		<c:if test="${sessionId==null}">
			<h2>로그인해주세요</h2>
			<li><a href="/login">로그인</a></li>
		</c:if>
		<c:if test="${sessionId!=null}">
			<h2>${sessionName }님 환영합니다</h2>
			<li><a href="/logout">로그아웃</a></li>
			<li><a href="/board/blist">게시판</a></li>
		</c:if>
		</ul>
	</body>
</html>