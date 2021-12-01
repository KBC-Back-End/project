package spring.mapper;

import spring.vo.Member;

public interface MemberMapper {
	
	public void memberRegister(Member member);//회원가입
	public int idCheck(String id); //아이디 중복 체크
	public int emailCheck(String email);//이메일 중복체크
	public Member memberLogin(Member member);//로그인
	public String findId(String email);//아이디 찾기
	public void updatePw(Member member);//비밀번호찾기
	public Member readMember(String id);
	public String findEmail(String email);//메일로 검색(비밀번호찾기위함)
	public int chargePoint(Member member);//포인트 충전
	public void changeInfo(Member member);//개인정보 수정
	public void inputScore(Member member);//내신점수 입력
	public void dropMember(Member member);//회원탈퇴
}
