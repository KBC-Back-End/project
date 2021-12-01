package spring.controller;


import java.util.HashMap;

import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



import spring.service.Mservice;
import spring.vo.DpmVo;
import spring.vo.Member;
import spring.vo.UniVo;

@Controller
@Service
@RequestMapping(value="/member/*")
public class MemberController {

	private static final Logger log =LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private Mservice service;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder; //비밀번호 인코딩
	
	
	JavaMailSender mailSender;//메일보내기
	
	
	
	//회원가입 페이지 - 약관
	@GetMapping("/member/joinForm1")
	public void memberRegisterEntry() {}
	
    //가입페이지
	@GetMapping(value = "/member/joinForm2") 
  public void memberRegisterGET() {}
	

	//회원가입 페이지 
	@RequestMapping(value="/member/joinForm2",method=RequestMethod.POST)
	public String memberRegisterPOST(Member member,RedirectAttributes rttr)throws Exception{
		String rawpw=""; //인코딩 전 비밀번호
		String encodePw = ""; //인코딩 후 비밀번호
		rawpw = member.getPw(); // 비밀번호 데이터를 얻어 온다.
		encodePw=pwEncoder.encode(rawpw);//비밀번호 인코딩
		member.setPw(encodePw); //인코딩된 비밀번호를 member 객체에 다시 저장.
		
		//회원가입 진행
		service.memberRegister(member);
		log.info("register success");
		rttr.addFlashAttribute("mail", "register");
		return "/member/loginForm"; //로그인으로 이동
	}		

	//아이디 중복체크 	
	@RequestMapping(value="/memberIdChk", method =RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String id)throws Exception{
		
		int result=service.idCheck(id);
		if(result!=0) {
			return "fail";
		}else {
			return"success";
		}
	}
	
	//이메일중복체크(비밀번호 찾기시 메일로 전송하기때문에 중복 x)
	@RequestMapping(value="/memberEmailChk", method =RequestMethod.POST)
	@ResponseBody
	public String memberEmailChkPOST(String email)throws Exception{
		int result =service.emailCheck(email);
		if(result!=0) {
			return "fail";
		}else {
			return "success";}	
	}
		
	   //로그인 페이지 접속
	   @GetMapping("/member/loginForm")	
		public void memberLoginGET() {}
	   
       //아이디 & 비밀번호 찾기 페이지
	   @GetMapping("/member/findIdPwForm")
	   public void  findIdPwGET() {
		 
	   }
	   
	   //가입할때 입력한 이메일로 아이디 찾기
	   @RequestMapping(value="/findId", method=RequestMethod.POST)
	   public String findId( Model model,String email,RedirectAttributes rttr) throws Exception{
		  
		   String id= service.findId(email);
		   
		   if(id!=null) {
			model.addAttribute("id",id);
			return "/member/findIdPwForm";
		   }
		   rttr.addFlashAttribute("result", "fail");
		   return "redirect:/member/findIdPwForm";
	   }  
	   
	 //비밀번호찾기
	   @RequestMapping(value="/updatePw", method=RequestMethod.POST)
		public String findPw(@ModelAttribute Member member, HttpSession session,String email,RedirectAttributes rttr) throws Exception{
		    
		  if( service.findEmail(email)!=null) {// 일치
			  String tmpPw=UUID.randomUUID().toString().replace("-", "");//-제거
			  tmpPw=tmpPw.substring(0,4); //랜덤의 비밀번호 생성
			  
			  member.setPw(tmpPw); //비밀번호 변경
			  
			  sendMail(member);
			  
			  String encodePw=pwEncoder.encode(member.getPw());//비밀번호 인코딩
			  
			  member.setPw(encodePw);//인코딩한 비밀번호를 다시 비밀번호로 설정
			  
			  service.updatePw(member);		  
			 
			 rttr.addFlashAttribute("mail", "sendMail");
			return "redirect:/member/loginForm";
		  }
		  rttr.addFlashAttribute("result", "fail");
		  return "redirect:/member/findIdPwForm";
		  
		}
	   
		//메일설정 (비밀번호 분실시 임시비밀번호 전송 GET형식)
	   @GetMapping("/sendMail")
		public String sendMail( Member member) throws Exception{
		   String user="";
		   String password="";
		// SMTP 서버 정보를 설정한다. 
		   Properties prop = new Properties(); 
		   prop.put("mail.smtp.host", "smtp.gmail.com"); 
		   prop.put("mail.smtp.port", 465); 
		   prop.put("mail.smtp.auth", "true"); 
		   prop.put("mail.smtp.ssl.enable", "true");
		   prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");	   
		   
		   Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			   protected PasswordAuthentication getPasswordAuthentication() {

			   return new PasswordAuthentication(user, password);
			   }
		   });

			try {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(user));
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(member.getEmail()));
				message.setSubject("green light 임시 비밀번호 메일입니다");
				message.setText("안녕하세요  green light입니다    임시 비밀번호는 "+member.getPw()+"입니다. 사이트로 방문하셔서 비밀번호를 변경하시길 바랍니다.");
				Transport.send(message);
				System.out.println("message sent.....");
				
		} catch(AddressException e){
			e.printStackTrace();
		}catch (MessagingException e) {
			e.printStackTrace();
		}
        return "/member/loginForm";
		   }

	
	//로그인 기능 
	@RequestMapping(value = "/member/loginForm", method=RequestMethod.POST)
	public String memberLoginPOST(Member member, RedirectAttributes rttr,HttpServletRequest req)throws Exception{
		HttpSession session=req.getSession();
		Member m=service.memberLogin(member);
		                                 //입력한 비밀번호        저장된 인코딩된 비밀번호
			boolean math=pwEncoder.matches(member.getPw(), m.getPw()) ;//비밀번호 일치여부를 판단
			if(m!=null && math) {
				session.setAttribute("member", m);
			}else {
				
				return "redirect:/member/loginForm";
			}
			return"redirect:/main";
	}
	//마이페이지
	@RequestMapping("/member/mypage")
	public void myPageGET(HttpSession session,RedirectAttributes rttr,Model model) throws Exception{
		
	}
	
	
	//포인트충전페이지
	@GetMapping("/pointCharge")
	public void pointChargeGET(Member member,HttpSession session,RedirectAttributes rttr,Model model)throws Exception {
		
	}
	
	//포인트 충전
	@RequestMapping(value="/member/pointCharging",method=RequestMethod.POST)
	public String pointChargingPOST(String point,RedirectAttributes rttr,Member member,HttpSession session,Model model)throws Exception {

		Member m=service.readMember(member.getId());
		member.setPoint(m.getPw());
		service.chargePoint(member);
		session.setAttribute("member", m);
		rttr.addFlashAttribute("result","charge");
		return "redirect:/main";
	}
	
	//포인트환불페이지
	@GetMapping("/pointRefund")
	public void pointRefundGET(HttpSession session,Model model,RedirectAttributes rttr)throws Exception {
	
		
	}
	
	//포인트환불
	@RequestMapping(value="/member/pointRefund",method=RequestMethod.POST)
	public String pointRefundPOST(HttpSession session,RedirectAttributes rttr,Member member)throws Exception {
		String id=(String)session.getAttribute("id");
		Member m=service.readMember(id);
		     m.setPoint(null);
			service.chargePoint(m);
			rttr.addFlashAttribute("result","refund");
			return "/main";		
	}
	
	//개인정보수정페이지
	@GetMapping("/memberInfo")
	public void memberInfoGET(HttpSession session,RedirectAttributes rttr,Model model)throws Exception {
	
		
	}
	
	//개인정보수정
	@PostMapping("/member/memberInfo")
	public String memberInfoPOST(RedirectAttributes rttr,String pw,String email, String phone,Member member,HttpSession session) throws Exception{
	
		Member m=service.memberLogin(member);
		
			m.setEmail(email);
			m.setPhone(phone);
			m.setId(member.getId());
			service.changeInfo(m);
			rttr.addFlashAttribute("result","info");
			return "/member/mypage";
		
		
	}
	@RequestMapping("/changePw")
	public void changePwGET() {}
	
	
	//비밀번호 변경
	@RequestMapping(value="/member/changePw",method=RequestMethod.POST)
	public String changePwPOST(Member member,String newPw,String pw,RedirectAttributes rttr)throws Exception{
		Member m=service.memberLogin(member);
		newPw=member.getPw(); //입력한 비밀번호
		String encodePw=m.getPw(); //저장된 인코딩된 비밀번호
		
		if(true==pwEncoder.matches(newPw, encodePw)) {//비밀번호 일치여부를 판단
			
			m.setPw(newPw);
			
		encodePw=pwEncoder.encode(member.getPw());//비밀번호 인코딩
			  
			  m.setPw(encodePw);//인코딩한 비밀번호를 다시 비밀번호로 설정
			  
			  service.updatePw(m);
			  
			  rttr.addFlashAttribute("result","change");
				return"redirect:/member/mypage";
		}else {
			rttr.addFlashAttribute("result","fail");
			return"redirect:/member/changePw";
		}
		
	}
	
	//내신점수 조회페이지
	@GetMapping("/member/myScoreCheck")
	public void myScoreCheckGET(HttpSession session,Model model)throws Exception{
		
	}
	
	
	//내신점수 입력페이지
	@GetMapping("/inputMyScore")
	public void inputGradeGET()throws Exception{
		
	}
	
	//내신점수 입력
	@RequestMapping(value="/member/inputMyScore",method=RequestMethod.POST)
	public String inputGradePOST(Member member,String grade,RedirectAttributes rttr,HttpSession session) throws Exception{
		String id=(String)session.getAttribute("id");
		Member m=service.readMember(id);
		m.setGrade(grade);
		service.inputScore(m);
		rttr.addFlashAttribute("result", "grade");
		return"redirect:/member/mypage";
	}
	//포인트 조회 페이지
	@GetMapping("checkMyPoint")
	public void checkMyPoint(HttpSession session,Model model) throws Exception{
	
	}
	//원서접수 페이지
	@GetMapping("/applyForm")
	public void applyFormGET(HttpSession session,Model model)throws Exception{
		
	}
	//원서접수
	@RequestMapping(value="/member/applyForm",method=RequestMethod.POST)
	public String applyFormPOST(RedirectAttributes rttr,UniVo uv,DpmVo dv,Model model,Member member,String schoolName,String department)throws Exception{
		
		schoolName=uv.getSchoolName();
		department=dv.getDepartment();
		model.addAttribute("uv",uv);
		model.addAttribute("dv",dv);
		rttr.addFlashAttribute("result", "apply");
		return"redirect:/main";
	}
	
	//원서조회
	@RequestMapping("/applyList")
	public void applyListPOST(HashMap<Integer,String> map,Model model)throws Exception{
		
	}
	
	//로그아웃(
	@RequestMapping("/member/logout")
	public void logoutGET(HttpSession session, HttpServletResponse response)throws Exception{	
		session.invalidate(); //session제거
		service.logout(response);
	}
	@GetMapping("/member/dropMember")
	public String dropmemberGET(HttpSession session) throws Exception{
		
		return"/member/dropMember";
	}
	
	//회원탈퇴
	@RequestMapping(value="/member/dropMember",method=RequestMethod.POST)
	public String dropmemberPOST(Member mm,RedirectAttributes rttr,HttpSession session)throws Exception {
		Member m=(Member)session.getAttribute("member");
		String sessionPass=m.getPw();
		String voPass=mm.getPw();
		
		if(!pwEncoder.matches(sessionPass,voPass)) {
			rttr.addFlashAttribute("result", "drop");
			return"redirect:/main";
		}
		
			service.dropMember(mm);
			session.invalidate();
		
	
		return"redirect:/member/mypage";
				}
	
	
	
}
