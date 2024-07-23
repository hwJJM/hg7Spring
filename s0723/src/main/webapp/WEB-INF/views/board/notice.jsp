<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
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
<!--익스레이어팝업-->
<div id="ieUser" style="display:none">
	<div class="iewrap">	
		<p class="img"><img src="../images/ico/ico_alert.gif" alt="알림" /></p>
		<p class="txt">IE버전이 낮아 홈페이지 이용에 불편함이 있으므로 <strong>IE9이상이나 다른 브라우저</strong>를 이용해 주세요. </p>
		<ul>
			<li><a href="http://windows.microsoft.com/ko-kr/internet-explorer/download-ie" target="_blank"><img src="../images/ico/ico_ie.gif" alt="IE 최신브라우저 다운" ></a></li>
			<li><a href="https://www.google.com/intl/ko/chrome/browser" target="_blank"><img src="../images/ico/ico_chrome.gif" alt="IE 최신브라우저 다운" ></a></li>
			<li><a href="http://www.mozilla.org/ko/firefox/new" target="_blank"><img src="../images/ico/ico_mozila.gif" alt="MOZILA 최신브라우저 다운" ></a></li>
			<li><a href="http://www.apple.com/safari" target="_blank"><img src="../images/ico/ico_safari.gif" alt="SAFARI 최신브라우저 다운" ></a></li>
			<li><a href="http://www.opera.com/ko/o/ie-simple" target="_blank"><img src="../images/ico/ico_opera.gif" alt="OPERA 최신브라우저 다운" ></a></li>		
		</ul>
		<p class="btn" onclick="msiehide();"><img src="../images/ico/ico_close.gif" alt="닫기" /></p>
	</div>
</div>
<!--//익스레이어팝업-->
<!--IE 6,7,8 사용자에게 브라우저 업데이터 설명 Div 관련 스크립트-->
 <script type="text/javascript">
     var settimediv = 200000; //지속시간(1000= 1초)
     var msietimer;
     $(document).ready(function () {
         msiecheck();
     });
     var msiecheck = function () {
         var browser = navigator.userAgent.toLowerCase();
         if (browser.indexOf('msie 6') != -1 ||
                browser.indexOf('msie 7') != -1 ||
				 browser.indexOf('msie 8') != -1) {
             msieshow();			
         }
         else {
             msiehide();
         }
     }
     var msieshow = function () {
        $("#ieUser").show();
        msietimer = setTimeout("msiehide()", settimediv);
     }
     var msiehide = function () {
		$("#ieUser").hide();
        clearTimeout(msietimer);
     }
</script>
<div id="allwrap">
<div id="wrap">
<%@ include file="../top.jsp" %>
	<!-- container -->
	<div id="container">
		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li><a href="#">CUSTOMER</a></li>
				<li class="last">NOTICE</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title2">CUSTOMER<span>고객센터</span></div>
				<ul>	
					<li><a href="#" id="leftNavi1">NOTICE</a></li>
					<li><a href="#" id="leftNavi2">1:1문의</a></li>
					<li><a href="#" id="leftNavi3">FAQ</span></a></li>
					<li class="last"><a href="#" id="leftNavi4">이용안내</a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(1,0);</script>
			<!-- contents -->
			<div id="contents">
				<div id="customer">
					<h2><strong>NOTICE</strong><span>쟈뎅샵 소식을 전해드립니다.</span></h2>
					
					<div class="orderDivMt">
						<table summary="NO, 제목, 등록일, 조회수 순으로 공지사항을 조회 하실수 있습니다." class="orderTable2" border="1" cellspacing="0">
							<caption>공지사항 보기</caption>
							<colgroup>
							<col width="10%" class="tnone" />
							<col width="*" />
							<col width="14%" class="tw25" />
							<col width="14%" class="tnone" />
							</colgroup>
							<thead>
								<th scope="col" class="tnone">NO.</th>
								<th scope="col">제목</th>
								<th scope="col">등록일</th>
								<th scope="col" class="tnone">조회수</th>
							</thead>
							<tbody>
							<c:forEach var="board" items="${list }">
								<tr>
									<td class="tnone">${board.bno }</td>
									<td class="left">
										<c:forEach begin="1" end="${board.bindent }" step="1">
											<img src="/images/icon_reply.png" style="width:17px;" alt="답글">
										</c:forEach>
										<a href="noticeView?bno=${board.bno }&page=${page}&category=${category}&s_word=${s_word}">${board.btitle }</a>
										<!-- <img src="../images/ico/ico_new.gif" alt="NEW" /> -->
										<c:if test="${board.bfile!=null }">
											<img src="/images/image.png" style="width:17px; " alt="이미지 있음">
										</c:if>
									</td>
									<td><fmt:formatDate value="${board.bdate }" pattern="yyyy-MM-dd"/></td>
									<td class="tnone right">${board.bhit }</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
						
					<div class="btnAreaList">
						<!-- 페이징이동1 -->
						<div class="allPageMoving1">
						<c:if test="${ page!=1}">
							<a href="notice?page=1" class="n"><img src="../images/btn/btn_pre2.gif" alt="처음으로"/></a>
						</c:if>
						<c:if test="${ page==1}">
							<img src="../images/btn/btn_pre2.gif" alt="처음으로"/>
						</c:if>
						<c:if test="${page>1 }">
							<a href="notice?page=${page-1 }&category=${category}&s_word=${s_word}" class="pre"><img src="../images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
						</c:if>
						<c:if test="${page==1 }">
							<img src="../images/btn/btn_pre1.gif" alt="앞페이지로"/>
						</c:if>
					<c:forEach begin="${startPage }" end="${endPage }" step="1" var="pNum">
						<c:if test="${pNum==page }">
							<strong>${pNum }</strong>
						</c:if>
						<c:if test="${pNum!=page }">
							<a href="/board/notice?page=${pNum }&category=${category}&s_word=${s_word}">${pNum }</a>
							<%-- <a href="notice?page=${pNum }"> / : 루트에서 시작, 없으면 현재페이지에서 --%>
						</c:if>
					</c:forEach>
						<c:if test="${page<maxPage }">
							<a href="notice?page=${page+1 }" class="next"><img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/></a>
						</c:if>
						<c:if test="${page==maxPage }">
							<img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/>
						</c:if>
						<c:if test="${page!=maxPage }">
							<a href="notice?page=${ maxPage}" class="n"><img src="../images/btn/btn_next2.gif" alt="마지막페이지로"/></a>
						</c:if>
						<c:if test="${page==maxPage }">
							<img src="../images/btn/btn_next2.gif" alt="마지막페이지로"/>
						</c:if>
						</div>
						<!-- //페이징이동1 -->
					</div>
<script type="text/javascript">
function searchBtn(){
	//alert($("#category").val());
	//alert($("#s_word").val());
	if($("#s_word").val().length < 1){
		alert("글자를 입력하셔야합니다.");
		return false;
	}else{
		sFrm.submit();
	}
	
}
</script>
					<div class="searchWrap">
						<div class="search">
						<form action="/board/notice" name="sFrm" method="post">
							<ul>
								<li class="web"><img src="../images/txt/txt_search.gif" alt="search" /></li>
								<li class="se">
									<select name="category" id="category">
										<option value="all" <c:if test="${category=='all' }">selected</c:if>/>전체</option>
										<option value="title" <c:if test="${category=='title' }">selected</c:if>/>제목</option>
										<option value="content" <c:if test="${category=='content' }">selected</c:if>/>내용</option>
									</select>
								</li>
								<li><input type="text" value="${s_word }" name="s_word" id="s_word" class="searchInput" /></li>
								<li class="web"><a onclick="searchBtn()"><img src="../images/btn/btn_search.gif" alt="검색" /></a></li>
								<li class="mobile"><a onclick="searchBtn()"><img src="../images/btn/btn_search_m.gif" alt="검색" /></a></li>
							</ul>
						</form>
						</div>
					</div>
					<!-- //포토 구매후기 -->
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