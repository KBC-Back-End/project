<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항 수정 페이지</title>
 	<style type="text/css">
	 	.content{margin:60px auto 0 auto;width: 1080px;height: 1000px;}
	 	#wrap{min-width:1200px; overflow:hidden;}
	 	tr th{height:20px; padding:5px 5px; border-color: lightgray;}
	 	.form-group{margin-bottom:20px;}
	 	#rbox{border: 1px solid gray; width:100%; height:600px; margin-top: 100px;}
	 	.form-control{width:200px;}
	 	.btn{margin-top:20px; margin-left:10px;}
	 	h2{margin-left: 50px; position:relation}}
	 	</style>
	 	    <link  rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
</head>
<body>
	<div id="wrap">
	<div>
		<%@include file="../header.jsp"%>
	</div>
	<div class="content">
<div id="rbox">
<form action="/board/reWrite" method="post">
<table>
<tr>
<th>게시글 번호</th>
<td><input name="bno" readonly value='<c:out value="${info.bno}"/>'></td>
</tr>
<tr>
<th>작성자</th>
<td><input name="id" readonly value='<c:out value="${info.id}"/>'></td>
</tr>
<tr>
<th>작성일</th>
<td><input name="regdate" readonly value='<fmt:formatDate pattern="yyyy/MM/dd" value="${info.regdate}"/>'></td>
</tr>
   <input type="text" name="title" class="form-control mt-4 mb-2"
      placeholder="제목을 입력해주세요." required value='<c:out value="${info.title}"/>'>

 <div class="form-group">
      <textarea class="form-control" rows="10" cols="6" name="content"
        placeholder="내용을 입력해주세요" required>
        <c:out value="${info.content}"/>
        </textarea>
    </div>
</table>
<input type="submit" value="수정" class="btn btn-secondary mb-3">
<input type="button" value="목록으로" onclick="location.replace('/board/boardList')" class="btn btn-secondary mb-3">
</form>
                     <form id="inform" action="/board/reWrite" method="get">
					<input type="hidden" id="bno" name="bno" value='<c:out value="${info.bno}"/>'>
					<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
					<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
					<input type="hidden" name="type" value="${cri.type }"> 
					<input type="hidden" name="keywordName" value="${cri.keywordName }"> 
					</form>
</div>
</div>
<div>
		<%@include file="../footer.jsp"%>
</div>
</div>
</body>
</html>