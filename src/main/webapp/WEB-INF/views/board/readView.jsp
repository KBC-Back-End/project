<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<title>게시판</title>
	 	<style type="text/css">
	 	.content{margin:60px auto 0 auto;width: 1080px;height: 1500px;}
	 	#wrap{min-width:1200px; overflow:hidden;}
	 	#container{height:500px;}
		td{width:100px;}
		table{hegiht:500px;}
		header{margin-bottom:30px;}
		hr{margin-bottom:20px;}
	 	</style>
	 	<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
	</head>
	<body>
	
	<div id="wrap">
	<div>
		<%@include file="../header.jsp"%>
	</div>
	<div class="content">
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr>
			
			<section id="container">
				<form  method="post">
					<table border="1">
						<tbody>
							<tr>
							<th>글 번호</th>
								<td> 
									<c:out value="${read.bno}"/>
								</td>
							</tr>	
							<tr>
							<th>제목</th>
								<td>
									<c:out value="${read.title}"/>
								</td>
							</tr>	
							<tr>
							<th>내용</th>
								<td>
									<c:out value="${read.content}"/>
								</td>
							</tr>
							<tr>
							<th>작성자</th>
								<td>
									<c:out value="${read.id}"/>
								</td>
							</tr>
							<tr>
							<th>작성날짜</th>
								<td>
									<fmt:formatDate pattern="yyyy/MM/dd" value="${read.regdate}"/>			
								</td>
							</tr>		
						</tbody>			
					</table>
					</form>
					<div>
					<a class="listBtn">목록으로</a>
					<a class="rewriteBtn">수정하기</a>
					<a class="removeBtn">삭제하기</a>
				</div>
					<form id="inform" action="/board/reWrite" method="get">
					<input type="hidden" id="bno" name="bno" value='<c:out value="${read.bno}"/>'>
					<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
					<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
					<input type="hidden" name="type" value="${cri.type }"> 
					<input type="hidden" name="keywordName" value="${cri.keywordName }"> 
					</form>
				
			</section>
			<hr />
		</div>
		<script type="text/javascript">
		
		
			let form=$("#inform");
			
			$(".listBtn").on("click",function(e){
				form.find("#bno").remove();
				form.attr("action","/board/boardList");
				form.submit();
			});
			
			$(".rewriteBtn").on("click", function(e){
				
				form.submit();
			});
			
			
			$(".removeBtn").on("click",function(e){
				form.attr("action","/board/remove");
				form.attr("method","post");
				form.submit();
			});
			
		</script>
		</div>
		<div>
		<%@include file="../footer.jsp"%>
</div>
</div>
	</body>
</html>