<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그아웃</title>
	</head>
	<body>
	<script type="text/javascript">
		if(${logout}==1){
			alert("로그아웃 되었습니다.");
			location.href="/";
		}
	</script>
	</body>
</html>