<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>공지사항</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style type="text/css">

#frm1{
	width:100%;
	height: 130px;
	margin-top: 200px;
}
#mainWrapper {
	width: 50%;
	margin: 50px auto; /*가운데 정렬*/
}
.pageInfo{width: 30%;
	margin: 0 auto;}

#list {
	width: 1000px;
	height: 50px;
	margin-left:-220px;
	margin-top:100px;
	border-top: 2px solid black;
	border-bottom: 1px solid black;
	/*겉테두리와 안테두리를 하나로 합쳐준다. */
	border-collapse: collapse;
}

/*li {
	color: black; list-style : none;
	float: left;
	padding: 6px;
	list-style: none;
}*/
.content {
	margin:60px auto 0 auto;
	width: 1080px;
	height: 1500px; 
}
.wrap{
	min-width:1200px;
	overflow:hidden;
}
.search_area{
	float:right;
	margin-right:-250px;
	height:60px;
}
#moveForm{
	width: 95%;
	height: 200px;
	margin: 50px auto;
	
}

</style>

</head>
<body>
		<div class="wrap">
	<div>
		<%@include file="../header.jsp"%>
	</div>
	
	<div class="content">
	<form role="form" method="post" action="/board/write" id="frm1">
		<div id="mainWrapper">
	<div>
    <div class="search_area">
    <a href="/board/writeView">글 작성</a>
    <select name="type">
                <option value="" <c:out value="${page.cri.type == null?'selected':'' }"/>>--</option>
                <option value="T" <c:out value="${page.cri.type eq 'T'?'selected':'' }"/>>제목</option>
                <option value="C" <c:out value="${page.cri.type eq 'C'?'selected':'' }"/>>내용</option>
                <option value="W" <c:out value="${page.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
                <option value="TC" <c:out value="${page.cri.type eq 'TC'?'selected':'' }"/>>제목 + 내용</option>
                <option value="TW" <c:out value="${page.cri.type eq 'TW'?'selected':'' }"/>>제목 + 작성자</option>
                <option value="TCW" <c:out value="${page.cri.type eq 'TCW'?'selected':'' }"/>>제목 + 내용 + 작성자</option>
            </select> 
       <input type="text" name="keywordName" value="${page.cri.keywordName}">
    <button class="searchBtn">검색</button>       
    </div> 
    
	</div>
	
			<table id="list">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</tr>

				<c:forEach items="${list}" var="list">
					<tr>
						
						<td><c:out value="${list.bno}" /></td>
						<td><a class="move" href='<c:out value="${list.bno}"/>'>
                        <c:out value="${list.title}"/>
                    </a></td>
						<td><c:out value="${list.id}" /></td>
						<td><fmt:formatDate value="${list.regdate}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
    </table>
	
		</div>
</form>

<form id="moveForm" method="get">
<input type="hidden" name="pageNum" value="${page.cri.pageNum }">
<input type="hidden" name="amount" value="${page.cri.amount }"> 
 <input type="hidden" name="keywordName" value="${page.cri.keywordName}">
 <input type="hidden" name="type" value="${page.cri.type }">
</form>

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
		
		if(result=="reWrite"){
			alert("수정이 완료되었습니다.")
		}
		if(result=="remove"){
			alert("삭제 되었습니다.")
		}
	}
	
});
		let moveForm=$("#moveForm")
	
		
	$(".move").on("click",function(e){
		e.preventDefault();
		moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
        moveForm.attr("action", "/board/readView");
        moveForm.submit();
		
	});
	
	
	  
		$(".pageInfo a").on("click", function(e){
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/board/boardList");
			moveForm.submit();
		});	
	     
	
		$(".searchBtn").on("click",function(e){
		e.preventDefault();
		let type=$(".search_area select").val();
		let keywordName=$(".search_area input[name='keywordName']").val();
		
		 if(!type){
	            alert("검색 종류를 선택하세요.");
	            return false;
	        }
	        
	        if(!keywordName){
	            alert("키워드를 입력하세요.");
	            return false;
	        }        
	        
	     moveForm.find("input[name='type']").val(type);
		 moveForm.find("input[name='keywordName']").val(keywordName);
	     moveForm.find("input[name='pageNum']").val(1);
	     moveForm.submit();
		
	});
		


</script>
</div>
<div>
		<%@include file="../footer.jsp"%>
</div>
</body>
</html>

