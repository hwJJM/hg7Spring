<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>mlist.jsp</title>
		<style>
			*{margin: 0; padding: 0; }
			div{width: 800px; margin: 30px auto; text-align:center;}
			h1{margin-bottom: 30px;}
			table, th, td{border: 1px solid black; border-collapse: collapse;
							font-size: 16px;}
			th{width: 200px; height: 40px;}
			td{width: 400px; height: 40px;}
			button{width: 150px; height: 40px;}
			.sbtn{width: 50px;}
		</style>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<body>
	<script type="text/javascript">
	function mlistBtn(){
		//alert("ck");
		$.ajax({
			url:"/member/selectAll",
			method:"post",
			success:function(data){
				alert('성공');
				console.log(data);
				let str='';
				for(let i=0;i<data.length;i++){
					str+='<tr>';
					str+='<td>'+data[i].id+'</td>';
					str+='<td>'+data[i].name+'</td>';
					str+='<td>'+data[i].gender+'</td>';
					str+='<td>'+data[i].hobbys+'</td>';
					str+='<td><button onclick="ibtn(\''+data[i].id+'\')" class="sbtn">수정</button>&nbsp;&nbsp;&nbsp;';
					str+='<button onclick="dBtn(\''+data[i].id+'\')" class="sbtn">삭제</button></td>';
					str+='</tr>';
				}
				$("#tbody").html(str);
			},
			error:function(){
				alert('실패');
			}
			
		});//ajax
	}//mlistBtn
	function saveBtn(){
		//alert("ck");
		var id = $("#uid").val();
		var pw = $("#upw").val();
		var name = $("#uname").val();
		var phone = $("#phone").val();
		var gender = $("input:radio[name='gender']:checked").val();
		var hobbys = '';
		$("input:checkbox[name='hobby']:checked").each(function(i){
			hobbys+=$(this).val()+', ';
		});
		//alert(id+pw+name+phone+gender+hobbys);
		
		 $.ajax({
			url:"/member/insertMember",
			method:"post",
			data:{"id":id,"pw":pw,"name":name,"phone":phone,"gender":gender,"hobbys":hobbys},
			success:function(data){
				alert("성공");
				console.log(data);
				let str='';
				str+='<tr>';
				str+='<td>'+data.id+'</td>';
				str+='<td>'+data.name+'</td>';
				str+='<td>'+data.gender+'</td>';
				str+='<td>'+data.hobbys+'</td>';
				str+='<td><button onclick="ibtn()" class="sbtn">수정</button>&nbsp;&nbsp;&nbsp;';
				str+='<button onclick="dBtn(\''+data.id+'\')" class="sbtn">삭제</button></td>';
				str+='</tr>';
				$("#tbody").prepend(str);
				
				$("#uid").val("");
				$("#upw").val("");
				$("#uname").val("");
				$("#phone").val("");
				$("input:checkbox[name='hobby']").prop("checked",false);
				
			},
			error:function(){
				alert("실패")
			}
		});//ajax 
	}//submitBtn
	function ibtn(mid){
		var id = $("#"+mid).children().eq(0).text();
		var id = $("#"+mid).children().eq(1).text();
		var id = $("#"+mid).children().eq(2).text();
		
		console.log(id);
		$("#uid").val('aaa');
		$("#upw").val('1111');
		$("#uname").val('홍길동');
		$("input:checkbox[name='hobby']").each(function(i){
			hobbys += $(this).val()+', ';
		});
		
	}
	function dBtn(mid){
		alert(mid);
		console.log(mid);
		//html 상에서 삭제
		$.ajax({
			url:"/member/delMem",
			method:"post",
			data:{"id":mid},
			success:function(data){
				alert("삭제하였습니다.");
				$("#"+mid).remove();
			},
			error:function(){
				alert("실패")
			}
		});//ajax
	}
	</script>
		<div>
			<h1> 회원 전체 리스트 </h1>
			<table>
				<colgroup>
					<col width="20%">	
					<col width="20">
					<col width="10%">
					<col width="30%">
					<col width="20%">
				</colgroup>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>성별</th>
					<th>취미</th>
					<th>삭제/수정</th>
				</tr>
			<tbody id="tbody">
				<tr>
					<td>aaa</td>
					<td>홍길동</td>
					<td>Male</td>
					<td>run</td>
					<td>
						<button onclick="ibtn()" class="sbtn">수정</button> &nbsp;&nbsp;&nbsp;
						<button onclick="dBtn()" class="sbtn">삭제</button>
					</td>
				</tr>	
			</tbody>
				

			</table>
			<br>
			<a onclick = "mlistBtn()"><button type="button">회원전체리스트</button></a>
		
			<br>
			<br>
		<hr>
		<br>
		<h1>회원가입</h1>
			<form action="" name="m_frm" method="post">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" id="uid" name="uid"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="upw" name="upw"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" id="uname" name="uname"></td>
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
			
			<br>
			<button type="button" id="fbtn" onclick="saveBtn()">저장</button>			
			<button type="button" onclick="javascript:history.back()">취소</button>			
			</form>
		
		</div>
	</body>
</html>