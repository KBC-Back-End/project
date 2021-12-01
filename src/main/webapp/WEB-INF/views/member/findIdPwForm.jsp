<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 페이지</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style type="text/css">
ul{list-style:none;}
ul.tab li {display:inline-block
color: #222; 
background: none;}
ul.tab li.current{display:none;
background: #ededed;
color: #222;}
.tab-content{display: none;
	background: #ededed;}
.tab-content.current{display: inherit;}
	
</style>
</head>
<body>
<div>
<ul>
<li class="tab-link current" data-tab="tab1">아이디</li>
<li class="tab-link" data-tab="tab2">비밀번호</li>
</ul>
<div id="tab1" class="tab-content current">
<h3>아이디 찾기</h3>
<form action="/member/findId" method="post">
<table border="1" >
<tr>
<th>이메일</th>
<td><input type="email" name="email" required="required"></td>
</tr>
</table>
<br><br>
<input type="submit" value="아이디 찾기">
</form>

<div>
<c:if test="${!empty id}">
<p>가입하신 아이디는 " <span>${id}</span> "입니다</p>
</c:if>
<br>
</div>



</div>


<div id="tab2" class="tab-content">
<h3>비밀번호 찾기</h3>
<form action="/member/updatePw" method="post">
<table border="1" >

<tr>
<th>이메일</th>
<td><input type="email" name="email" required="required"></td>
</tr>
</table>
<br><br>
<input type="submit" value="비밀번호 찾기">

</form>

</div>

</div>
<script type="text/javascript">

$(document).ready(function(){//탭으로 화면 전환
	
	
	let result='<c:out value="${result}"/>';
	
	checkAlert(result);
function checkAlert(result){
		if(result==''){
			return;
		}
		
		if(result=="fail"){
			alert("일치하는 정보가 없습니다.")
		}
		
	}


	
});

$('ul li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	});

</script>

</body>
</html>