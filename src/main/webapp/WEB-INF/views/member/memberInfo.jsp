<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정 페이지</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style type="text/css">
.emRe{display:none;}
</style>
</head>
<body>
<div>
<form action="/member/memberInfo" method="post">
<table>
<tr>
<th>이름</th>
<td><input name="name" value="${member.name}" readonly>
<p>이름은 변경할 수 없습니다. <br>
※개명시 고객센터로 문의주시면 변경할수있도록 도와드립니다.</p></td>
</tr>
<tr>
<th>아이디</th>
<td><input name="id" value="${member.id}" readonly>
<p>아이디는 변경할 수 없습니다.</p></td>
</tr>
<tr>
<th>메일</th>
<td><input type="email" name="email" value="${member.email}" class="email_input">
</td>
</tr>
<tr>
<th>연락처</th>
<td><input type="tel" name="phone" value="${member.phone}"></td>
</tr>
<tr>
<th>비밀번호</th>
<td><input type="password" name="pw"></td>
</tr>
</table>
<input type="submit" value="수정하기" >
</form>
<a href="/main">메인페이지로 돌아가기</a>

</div>
<script type="text/javascript">
$(document).ready(function(){
	
	let password='<c:out value="${password}"/>';
	
	checkAlert(password);
function checkAlert(password){
		if(password==''){
			return;
		}
		if(password=="fail"){
			alert("비밀번호가 일치 하지 않습니다.")
		}
		
	}
	
});

</script>
</body>
</html>