package spring.mapper;

import java.util.List;

import spring.vo.Criteria;
import spring.vo.UniVo;


public interface UniMapper {
	
public int getCount(Criteria cri);	//검색리스트 조회(학교명)
public int getRegionCount(Criteria cri);//검색리스트 조회(지역별)
public List<UniVo> getUniNameList(Criteria cri); //대학이름검색+페이징
public List<UniVo> getUniRegionList(Criteria cri); //지역별검색+페이징
}
