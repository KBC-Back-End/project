package spring.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mapper.BoardMapper;
import spring.service.BoardService;
import spring.vo.BoardVo;
import spring.vo.Criteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Override
	public void enroll(BoardVo board) {//글등록
		mapper.enroll(board);
	}

	@Override
	public int getTotal(Criteria cri){//글 목록 총갯수
		return mapper.getTotal(cri);
	}
	
	@Override
	public BoardVo getPage(int bno) {//글상세보기
		return mapper.getPage(bno);
	}
	
	@Override
	public int reWrite(BoardVo board) {//글 수정
		return mapper.reWrite(board);
	}
	
	@Override
	public int remove(int bno) {//글 삭제
		return mapper.remove(bno);
	}
	@Override
	public List<BoardVo> getListPaging(Criteria cri){//글 목록 +페이징
		return mapper.getListPaging(cri);
	}
}
