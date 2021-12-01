package spring.serviceimpl;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mapper.MemberMapper;
import spring.service.Mservice;
import spring.vo.Member;
@Service
public class MserviceImpl implements Mservice {

	@Autowired
	private MemberMapper mapper;
	
	
	
	//회원가입
	@Override
	public void memberRegister(Member member)throws Exception{
		mapper.memberRegister(member);
	}
	
	//아이디 중복 체크
    @Override
	public int idCheck(String id)throws Exception{
    	return mapper.idCheck(id);
    }
    
   //이메일 중복 체크
    @Override
    public int emailCheck(String email)throws Exception{
    	return mapper.emailCheck(email);
    }
    
    
    //로그인
	@Override
	public Member memberLogin(Member member)throws Exception{
		return mapper.memberLogin(member);
	}
	
	//아이디찾기
	@Override
	public String findId(String email)throws Exception{
		return mapper.findId(email);
     }
	
	// 비밀번호 찾기
	@Override
	public void updatePw(Member member)throws Exception{
	 mapper.updatePw(member);
	}
	@Override
	public Member readMember(String id)throws Exception{
		return mapper.readMember(id);
	}
	
	
	//메일로 검색(비밀번호찾기위함)
	@Override
	public String findEmail(String email)throws Exception{
		return mapper.findEmail(email);
	}
	//포인트
	@Override
	public int chargePoint(Member member)throws Exception{
		return mapper.chargePoint(member);
	}
	
	//개인정보
	@Override
	public void changeInfo(Member member)throws Exception{
		mapper.changeInfo(member);
	}
	
	 @Override
	 public void inputScore(Member member)throws Exception{
		 mapper.inputScore(member);
	 }
	
	 //로그아웃
     @Override
	public void logout(HttpServletResponse response) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("location.href=document.referrer;");
			out.println("</script>");
			out.close();
		}
	//회원탈퇴
     @Override
     public void dropMember(Member member)throws Exception{
    	 mapper.dropMember(member);
     }
     
}
