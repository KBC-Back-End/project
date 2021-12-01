package spring.service;

import javax.servlet.http.HttpServletResponse;

import spring.vo.Member;

public interface Mservice {
	
	public void memberRegister(Member member)throws Exception;//회원가입
	public int idCheck(String id)throws Exception; //아이디 중복 체크
	public int emailCheck(String email)throws Exception;//이메일 중복체크
	public Member memberLogin(Member member)throws Exception;//로그인
	public String findId(String email)throws Exception;//아이디 찾기
	public void updatePw(Member member)throws Exception;// 비밀번호 찾기 
	public Member readMember(String id)throws Exception;
	public String findEmail(String email)throws Exception;//메일로 검색(비밀번호찾기위함)
	public int chargePoint(Member member)throws Exception;//포인트 
	public void changeInfo(Member member)throws Exception;//개인정보수정
	public void inputScore(Member member)throws Exception;//내신점수입력
	public void logout(HttpServletResponse response) throws Exception;//로그아웃
	public void dropMember(Member member)throws Exception;//회원 탈퇴


	
}
