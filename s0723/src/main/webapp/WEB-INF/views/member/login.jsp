<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title> JARDIN SHOP </title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="JARDIN SHOP" />
<meta name="keywords" content="JARDIN SHOP" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<link rel="stylesheet" type="text/css" href="../css/reset.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/layout.css?v=Y" />
<link rel="stylesheet" type="text/css" href="../css/content.css?v=Y" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/top_navi.js"></script>
<script type="text/javascript" src="../js/left_navi.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="../js/idangerous.swiper-2.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.anchor.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<!--[if lt IE 9]>
<script type="text/javascript" src="../js/html5.js"></script>
<script type="text/javascript" src="../js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
$(document).ready(function() {
	


});
</script>
</head>
<body>

<%@ include file="../top.jsp" %>


	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li><a href="#">MEMBERSHIP</a></li>
				<li class="last">로그인</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title2">MEMBERSHIP<span>멤버쉽</span></div>
				<ul>	
					<li><a href="#" id="leftNavi1">로그인</a></li>
					<li><a href="#" id="leftNavi2">회원가입</a></li>
					<li><a href="#" id="leftNavi3">아이디/<span>비밀번호 찾기</span></a></li>
					<li><a href="#" id="leftNavi4">회원약관</a></li>
					<li><a href="#" id="leftNavi5">개인정보<span>취급방침</span></a></li>
					<li class="last"><a href="#" id="leftNavi6">이메일무단<span>수집거부</span></a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(1,0);</script>
<script type="text/javascript">
$(function(){
	$("#loginBtn").click(function(){
		//alert("로그인버튼");
		//alert($("#id").val());
		//alert($("#pw").val());
		if($("#id").val().length<1){
			alert("아이디를 입력하셔야합니다.");
			$("#id").focus();
			return false;
		}
		let id = $("#id").val();
		let pw = $("#pw").val();
		
		//기존 jsp 방식
		//loginFrm.submit();
		$.ajax({
			url: "/member/ajaxLogin",
			method : "post",
			data: {"id":id, "pw":pw},
			dataType: "text",
			success: function(data){
			/* 	alert('성공');
				console.log(data); */
			if(data=="1"){
				alert("로그인 되었습니다.");
				location.href="/";
			}else{
				alert("아이디 또는 패스워드가 일치하지 않습니다.");
				$("#pw").val(""); //패스워드 삭제
				$("#pw").focus(); 
			}
			},
			error: function(){
				alert('실패');
			}
			
		})// ajax
	});
});//jquery
</script>

			<!-- contents -->
			<div id="contents">
				<div id="member">
					<h2><strong>로그인</strong><span>로그인 후 주문하시면 다양한 혜택을 받으실 수 있습니다.</span></h2>
					<h3>회원 로그인</h3>
					<!-- form 태그 추가 -->
					<form action="/member/login" method="post" name="loginFrm" id="loginFrm">
						<div class="informbox">
							<div class="inform">
								<ul>
									<li><!-- id -->
										<input type="text" id="id" name="id" class="loginType" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='loginType'}else {this.className='mfocusnot'}" style="ime-mode:inactive;" />
									</li>
									<li><!-- pw -->
										<input type="text" id="pw" name="pw" class="passType" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='passType'}else {this.className='mfocusnot'}" style="ime-mode:inactive;" />
									</li>
								</ul>
	
								<div class="btn"><a id="loginBtn" class="sbtn">로그인</a></div>
								<div class="chk"><input type="checkbox" id="idsave"/><label for="idsave">아이디 저장</label></div>							
	
								<div class="point">
									<p>아이디와 비밀번호를 잊으셨나요?</p>
									<a href="#" class="nbtn">아이디/비밀번호 찾기</a>
								</div>
							</div>
						</div>
					</form>



					<h3>비회원 주문 조회</h3>
					<div class="informbox">
						<div class="inform">
							<ul>
								<li><input type="text" class="ordererType" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='ordererType'}else {this.className='mfocusnot'}" /></li>
								<li><input type="text" class="ordernumType" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='ordernumType'}else {this.className='mfocusnot'}" /></li>
							</ul>

							<div class="btn"><a href="#" class="gbtn">조회하기</a></div>
							<div class="point">
								<p>아직 JARDIN 회원이 아니신가요? <span>회원가입하시고 다양한 혜택을 받으세요.</span></p>
								<a href="#" class="nbtn">회원가입</a>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- //contents -->


		</div>
	</div>
	<!-- //container -->


<%@ include file="../foot.jsp" %>

	



</div>
</div>
</body>
</html>