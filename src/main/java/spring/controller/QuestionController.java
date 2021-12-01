package spring.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.service.Qservice;
import spring.vo.Criteria;
import spring.vo.Member;
import spring.vo.Page;
import spring.vo.Question;

@Controller
@RequestMapping("/question/*")
public class QuestionController {

	private static final Logger log = LoggerFactory.getLogger(QuestionController.class);
	
	@Autowired
	private Qservice service;
	
	@GetMapping("/questionList")
	public void questionListGET(Model model,Criteria cri) {//글목록  + 페이징
		model.addAttribute("list",service.getListPaging(cri));
		int total=service.getTotal(cri);
		Page page=new Page(cri,total);
		model.addAttribute("page",page);
		
	}
	
	@GetMapping("/qnaWrite")//문의글 작성 페이지 
	public void writeQnAGET(Model model, Member member) {
		
		model.addAttribute("member",member);
	}
	
	@RequestMapping(value="/question/qnaWrite" ,method=RequestMethod.POST)//게시글 작성
	public String writeQnAPOST(Question q,RedirectAttributes rttr) {
		service.enroll(q);
		rttr.addFlashAttribute("result","enroll");
		return "redirect:/question/questionList";
	}
	
	@GetMapping("/qnaView")
	public void qnaReadGET(int qnum, Model model ,Criteria cri) {//글 상세 보기
		model.addAttribute("info",service.getPage(qnum));
		model.addAttribute("cri",cri);
	}
	
	@RequestMapping(value="/remove" ,method=RequestMethod.POST)
	public String questionRemovePOST(int qnum,RedirectAttributes rttr) {//문의글 삭제
		service.remove(qnum);
		rttr.addFlashAttribute("result", "remove");
		return"redirect:/question/questionList";
	}
	
}
