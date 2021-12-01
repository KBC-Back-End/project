<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역별 대학 검색 페이지</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<div>
<h2>지역별 대학 검색 페이지</h2>
<a href='<c:url value="/main"/>'>메인검색페이지</a>
<form action="/uni/uniRegionList" class="search_area" method="post">
지역별 : <select name="keywordName">
<option value="강원">강원</option>
<option value="경기">경기</option>
<option value="경남">경남</option>
<option value="경북">경북</option>
<option value="광주">광주</option>
<option value="대구">대구</option>
<option value="대전">대전</option>
<option value="부산">부산</option>
<option value="서울">서울</option>
<option value="세종">세종</option>
<option value="울산">울산</option>
<option value="인천">인천</option>
<option value="전남">전남</option>
<option value="전북">전북</option>
<option value="제주">제주</option>
<option value="충남">충남</option>
<option value="충북">충북</option>
</select>
<input type="submit" value="검색">
<!-- <button>검색</button>-->
</form>

<form id="moveForm" method="get">
<input type="hidden" name="pageNum" value="${page.cri.pageNum }">
<input type="hidden" name="amount" value="${page.cri.amount}">
<input type="hidden" name="keywordName" value="${page.cri.keywordName}">
</form>

<script >
let moveForm = $("#moveForm");
$(".search_area button").on("click", function(e){   
	 e.preventDefault();
     let keywordName = $("input[name='keywordName']").val();
     moveForm.find("input[name='keywordName']").val(keywordName);
     moveForm.find("input[name='pageNum']").val(1);
     moveForm.submit();
 });
</script>

<c:choose>
<c:when test="${!empty list}">
<table border="1">
<tr>
<th>학교명</th>
<th>학교구분</th>
<th>학교유형</th>
<th>지역</th>
<th>주소</th>
<th>링크</th>
</tr>
<c:forEach var="r" items="${list}">
<tr>
<td>${r.schoolName}</td>
<td>${r.schoolCubun}</td>
<td>${r.schoolType}</td>
<td>${r.region}</td>
<td>${r.adres}</td>
<td><a href="${r.link}">${r.link}</a></td>
</tr>
</c:forEach>
</table>
</c:when>
<c:otherwise>
<p>검색 결과가 없습니다.</p>
</c:otherwise>
</c:choose>

              <!-- 페이징 -->
               <c:if test="${!empty list}">
               <div class="pageInfo">
                <!-- 이전페이지 버튼 -->
                <c:if test="${page.prev}">
                    <a href="${page.startPage-1}">Prev</a>
                </c:if>
                <c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
                    <a href="${num}"><b>${num}</b></a>
                </c:forEach>
                
                <!-- 다음페이지 버튼 -->
                <c:if test="${page.next}">
                    <a href="${page.endPage + 1 }">Next</a>
                </c:if>    
                </div>
                </c:if>
                
<script type="text/javascript">
$(".pageInfo a").on("click", function(e){
	e.preventDefault();
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	moveForm.attr("action", "/uni/uniRegionList");
	moveForm.submit();
});	
</script>

</div>

</body>
</html>