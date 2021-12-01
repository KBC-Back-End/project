<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 작성</title>
</head>
<body>
<div>
		<%@include file="../header.jsp"%>
</div>
<div>
<h3>1:1 문의사항</h3>
<form action="/question/qnaWrite" method="post">
<table>

<tr>
<th>제목</th>
<td><input type="text" name="qtitle"></td>
</tr>
<tr>
<th>내용</th>
<td><textarea rows="5" name="qcontent"></textarea></td>
</tr>
<tr>
<th>작성자</th>
<td><input type="text" name="id" value="${member.id}"></td>
</tr>
<tr>
</table>
<input type="submit" value="문의완료">
</form>
</div>
<div>
		<%@include file="../footer.jsp"%>
</div>
</body>
</html>