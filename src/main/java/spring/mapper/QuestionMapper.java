package spring.mapper;

import java.util.List;

import spring.vo.Criteria;
import spring.vo.Question;

public interface QuestionMapper {

	public void enroll(Question q);//문의글 등록
	public int getTotal(Criteria cri);//총 갯수
	public Question getPage(int qnum);//문의글 상세 조회
	public List<Question>getListPaging(Criteria cri);//글목록+ 페이징
	public int remove(int qnum);//문의글 삭제
}
