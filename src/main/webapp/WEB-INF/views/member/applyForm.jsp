<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원서 접수 페이지</title>
</head>
<body>
<h2>원서접수 신청 페이지</h2>
<p>원서는 접수되면 취소할 수 없습니다. <br> 신중하게 지원해주세요 </p>
<form action="/member/applyForm" method="post">
<table border="1">
<tr>
<th>성 명 :</th>
<td><input name="name" value="${member.name}" readonly> </td>
</tr>
<tr>
<th>지원 학교 :</th>
<td><input type="text" name="schoolName" > </td>
</tr>
<tr>
<th>지원 학과 :</th>
<td><input type="text" name="department"></td>
</tr>
<tr>
<th>이메일 :</th>
<td><input name="email" value="${member.email}" readonly> </td>
</tr>
<tr>
<th>연락처 :</th>
<td><input type="tel" value="${member.phone}" readonly> </td>
</tr>
</table>
<br><br>
자기소개서 <input type="file">
<br><br>
<input type="submit" value="작성 완료">
<a href="/main">메인페이지</a>
</form>
</body>
</html>