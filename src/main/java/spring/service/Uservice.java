package spring.service;

import java.util.List;

import spring.vo.Criteria;
import spring.vo.UniVo;
public interface Uservice {

	
	public int getCount(Criteria cri) throws Exception;	//검색리스트 조회(학교명)
	public int getRegionCount(Criteria cri)throws Exception;//검색리스트 조회(지역별)
	public List<UniVo> getUniNameList(Criteria cri)throws Exception;//대학 이름 검색+페이징
	public List<UniVo> getUniRegionList(Criteria cri)throws Exception;//지역별 검색+페이징
}
