<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="/css/read.css">
</head>

<body>
  <section>
    <h1>게시글</h1>
    <table>
     <colgroup>
        <col width="80%">
        <col width="10%">
        <col width="10%">
      </colgroup>
      <tr>
        <th colspan="3">제목</th>
      </tr>
      <tr>
        <th colspan="3">${board.btitle }</th>
      </tr>
      <tr>
        <td>${board.id }</td>
        <td>조회수</td>
        <td>${board.bhit }</td>
      </tr>
      <tr>
        <td colspan="3" class="article">${board.bcontent }</td>
      </tr>
      <tr>
        <td colspan="3" class="article">
        <strong>파일</strong> <span class="separator">|</span> 
        	${board.bfile }
        </td>
      </tr>
      <tr>
        <td colspan="3"  class="article">
        	<img src = "/images/${board.bfile }">
        </td>
      </tr>
      <tr><td  colspan="3" ><strong>다음글</strong> <span class="separator">|</span> 
      <a href="/board/bread?bno=${next.bno }&page=${page}&category=${category}&s_word=${s_word}">${next.btitle }</a> 
      </td> </tr>
      <tr><td  colspan="3" ><strong>이전글</strong> <span class="separator">|</span>
      <a href="/board/bread?bno=${prev.bno }&page=${page}&category=${category}&s_word=${s_word}">${prev.btitle }</a> 
      </td> </tr>
    </table>
<script type="text/javascript">
	function delBtn(){
		if(confirm("정말로삭제하시겠습니까?")){
			location.href="/";
		}
	}
</script>
    <div class="list"><a href="blist?page=${page }&category=${category}&s_word=${s_word}">목록</a></div>
    <div class="list"><a onclick="delBtn()">삭제</a></div>
    <div class="list"><a href="bmodi?bno=${board.bno }&page=${page }&category=${category}&s_word=${s_word}">수정</a></div>
    <div class="list"><a href="breply?bno=${board.bno }&page=${page }&category=${category}&s_word=${s_word}">답글달기</a></div>
  </section>

</body>
</html>