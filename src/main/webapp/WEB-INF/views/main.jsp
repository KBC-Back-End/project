<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Green Light</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
<link rel="stylesheet" href="resources/css/main1.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="resources/js1/common.js"></script>
<script src="resources/js1/banner.js"></script>
<script src="resources/js1/dday.js"></script>
<script>
$(document).ready(function(){
 	$('.dpt2').hide();
 	$('.gnb > li').mouseenter(function(){
 	$(this).children('.dpt2').stop().slideDown();
 	});
 	
 	$('.gnb > li').mouseleave(function(){
 	$(this).children('.dpt2').stop().slideUp();
 	});
 });
</script>
</head>
<body>

	<div class="wrap">
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
                                <li><a href="/member/applyForm">원서 접수</a></li>
                                <li><a href="/member/applyList">원서 조회</a></li>
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
		
		<div id="article">
		<div class="article_inner">
		<p>당신의 대학에 <span style="color:green;">초록불</span>을 켜드립니다.</p>
		<h3>입시엔? 그린라이트!</h3>
		</div>
		</div>
		
		<div class="content_area">
			<div id="box1">
				<!--<div id="today_write"><span>포기는 빠를수록 좋다.</span></div>-->
			   <!-- Categories widget-->
                    <div class="card mb-4">
                        <div class="card-header">오늘의 명언</div>
                        <div class="card-body">
                            <div class="row">                        
      							<p>포기는 빠를수록 좋다.</p>
                            </div>
                        </div>
                    </div>
                    	<div id="notice">
                    	<div class="card-header">공지사항</div>
                    	</div>
			</div>
			<c:if test="${empty member}">
			<div class="box2">
				<div id="D_day"><div id="count"></div></div>
				<form action="/member/loginForm" id="fm_box" method="post">
				<div id="login_box">
				<input type="text" class="log" name="id"placeholder="아이디" ><br>
				<input type="password" class="log" name="pw"placeholder="비밀번호"><br>
				
				<a href=""><input type="submit" class="login_button" value="Login"></a><br>
				<a href="/member/findIdPwForm" class="sear">ID찾기</a><span class="nul">/</span>
				<a href="/member/findIdPwForm" class="sear">PW찾기</a><span class="nul"> l</span>
				<a href="/member/joinForm1" class="sear">회원가입</a>
				</div>
				</form>
				</div>
		</c:if>
		<c:if test="${!empty member }">
			<div class="box2">
				<div id="D_day"><div id="count"></div></div>
				<form action="/member/logout" id="fm_box" method="post">
				<div id="login_box">
				<input class="log" name="name"value="${member.name}님" readonly><br>
				<input class="log" name="email"value="${member.email}" readonly><br>
				
				<a href=""><input type="submit" class="login_button" value="LoginOut"></a><br>
				</div>
				</form>
				</div>
		</c:if>
		
		
		
		<div class="sliders_inner">
		<div class="slide">
      	<ul class="panel">
        	<li></li>
        	<li></li>
        	<li></li>
      </ul>
      <ul class="dot">
        	<li class="on"></li>
        	<li></li>
        	<li></li>
      </ul>
    </div>
    </div>
    
    <div id="event">
    <a href="https://www.work.go.kr/consltJobCarpa/jobPsyExam/youthUniDetail.do">
    <p>나에게 맞는 학과가<br> 궁금하다면?</p>
    <img src="resources/img/icon1.png">
  	</a>
    </div>
      <div id="event1">
    <a href="/question/questionList">
    <p>친절한 Q&A</p>
    <img src="resources/img/icon2.png">
  	</a>
    </div>
    
	<div id="calender">
<jsp:include page="js/calender.jsp" />
	</div>
	</div>
        <div id="footer">
        <div class="footer_inner">
            <address>
                http://www.greenlight.com <br>
         	 상호명 (주)GreenLight | Team : Greengers
		사업자등록번호 320-21-11115   | 고객센터 1544-8282 | 이메일 : greengers@gmail.co.kr
		Copyright2021 by nesin Co.Ltd., All right Reserved
            </address>
            </div>
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
		
		if(result=="charge"){
			alert("포인트 충전이 완료 되었습니다.")
		}
		if(result=="refund"){
			alert("환불 되었습니다.")
		}
		if(result=="drop"){
			alert("회원 탈퇴에 실패했습니다.");
		}
		if(result=="apply"){
			alert("원서접수가 정상적으로 접수 되었습니다.");
		}
		if(result=="notMember"){
			alert("회원 전용 공간입니다 로그인 후 이용해 주세요.");
		}
	}
	
});

</script>
</body>
</html>