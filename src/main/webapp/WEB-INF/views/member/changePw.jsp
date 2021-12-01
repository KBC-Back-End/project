<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<div>
<form action="/member/changePw" method="post">
<table>
<tr>
<th>기존 비밀번호</th>
<td><input type="password" name="pw"></td>
</tr>
<tr>
<th>새로운 비밀번호</th>
<td><input type="password" name="newPw"></td>
</tr>
</table>
<input type="submit" value="변경">
</form>
</div>

<script type="text/javascript">
$(document).ready(function(){
	
	let result='<c:out value="${result}"/>';
	
	checkAlert(result);
function checkAlert(result){
		if(result==''){
			return;
		}
		if(result=="fail"){
			alert("입력한 비밀번호가 일치하지 않습니다.")
		}
	
	}
	
});
</script>
</body>
</html>