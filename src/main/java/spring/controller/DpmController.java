package spring.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.service.Dservice;
import spring.vo.Criteria;
import spring.vo.Page;


@Controller
@RequestMapping("/dpm/*")
public class DpmController {
	
   private static final Logger log =LoggerFactory.getLogger(DpmController.class);
   
	@Autowired
	private Dservice service;
	
	
	@GetMapping("/dpm/departmentNameList")
	public void departmentNameListGET() {//학과명 검색페이지
		
	}
	
	//페이징+학과명 검색
	@RequestMapping(value="/dpm/departmentNameList",method=RequestMethod.POST)
	public void departmentNameListPOST(Model model, Criteria cri)throws Exception   {
		
		log.info("departmentNameListPOST");
		log.info("cri:"+cri);
		model.addAttribute("list",service.getDpmNameList(cri));
		
		int total=service.getCount(cri);
		Page page=new Page(cri,total);
		model.addAttribute("page",page);
	}
	
	
	@GetMapping("/dpm/ldpmSelectList")
	public void getLdpmListGET() {//계열별 검색 페이지
		
	}
	
	//페이징+계열별 검색
	 @RequestMapping(value="/dpm/ldpmSelectList",method=RequestMethod.POST)
		public void getLdpmListPOST(Model model, Criteria cri)throws Exception   {
			
			log.info("getLdpmListPOST");
			log.info("cri:"+cri);
			model.addAttribute("list",service.getLdpmList(cri));
			
			int total=service.getLdpmtCount(cri);
			Page page=new Page(cri,total);
			model.addAttribute("page",page);
		}
		
}
