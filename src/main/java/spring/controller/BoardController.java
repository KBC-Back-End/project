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

import spring.service.BoardService;
import spring.vo.BoardVo;
import spring.vo.Criteria;
import spring.vo.Member;
import spring.vo.Page;


@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService service;
	
	
	@GetMapping("/board/boardList")
	public void boardListGET(Model model, Criteria cri) {//목록 페이지 +페이징
		
		model.addAttribute("list",service.getListPaging(cri));
		int total=service.getTotal(cri);
		Page page=new Page(cri ,total);
		model.addAttribute("page", page);
	}
	
	@GetMapping("/writeView")
	public void writeViewGET(Member member,Model model) {//게시글 작성 페이지 진입
		model.addAttribute("member",member);
	}
	
	@RequestMapping(value="/board/writeView" ,method=RequestMethod.POST)//게시글 작성
	public String boardWritePOST(BoardVo board,RedirectAttributes rttr,Model model) {
		
		service.enroll(board);
		rttr.addFlashAttribute("result","enroll");
		return "redirect:/board/boardList";
	}
	
	@GetMapping("/readView")
	public void boardReadViewGET(int bno, Model model,Criteria cri) {//글 상세보기
		model.addAttribute("read",service.getPage(bno));
		model.addAttribute("cri", cri);
	}
	
	@GetMapping("/board/reWrite")
	public void boardReWriteGET(int bno, Model model,Criteria cri) {//글 수정 페이지
		
		model.addAttribute("info",service.getPage(bno));
		model.addAttribute("cri", cri);
	}
	
	@RequestMapping(value="/board/reWrite" ,method=RequestMethod.POST)// 글 수정 
	public String boardReWritePOST(BoardVo board, RedirectAttributes rttr) {
		service.reWrite(board);
		rttr.addFlashAttribute("result", "reWrite");
		return "redirect:/board/boardList";
	}
	
	@RequestMapping(value="/remove" ,method=RequestMethod.POST)
	public String boardRemovePOST(int bno , RedirectAttributes rttr) {//글 삭제
		service.remove(bno);
		rttr.addFlashAttribute("result", "remove");
		return "redirect:/board/boardList";
	}
	
	
}
