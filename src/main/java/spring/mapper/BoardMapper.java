package spring.mapper;

import java.util.List;

import spring.vo.BoardVo;
import spring.vo.Criteria;

public interface BoardMapper {

	  public void enroll(BoardVo board);//글 등록
	  public int getTotal(Criteria cri); //글 총 갯수
	  public BoardVo getPage(int bno);//글 상세보기
	  public int reWrite(BoardVo board);//글 수정
	  public int remove(int bno);//글 삭제
	  public List<BoardVo> getListPaging(Criteria cri);//글 목록 +페이징
	
	
}
