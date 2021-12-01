<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원서 조회 페이지</title>
</head>
<body>
<h2>원서 조회 페이지</h2>
<h3>MY 원서 조회</h3>
<form action="">
<table border="1">
<c:if test="${!empty map}">
<tr>
<th>학교명</th>
<th>학과명</th>
</tr>
<c:forEach var="key" items="${map}">

<tr>
<td><c:out value="${key}"/></td>
<td><c:out value="${key}"/></td>
</tr>
</c:forEach>
</c:if>
</table>
<br><br>
</form>
<a href="/main">메인으로</a>
</body>
</html>