<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<style type="text/css">
*{border-collase:collase}
.idRe{ display: none;}

.pwRe{ display: none;}

.emRe{ display: none;}
.join_box{width:100%; height:600px; margin:auto}
.join_box>form>input{width:260px; height:40px; margin-top:30px; margin-left:30px;}
</style>
</head>
<body>
	<div class="join_box">
		<a onClick="window.location.reload()" style="cursor: pointer;">
				<img src="${pageContext.request.contextPath}/resources/img/Logo.png" alt="nopic"></a>

		<form action="/member/joinForm2" method="post" autocomplete="off">
               
				이 름 : <input type="text" name="name" required><br>
			
				아이디: <input type="text" name="id" class="id_input"  required> <input type="button" value="아이디 중복 확인" class="idche">
					<div class="idRe"></div> <br>
				
				비밀번호 : <input type="password" name="pw"  class="pw_input" required><br>
				
					비밀번호 확인 : <input type="password"  class="pwck_input" required >
					<div class="pwRe"></div><br>
					연락처 : <input type="tel" name="phone" placeholder="'-'는 입력하지 않습니다" required ><br>
				
					이메일: <input type="email" name="email" required class="email_input"><input type="button" value="이메일 중복확인" class="mche">
					 	   <div class="emRe"></div><br>
				

			

<br>
		<label>	<input type="submit" value="회원가입완료" class="submit" disabled></label>
		</form>
		
		</div>
		
		<script >
			$(document).ready(function(){
		 
				
				
				
		
		//아이디 중복 체크를 하지 않은 경우
			$(".id_input").keyup(function(){
				$('.idRe').css("display","block");	
			$('.idRe').css("color","black");	
            $(".idRe").text("아이디를 확인해주십시오.");
            
                             });
		
		//아이디 중복체크
				$(".idche").click(function() {
			
			var id = $('.id_input').val();
			var data = {id:id};  //controller에 넘길 데이터이름 : 데이터 .id_input 에 입력되는 값
			
			$.ajax({
				url : "/member/memberIdChk",
				type : "POST",
				data : data,  
			
			success : function(result){

				if(result!='fail'){//사용가능한 아이디
					$('.idRe').css("display","block");
					$('.idRe').css("color","green");
					$(".idRe").text("사용가능한 아이디 입니다.");
					
				} else {//해당 아이디 이미 존재 함
					$('.idRe').css("display", "block");
					$('.idRe').css("color","red");
					$(".idRe").text("이미 존재하는 아이디 입니다.");
				}	
			}// success 종료
			
		}); // ajax 종료	
		
	});
		
				//이메일 중복체크
				$(".mche").click(function() {
			
			var email = $('.email_input').val();
			var data = {email:email};  //controller에 넘길 데이터이름 : 데이터 .email_input 에 입력되는 값
			
			$.ajax({
				url : "/member/memberEmailChk",
				type : "POST",
				data : data,  
			
			success : function(result){

				if(result!='fail'){//사용가능한 이메일
					$('.emRe').css("display","block");
					$('.emRe').css("color","green");
					$(".emRe").text("사용가능한 이메일 입니다.");
					 $(".submit").removeAttr("disabled");
					
				} else {//해당 이메일 이미 존재 함
					$('.emRe').css("display", "block");
					$('.emRe').css("color","red");
					$(".emRe").text("이미 가입된 이메일 입니다.");
				}	
			}// success 종료
			
		}); // ajax 종료	
		
	});
		
	
	//비밀번호&비밀번호확인 일치검사
	$('.pwck_input').on("propertychange change keyup paste input", function(){
		var pw = $('.pw_input').val();
	    var cfpw = $('.pwck_input').val();
	    
	    if(pw==cfpw){//두 비밀번호가 일치함
	    	 $('.pwRe').css('display','block');
	    	 $('.pwRe').css("color","blue");
	         $('.pwRe').text("비밀번호가 일치합니다");
	         }else{//일치하지 않음
	        	 $('.pwRe').css('display','block');
	        	 $('.pwRe').css("color","red");
		         $('.pwRe').text("비밀번호가 일치 하지 않습니다!");
	         }
	   
	    
	});
	
	
	//이메일 유효성 체크를 하지 않은 경우
	$(".email_input").keyup(function(){
		
	$('.emRe').css("display","block");
	$('.emRe').css("color","black");
    $(".emRe").text("이메일을 확인해주세요.");
      
                     });
	
	
	
	//email 유효성 검사 - 사용자가 "xxxxx@xxx.com"형식을 사용을 하는지 확인
	//$(".mche").click(function() {
		$(".email_input").keyup(function(){
		//email이 form에 저장된 정규표현식에 부합할 경우 true/ 부합하지 않을 경우 false 반환
		var form=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
		var email= $('.email_input').val();
		
		
		if(form.test(email)==false){//이메일형식 오류시
			$('.emRe').css("display","block");
			$('.emRe').css("color","red");
			$('.emRe').text("올바른형식의 이메일이 아닙니다");
		}else{
			$('.emRe').css("display","none");
			 
			
		}
	});
	
	
	
	
	
	
	
	});
		</script>

	

</body>
</html>