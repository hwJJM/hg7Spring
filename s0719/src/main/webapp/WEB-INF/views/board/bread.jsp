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
 	<colgroup>
        <col width="80%">
        <col width="10%">
        <col width="10%">
      </colgroup>
    <table>
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
        <td colspan="3" clospan="3" class="article">
        <strong>파일</strong> <span class="separator">|</span>
        ${board.bfile }
        </td>
      </tr>
      <tr>
        <td colspan="3" class="article"><img src="/images/${board.bfile }"></td>
      </tr>
      <tr><td colspan="3"><strong>다음글</strong> <span class="separator">|</span> 착한 팩트 event</td></tr>
      <tr><td colspan="3"><strong>이전글</strong> <span class="separator">|</span> 해피 발렌타인데이</td></tr>
    </table>
<script type="text/javascript">
	function delBtn(){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href="bdelete?bno=${board.bno }";
		}
	}
</script>
    <a href="blist"><div class="list">목록</div></a>
    <a onclick="delBtn()"><div class="list">삭제</div></a>
    <a href="bmodi?bno=${board.bno }"><div class="list">수정</div></a>
    <a href="breply?bno=${board.bno }"><div class="list">답글달기</div></a>
  </section>

</body>
</html>