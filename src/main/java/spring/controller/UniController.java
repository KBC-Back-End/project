package spring.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.service.Uservice;
import spring.vo.Criteria;
import spring.vo.Page;

@Controller
@RequestMapping("/uni/*")
public class UniController {

	private static final Logger log =LoggerFactory.getLogger(UniController.class);
	
	@Autowired
	private Uservice service;
	
	@GetMapping(value="/uni/uniNameList")
	public void uniNameListGET() {//대학이름검색페이지
		
	}
	
	// 페이징  + 대학이름검색
	@RequestMapping(value="/uni/uniNameList", method=RequestMethod.POST)
	public void uniNameListPOST(Model model, Criteria cri) throws Exception   {

	log.info("uniNameListPOST");
	log.info("cri:"+cri);
	model.addAttribute("list",service.getUniNameList(cri));
	
	int total=service.getCount(cri);
	Page page=new Page(cri,total);
	model.addAttribute("page",page);
	
	}
	
	@GetMapping(value="/uni/uniRegionList")
	public void uniRegionListGET() {//지역별 검색 페이지
		
	}
	// 페이징  + 지역별검색
		@RequestMapping(value="/uni/uniRegionList",method=RequestMethod.POST)
		public void uniRegionListPOST(Model model, Criteria cri) throws Exception   {

		log.info("uniRegionListPOST");
		log.info("cri:"+cri);
		model.addAttribute("list",service.getUniRegionList(cri));
		
		int total=service.getRegionCount(cri);
		Page page=new Page(cri,total);
		model.addAttribute("page",page);
		
		 
		}

}
