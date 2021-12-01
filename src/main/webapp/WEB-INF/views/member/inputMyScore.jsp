<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내신성적 입력 </title>
</head>
<body>
<div>
<form action="/member/inputMyScore" method="post">
<table>
<tr>
<th>내신 점수 입력</th>
</tr>
<tr>
<td><input type="number" name="grade" placeholder="소수점 둘째자리까지 표시" min="1.0" max="5.0" step="0.1"></td>
</tr>
</table>
<input type="submit" value="저장">
<p>내신점수는 수정이 안되오니 정확하게 확인하여 입력하시길 바랍니다.</p>
</form>
</div>
</body>
</html>