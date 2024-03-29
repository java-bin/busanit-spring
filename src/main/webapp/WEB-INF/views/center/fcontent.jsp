<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>Welcome to Fun Web</title>
<link href="/resources/css/default.css" rel="stylesheet" type="text/css" media="all">
<link href="/resources/css/subpage.css" rel="stylesheet" type="text/css"  media="all">
<link href="/resources/css/print.css" rel="stylesheet" type="text/css"  media="print">
<link href="/resources/css/iphone.css" rel="stylesheet" type="text/css" media="screen">
</head>
<body>
<div id="wrap">
  <!--  헤더 영역 -->
	<jsp:include page="../include/header.jsp" />	
  <div class="clear"></div>
<div id="sub_img_center"></div>
<div class="clear"></div>
   <!--  nav 영역 -->
	<jsp:include page="../include/nav_center.jsp" />
<article>
<h1>Notice Content</h1>
<table id="notice">
	<tr>
  		<th class="twrite">글번호</th>
    	<td class="left" width="200">${board.num}</td> 
    	<th class="twrite">조회수</th>
    	<td class="left" width="200">${board.readcount}</td>
	</tr> 
	<tr>
  		<th class="twrite">작성자명</th>
    	<td class="left">${board.username}</td>
    	<th class="twrite">작성일자</th>
    	<td class="left"><fmt:formatDate value="${board.regDate}" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초" /></td>
	</tr> 
	<tr>
  		<th class="twrite">글제목</th>
    	<td class="left" colspan="3">${board.subject}</td>
	</tr> 
	<tr>
  		<th class="twrite">파일</th>
    	<td class="left" colspan="3">
    	
    		<c:forEach var="attach" items="${attachList}">
    			<c:choose>
    				<c:when test="${attach.filetype eq 'I'}"><%-- 이미지 타입 파일 --%>
    					<a href="/resources/upload/${attach.uploadpath}/${attach.uuid}_${attach.filename}" >
    					<img src="/resources/upload/${attach.uploadpath}/s_${attach.uuid}_${attach.filename}">
    					</a><br>
    				</c:when>
    				<c:otherwise><%-- 이미지가 아닌 일반 타입 파일 --%>
    					<a href="javascript:location.href='/board/download?fileName=${attach.uploadpath}/${attach.uuid}_'+ encodeURIComponent('${attach.filename}');" >
    					${attach.filename}
    					</a><br>
    				</c:otherwise>
    			</c:choose>
    		</c:forEach>
	    		
    	</td>
	</tr>   
	<tr>
  		<th class="twrite">글내용</th>
    	<td class="left" colspan="3"><pre>${board.content}</pre></td>
	</tr> 
</table>
<div id="table_search">
	<c:if test="${not empty id and id eq board.username}">
		<input type="button" value="글수정" class="btn" onclick="location.href='/board/fileModify?num=${board.num}&pageNum=${pageNum}';"/>
		<input type="button" value="글삭제" class="btn" onclick="checkDelete();"/>
	</c:if>
	<input type="button" value="답글쓰기" class="btn" onclick="location.href='/board/fileReWrite?reRef=${board.reRef}&reLev=${board.reLev}&reSeq=${board.reSeq}';"/>
	<input type="button" value="목록보기" class="btn" onclick="location.href='/board/filelist?pageNum=${pageNum}';"/>
</div>
</article>  
     <div class="clear"></div>
   <jsp:include page="../include/footer.jsp" />
</div>
<script>
	function checkDelete() {
		var result = confirm('${board.num}번 글을 정말로 삭제하시겠소?');
		if (result == true) {
		location.href = '/board/fileDelete?num=${board.num}&pageNum=${pageNum}';			
		}
	}
</script>
</body>
</html> 