<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내신점수 조회</title>
</head>
<body>
<div>

<div>
<c:if test="${!empty member}">
 내신점수는 <p><c:out value="${member.grade}"/></p>입니다.
 </c:if>
 <c:if test="${empty member}">
 <p>내신점수를 입력하지 않았습니다. 마이페이지에서 저장해주세요.</p> 
 </c:if>
</div>
<a href="/member/mypage">마이페이지로 돌아가기</a>
</div>

</body>
</html>