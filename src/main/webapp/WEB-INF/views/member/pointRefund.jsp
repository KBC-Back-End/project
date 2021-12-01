<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 환불 페이지</title>
</head>
<body>
<div>
<p> <c:out value="${member.point}"/>point 보유하고 있습니다.</p>
<form action="/member/pointRefund" method="post">
<p>환불은 전액환불로만 가능합니다.</p>
은행
<select>
<option>농협</option>
<option>국민</option>
<option>카카오뱅크</option>
<option>신한</option>
</select>
<p>계좌번호</p>
<input type="text">
<input type="submit" value="환불신청">
</form>
</div>
</body>
</html>