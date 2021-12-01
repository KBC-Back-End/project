<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 충전 페이지</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<div>
<hr>
<div>
<p>카드사 선택</p>
<form>
<select>
<option>국민카드</option>
<option>신한카드</option>
<option>삼성카드</option>
</select>
<p>카드 번호 입력</p>
<input type="text"><input type="text"><input type="text">
</form>
</div>
<p>충전금액</p>
<form action="/member/pointCharging" method="post" id="charging">
<select  name="point">
<option value="50000">50,000</option>
<option value="100000">100,000</option>
<option value="200000">200,000</option>
</select>

<input type="submit" value="충전하기">
</form>
</div>
<script type="text/javascript">


</script>
</body>
</html>