<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 내역</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
</head>
<body>
<div>
		<%@include file="../header.jsp"%>
</div>
<div>
<table>
<tr>
<th>글번호</th>
<td><c:out value=""/></td>
</tr>
<tr>
<th>제목</th>
<td><c:out value=""/></td>
</tr>
<tr>
<th>내용</th>
<td><c:out value=""/></td>
</tr>
<tr>
<th>작성자</th>
<td><c:out value=""/></td>
</tr>
<tr>
<th>작성일</th>
<td><c:out value=""/></td>
</tr>

</table>
<a class="listBtn">목록으로</a>
</div>
                   <form id="inform" action="/question/questionList" method="get">
					<input type="hidden" id="qnum" name="qnum" value='<c:out value="${list.qnum}"/>'>
					<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
					<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
					
					</form>
<script type="text/javascript">
let form=$("#inform");

$(".listBtn").on("click",function(e){
	form.find("#qnum").remove();
	form.attr("action","/board/boardList");
	form.submit();
});

</script>
<div>
		<%@include file="../footer.jsp"%>
</div>
</body>
</html>