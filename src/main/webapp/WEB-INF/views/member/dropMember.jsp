<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 </title>
</head>
<body>
<div>
<h4>정말 회원 탈퇴를 하겠습니까?</h4>
<form action="/member/dropMember" method="post">
<p>탈퇴사유를 간략하게 작성해주세요.</p>
<p>사이트 발전에 도움이 된답니다.</p>
<input type="text">
<p>비밀번호를 입력해주세요</p>
<input type="password" name="pw">

<input type="submit" value="누르면 정말 안녕이예요 ">
</form>
</div>
</body>
</html>