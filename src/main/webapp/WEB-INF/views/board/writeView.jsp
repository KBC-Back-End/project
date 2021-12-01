<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script></head>
<body>
    <div id="root">
		<header>
			<h1>공지사항</h1>
		</header>
		<hr />
		<div>
		<%@include file="../header.jsp"%>
	</div>
		<hr />
<div class="container">
  <h2>공지사항 작성</h2>
  <form  action="/board/writeView" method="post">
    <div class="form-group">
      <label for="title">제목</label>

      <input type="text" class="form-control" id="title"
       placeholder="제목 입력(1-100)" name="title"
       maxlength="100" required="required"
       pattern=".{1,100}">
    </div>
    <div class="form-group">
   <label for="content">내용</label>

   <textarea class="form-control" rows="5" id="content"
    name="content" placeholder="내용 작성"></textarea>
 </div>
    <div class="form-group">
      <label for="id">작성자</label>
      <input type="text" class="form-control" id="id"
       placeholder="작성자" name="id" value="${member.id}">
    </div>
    <button type="submit">등록</button>
    <button type="reset">취소</button>
  </form>
</div>
</div>
<div>
		<%@include file="../footer.jsp"%>
</div>
</body>
</html>




