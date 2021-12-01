package spring.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mapper.QuestionMapper;
import spring.service.Qservice;
import spring.vo.Criteria;
import spring.vo.Question;
@Service
public class QserviceImpl implements Qservice {

	@Autowired
	private QuestionMapper mapper;
	
	@Override
	public void enroll(Question q) {//문의글 등록
		mapper.enroll(q);
	}
	
	@Override
	public Question getPage(int qnum) {//글 상세 보기
		return mapper.getPage(qnum);
	}
	
	@Override
	public int getTotal(Criteria cri){//글 목록 총갯수
		return mapper.getTotal(cri);
	}
	
	@Override
	public List<Question> getListPaging(Criteria cri){//글목록+페이징
		return mapper.getListPaging(cri);
	}
	
	@Override
	public int remove(int qnum) {//문의글 삭제
		return mapper.remove(qnum);
	}
}
