package spring.serviceimpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mapper.UniMapper;
import spring.service.Uservice;
import spring.vo.Criteria;
import spring.vo.UniVo;
@Service   //구현된 service
public class UserviceImpl implements Uservice {

	
	@Autowired
	private UniMapper mapper;

	//글 총 갯수 
	@Override
	public int  getCount(Criteria cri) throws Exception {
	return mapper.getCount(cri);
	}
	
	//글 총 갯수 
	@Override
	public int getRegionCount(Criteria cri)throws Exception{
		return mapper.getRegionCount(cri);
	}

	//대학 이름 검색+페이징
	@Override
	public List<UniVo> getUniNameList(Criteria cri)throws Exception{
	return mapper.getUniNameList(cri);
		}
	
	//지역별 검색+페이징
	@Override
		public List<UniVo> getUniRegionList(Criteria cri)throws Exception{
		return mapper.getUniRegionList(cri);
	}

}
