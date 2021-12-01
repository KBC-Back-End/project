<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<div>
<form action="">
<a href="/member/memberInfo">개인정보수정</a>

<a href="/member/inputMyScore">내신점수입력하기</a>
<a href="/member/myScoreCheck">내신점수조회</a>
<a href="/member/checkMyPoint">포인트조회</a>
<a href="/member/dropMember">회원탈퇴하기</a>
<a href="/main">메인</a>
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
		if(result=="info"){
			alert("개인정보가 수정되었습니다.")
		}
		if(result=="grade"){
			alert("내신점수 등록을 완료했습니다.")
		}
		if(result=="fail"){
			alert("비밀번호가 일치하지 않아 탈퇴하지 못했습니다.")
		}
		if(result=="change"){
			alert("비밀번호가 변경되었습니다.")
		}
		if(result=="not"){
			alert("수정 실패.")
		}
	}
	
});
</script>
</body>
</html>