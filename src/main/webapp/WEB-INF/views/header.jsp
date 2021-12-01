<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<script src="${pageContext.request.contextPath}/resources/js1/common.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
</head>
<body>

   <div id="header">
            <div class="header_inner">
                <div id="top_header">

				<a href="/main" style="cursor: pointer;">
				<img src="${pageContext.request.contextPath}/resources/img/Logo.png" alt="nopic"></a>
                <h1><a href="/main" style="cursor: pointer;">Green Light</a></h1>
            </div>
					
		<div id="nav">
		
			<ul class="gnb">
			 <li><a href="#">공지사항</a>
                            <ul class="dpt2">
                                <li><a href="/board/boardList">공지사항</a></li>
                                <li><a href="/question/questionList">1:1문의</a></li>
                            </ul>    
                        </li>
                        <li><a href="#">대학정보</a>
                        <ul class="dpt2">
                                <li><a href="/uni/uniNameList">대학명 검색</a></li>
                                <li><a href="/uni/uniRegionList">지역별 검색</a></li>
                                <li><a href="/dpm/departmentNameList">학과별 검색</a></li>
                                <li><a href="/dpm/ldpmSelectList">계열별 검색</a></li>   
                            </ul>  
                        </li>
                        <li><a href="#">원서접수</a>
                            <ul class="dpt2">
                                <li><a href="/apply/applyForm">원서 접수</a></li>
                                <li><a href="/apply/applyList">원서 조회 및 취소</a></li>
                            </ul>    
                        </li>
                        <li><a href="#">포인트</a>
                            <ul class="dpt2">
                                <li><a href="/member/pointCharge">포인트 충전</a></li>
                                <li><a href="/member/pointRefund">포인트 환불</a></li>
                            </ul>    
                        </li>
                        <li><a href="/member/mypage">마이페이지</a></li>   
                    </ul>
                	</div>	
            </div>
        </div>
		<hr>
		
</body>
</html>