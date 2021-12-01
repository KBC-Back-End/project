package spring.mapper;

import java.util.List;

import spring.vo.Criteria;
import spring.vo.DpmVo;

public interface DpmMapper {

	public int getCount(Criteria cri);	//검색리스트 조회(학과)
	public int getLdpmtCount(Criteria cri);	//검색리스트 조회(계열)
	public List<DpmVo> getDpmNameList(Criteria cri);//학과명으로 검색+페이징
	public List<DpmVo> getLdpmList(Criteria cri);//계열명으로 검색+페이징
	
}
