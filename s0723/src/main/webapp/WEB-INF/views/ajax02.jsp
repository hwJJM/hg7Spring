<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ajax02</title>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<style type="text/css">
			button{width:200px; height:50px; margin:50px 0 30px 0; cursor:pointer;}
			table, th, td{border:1px solid black; border-collapse:collapse;
					width:1100px; margin-top:50px;
					margin:0 auto; text-align:center;}
			th, td{height:30px;}
			img{width:70px;}
		</style>
		<script>
			$(function(){
				$("#ajaxBtn").click(function(){
					//alert("확인");
					$.ajax({
						url:"https://apis.data.go.kr/B551011/PhotoGalleryService1/galleryList1?serviceKey=P%2FQNQwlEl6IHVdufi9MuTBDDYtkJt4hNJW5EB9aDmEDo0q2ZoEjTNQ6xaa%2B6Zy%2FX7mOlGAjiygL3H15P3sxXKA%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&arrange=A&_type=json",
						dataType: "json",
						success: function(data){
							alert('연결성공');
							console.log(data);
							console.log(data.response.body.items.item[0]);
							let list = data.response.body.items.item;
							console.log(list.length);
							let str = '';
							for(let i=0;i<list.length;i++){
								str+='<tr>';
								str+='<td>'+list[i].galContentTypeId+'</td>';
								str+='<td>'+list[i].galCreatedtime+'</td>';
								str+='<td>'+list[i].galPhotographer+'</td>';
								str+='<td>'+list[i].galTitle+'</td>';
								str+='<td><img src="'+list[i].galWebImageUrl+'"></td>';
								str+='</tr>';
							}//for
							//$("#tbody").html();
							$("#tbody").append(str);
							//$("#tbody").prepend();
						},//success
						error: function(){
							alert('연결실패');
						}
					});//ajax
				});//ajaxBtn
				$("#ajaxXml").click(function(){
					//alert('확인');
					$.ajax({
						url:"https://apis.data.go.kr/B551011/PhotoGalleryService1/galleryList1?serviceKey=P%2FQNQwlEl6IHVdufi9MuTBDDYtkJt4hNJW5EB9aDmEDo0q2ZoEjTNQ6xaa%2B6Zy%2FX7mOlGAjiygL3H15P3sxXKA%3D%3D&numOfRows=20&pageNo=1&MobileOS=ETC&MobileApp=AppTest&arrange=A&_type=xml",
						dateType: "xml",
						success: function(data){
							alert('연결성공');
							console.log(data);
							console.log($(data).find("item"));
							let list = $(data).find("item");
							console.log(list.length);
							console.log(list[0]);
							let str='';
							
							for(let i=0;i<list.length;i++){
								str+='<tr>';
								str+='<td>'+list.eq(i).find("galContentTypeId").text()+'</td>'; 
													//eq 형제관계에 있는 것을 가져옴. 다음것 - table에서 배웠음
								str+='<td>'+list.eq(i).find("galCreatedtime").text()+'</td>';
								str+='<td>'+list.eq(i).find("galPhotographer").text()+'</td>';
								str+='<td>'+list.eq(i).find("galTitle").text()+'</td>';
								str+='<td><img src="'+list.eq(i).find("galWebImageUrl").text()+'"></td>';
								str+='</tr>';
							}//for
							//$("#tbody").html();
							$("#tbody").append(str);
							//$("#tbody").prepend();	
						},
						error: function(){
							alert('연결실패');
						}
					});//ajax
				});//ajaxXml
			});//jquery
		</script>
	</head>
	<body>
		<button id="ajaxBtn">공공 api 연결 json</button>
		<button id="ajaxXml">공공 api 연결 xml</button>
		
		<table>
			<tr>
				<td>번호</td>
				<td>촬영일자</td>
				<td>촬영기사</td>
				<td>제목</td>
				<td>이미지링크</td>
			</tr>
			<tbody id="tbody">
				<tr>
					<td>1</td>
					<td>20240724</td>
					<td>한국관광공사 홍길동</td>
					<td>문경새재도립공원</td>
					<td>http://.... .jpg</td>
				</tr>
			</tbody>
		</table>
	</body>
</html>