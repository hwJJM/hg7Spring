<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <th colspan="3"><strong>${board.btitle }</strong></th>
      </tr>
      <tr>
        <td>${board.id }</td>
        <td>조회수</td>
        <td>${board.bhit }</td>
      </tr>
      <tr>
        <td class="article">${board.bcontent }</td>
      </tr>
      <tr>
      	<td colspan="3" class="article">
      	<strong>파일</strong>
      	<span class="separator">|</span>
      	${board.bfile }
      	</td>
      </tr>
      <tr>
        <td class="article">
      <c:if test="${board.bfile != null }">
        <img src="/images/${board.bfile }">
      </c:if>
      	<c:if test="${board.bfile == null }">
      	<strong>업로드된 파일이 없습니다</strong>
      </c:if>
        </td>
      </tr>
      <tr>
        <td><strong>다음글</strong> <span class="separator">|</span> 착한 팩트 event</td>
      </tr>
      <tr>
        <td><strong>이전글</strong> <span class="separator">|</span> 해피 발렌타인데이</td>
      </tr>
    </table>
<script type="text/javascript">
	function delBtn(){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href="bdelete?bno=${board.bno}";
		}
	}
</script>
    <div class="list"><a href="blist">목록</a></div>
    <div class="list"><a onclick="delBtn()">삭제</a></div>
    <div class="list"><a href="bmodi?bno=${board.bno }">수정</a></div>
    <div class="list"><a href="breply?bno=${board.bno }">답글달기</a></div>
  </section>

</body>
</html>