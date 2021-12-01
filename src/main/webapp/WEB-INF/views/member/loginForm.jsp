<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<div>
<h3>로그인 페이지</h3>
	<form action="/member/loginForm" method="post">
		<table border="1">
			<tr>
				<th> 아이디 </th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th> 비밀번호 </th>
				<td><input type="password" name="pw"></td>
			</tr>
		</table>
		<c:if test="${result==0}">
		<div class="loginNot">ID 또는 비밀번호를 잘못 입력하셨습니다</div>
		</c:if>
		<br><br>
		<label><input type="submit" value="로그인"></label>
		<div>
		<a href='<c:url value="/member/findIdPwForm"/>'>아이디찾기</a>
		<a href='<c:url value="/member/findIdPwForm"/>'>비밀번호 찾기</a>
		</div>
		<br><br>
		<a href='<c:url value="/member/joinForm1"/>'>회원가입</a>
	</form>
	</div>
<script type="text/javascript">
$(document).ready(function(){
	
	
	let mail='<c:out value="${mail}"/>';
	
	checkAlert(mail);
function checkAlert(mail){
		if(mail==''){
			return;
		}
		
		if(mail=="sendMail"){
			alert("입력하신 이메일로 임시비밀번호를 전송했습니다.")
		}
		if(mail=="register"){
			alert("회원가입을 진심으로 축하드립니다.")
		}
	}	
});
</script>
</body>
</html>