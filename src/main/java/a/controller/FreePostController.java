package a.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import a.dto.FreePostDto;
import a.service.impl.FreePostServiceImpl;
import a.dto.BbsParam;

@Controller
public class FreePostController {
	static int POST_PER_PAGE = 10;
	@Autowired
	FreePostServiceImpl freePostService;
	
    // 자유게시판 목록 페이지
	@GetMapping(value = "bbslist.do")
	public String bbslist(BbsParam param, Model model) {
		
		// 글의 시작과 끝
		int pn = param.getPageNumber();  // 0 1 2 3 4
		int start = 1 + (pn * 10);	// 1  11
		int end = (pn + 1) * 10;	// 10 20 
		
		param.setStart(start);
		param.setEnd(end);
		
		List<FreePostDto> list = freePostService.bbslist(param);
		int len = freePostService.getAllBbs(param);
		
		int pageBbs = len / 10;		// 25 / 10 -> 2
		if((len % 10) > 0) {
			pageBbs = pageBbs + 1;
		}
		
		model.addAttribute("bbslist", list);	// 게시판 리스트
		model.addAttribute("pageBbs", pageBbs);	// 총 페이지수
		model.addAttribute("pageNumber", param.getPageNumber()); // 현재 페이지
		model.addAttribute("choice", param.getChoice());	// 검색 카테고리
		model.addAttribute("search", param.getSearch());	// 검색어	
		
		return "bbslist";
	}
    
	
	@GetMapping(value = "bbswrite.do")
	public String bbswrite() {
		return "bbswrite";
	}
	
	@PostMapping(value = "bbswriteAf.do")
	public String bbswriteAf(Model model, FreePostDto dto) {
		boolean isS = freePostService.writeBbs(dto);
		String bbswrite = "";		
		if(isS) {	// 사실상 isS로 그냥 return해서 이동하면 됩니다. OK NG 필요없음.
			bbswrite = "BBS_ADD_OK";
		}else {
			bbswrite = "BBS_ADD_NG";
		}
		model.addAttribute("bbswrite", bbswrite);
		
		// return "message";
		return "redirect:/bbslist.do";	// controller에서  controller로 이동시 == sendRedirect
		// return "forward:/bbslist.do";	// controller에서  controller로 이동시 == forward
	}
	
	@GetMapping(value = "bbsdetail.do")
	public String bbsdetail(Model model, int bbs_seq) {
		FreePostDto dto = freePostService.getBbs(bbs_seq);
		model.addAttribute("bbsdto", dto);
		
		return "bbsdetail";
	}
	

    
    
    
    
    
    

}
