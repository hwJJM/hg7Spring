<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>doLogin</title>
	</head>
	<body>
		<script type="text/javascript">
			if(${loginCheck}==1){
				alert("로그인 되었습니다.");
				location.href="/index";
			}else{
				alert("아이디 또는 비밀번호가 일치하지 않습니다.");
				location.href="login";
			}
		
		
		</script>
	</body>
</html>