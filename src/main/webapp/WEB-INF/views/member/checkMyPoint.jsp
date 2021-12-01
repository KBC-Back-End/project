<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 조회</title>
</head>
<body>
<div>
<div>
<p><c:out value="${member.name}"/>님 <br>
 <c:out value="${member.point}"/> point 입니다.</p>
</div>
<a href="/member/pointCharge">포인트 충전</a>
<a href="/member/pointRefund">포인트 환불</a>
<a href="/member/mypage">마이페이지</a>
</div>
</body>
</html>