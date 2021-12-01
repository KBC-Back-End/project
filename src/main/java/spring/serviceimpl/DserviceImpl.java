package spring.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mapper.DpmMapper;
import spring.service.Dservice;
import spring.vo.Criteria;
import spring.vo.DpmVo;

@Service 
public class DserviceImpl implements Dservice {

	@Autowired
	private DpmMapper mapper;
	
	    //글 총 갯수 (학과)
		@Override
		public int  getCount(Criteria cri) throws Exception {
		return mapper.getCount(cri);
		}
		
		//글 총 갯수 (계열)
		@Override
		public int getLdpmtCount(Criteria cri)throws Exception{
			return mapper.getLdpmtCount(cri);
		}
	
		//학과명 검색+페이징
		@Override
		public List<DpmVo> getDpmNameList(Criteria cri)throws Exception{
			return mapper.getDpmNameList(cri);
		}
		
		//계열명 검색+페이징
		@Override
		public List<DpmVo> getLdpmList(Criteria cri)throws Exception{
			return mapper.getLdpmList(cri);
		}
		
}
