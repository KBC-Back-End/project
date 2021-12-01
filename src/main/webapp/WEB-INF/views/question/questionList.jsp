<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 리스트</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<div>
		<%@include file="../header.jsp"%>
</div>
<div>
<h3>1:1문의 입니다</h3>

<h4>문의내역은 수정 또는 삭제가 되지않습니다.</h4>
<p>상담원도 누군가의 가족입니다. 폭언이나 욕설을 하지말아주세요</p>
<hr>
<div><a href="/question/qnaWrite">문의 남기기</a></div>
<form >
<c:if test="${empty list}">
<p>문의 하신 내역이 없습니다.</p>
</c:if>
<c:if test="${!empty list}">
<table>
<tr>
<th>글번호</th>
<th>제목</th>
<th>작성일</th>
</tr>
<c:forEach var="list" items="${list}">
<tr>
<td>${list.qnum}</td>
<td><a href="">${list.qtitle}</a></td>
<td>${list.qwdate}</td>
</tr>
</c:forEach>


</table>
</c:if>
</form>
</div>

           <div class="pageInfo">
		
		        <!-- 이전페이지 버튼 -->
                <c:if test="${page.prev}">
                   <a href="${page.startPage-1}">◀</a>
                </c:if>
                
                <c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
                    <a href="${num}"><b>${num}</b></a>
                </c:forEach>
                
                
                <!-- 다음페이지 버튼 -->
                <c:if test="${page.next}">
                    <a href="${page.endPage + 1 }">▶</a>
                </c:if>    
		
		</div>
		
<script type="text/javascript">
$(document).ready(function(){
	
	let result='<c:out value="${result}"/>';
	
	checkAlert(result);
	
	function checkAlert(result){
		if(result==''){
			return;
		}
		
		if(result=="enroll"){
			alert("등록이 완료 되었습니다.")
		}
		if(result=="remove"){
			alert("문의글이 삭제되었습니다.")
		}
	}
});

let moveForm=$("#moveForm")


$(".move").on("click",function(e){
	e.preventDefault();
	moveForm.append("<input type='hidden' name='qnum' value='"+ $(this).attr("href")+ "'>");
    moveForm.attr("action", "/question/qnaView");
    moveForm.submit();
	
});


$(".pageInfo a").on("click", function(e){
	e.preventDefault();
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	moveForm.attr("action", "/question/questionList");
	moveForm.submit();
});	
</script>

<div>
		<%@include file="../footer.jsp"%>
</div>
</body>
</html>