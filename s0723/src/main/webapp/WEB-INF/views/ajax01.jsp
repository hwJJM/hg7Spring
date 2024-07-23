<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<style type="text/css">
			button{width:200px; height:50px; margin:50px 0 30px 0; cursor:pointer;}
			table, th, td{border:1px solid black; border-collapse:collapse;
					width:1100px; margin-top:50px;
					margin:0 auto; text-align:center;}
			th, td{height:30px;}
		</style>
		<script type="text/javascript">
			$(function(){
				//test.txt 파일과 연결
				$("#loadBtn").on("click",function(){
					//alert("버튼1");
					$.ajax({
						url: "/test.txt",
						dataType: "text",
						success: function(data){
							alert('연결성공');
							console.log(data);
							//얘를 p태그에 넣기
							$("#text").text(data);
						},
						error: function(){
							alert("연결실패");
						}
					});//ajax
				});//loadBtn
				$("#ajaxBtn").click(function(){
					//alert("버튼2");
					$.ajax({
						url:"/ajaxTest.json",
						dataType: "json",
						success: function(data){
							alert('연결성공');
							console.log(data);
							let str = '';
							for(let i =0; i<data.length;i++){
								str+='<tr>';
								str+='<td>'+data[i].id+'</td>';
								str+='<td>'+data[i].first_name+'</td>';
								str+='<td>'+data[i].email+'</td>';
								str+='<td>'+data[i].gender+'</td>';
								str+='</tr>';
							}
							$("#btable").html(str);// 지우고 넣기
							//$("#btable").append(str); //있던 자료 밑으로 넣기
							//$("#btable").prepend(str); //있던 자료 위로 넣기
						},
						error: function(){
							alert("연결실패");
						}
					});//ajax
				});//ajaxBtn
				
				
			});//jquery
		</script>
	</head>
	<body>
		<h1>AJAX</h1>
		<p id="text"></p>
		<button id="loadBtn">load</button>
		<button id="ajaxBtn">ajax</button>
		<table>
			<tr>
				<td>번호</td>
				<td>이름</td>
				<td>이메일</td>
				<td>성별</td>
			</tr>
			<tbody id="btable">
				<tr>
					<td>1</td>
					<td>홍길동</td>
					<td>hong@aa.com</td>
					<td>남성</td>
				</tr>
			</tbody>
		</table>
		
	</body>
</html>