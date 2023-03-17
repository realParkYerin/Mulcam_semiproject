package a.controller;

import java.lang.reflect.Member;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import a.dto.BbsParam;
import a.dto.FreePostDto;
import a.dto.MemberDto;
import a.service.AdminService;
import a.service.MemberService;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;

	//로깅
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//관리자용 페이지 입장 시 권한 검사(auth=2) -> 추후 수정 필요
	/*
	 * @GetMapping("admin/adminview.do")
	 * public String adminMain(Model model,HttpSession session) { 
	 * System.out.println("AdminController adminMain" + new Date());
	 * 
	 * MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
	 * if(loginUser==null || loginUser.getAuth() !=2) { //로그인한 회원이 없거나, 권한이 없는 경우
	 * return "redirect:/main"; //main페이지로 이동 
	 * }
	 *  return "admin/adminview"; //권한값이 2,즉 관리자라면 adminview로 이동 
	 * }
	 */

	//adminview(관리자 메인 페이지) mapping
	@GetMapping("admin/adminview.do")
	public void adminMain() {
		System.out.println("AdminController adminMain()" + new Date());
	}
	
	//회원목록 조회
	   @RequestMapping("admin/memberlist.do")
	   public String memberList(Model model) {
		   System.out.println("AdminController memberList " + new Date());
		   //logger.info("MemberController memberList....");
		   
		   List<MemberDto> list = service.memberList();
		   model.addAttribute("list",list);
		   
		   return "admin/memberlist";
	   }


	//아이디를 누르면 그 회원의 상세 정보 조회
	@RequestMapping("admin/memberview.do")
	public String memberView(String user_id, Model model) {
		System.out.println("AdminController memberView " + new Date());

		// 회원 정보 model에 저장
		model.addAttribute("dto", service.viewMember(user_id));

		// member_view.jsp로 포워드
		return "admin/memberview";
	}
	
	//게시글 목록 - 자유게시판
	@GetMapping("admin/freepostList.do")
	public String bbsList(BbsParam param, Model model) {
		System.out.println("AdminController freepostList" + new Date());
		
		//글의 시작과 끝
		int pn = param.getPageNumber();  // 0 1 2 3 4
		int start = 1 + (pn * 10);	// 1  11
		int end = (pn + 1) * 10;	// 10 20 
		
		param.setStart(start);
		param.setEnd(end);
		
		List<FreePostDto> list = service.bbsList(param);
		int len = service.getAllBbs(param);
		
		int pageBbs = len / 10;		// 25 / 10 -> 2
		if((len % 10) > 0) {
			pageBbs = pageBbs + 1;
		}
		
		if(param.getChoice()==null || param.getChoice().equals("")
				|| param.getSearch() == null || param.getSearch().equals("")) {
			param.setChoice("검색");
			param.setSearch("");
		}
		
		model.addAttribute("bbslist", list); // 게시판 리스트
		model.addAttribute("pageBbs", pageBbs);	// 총 페이지수
		model.addAttribute("pageNumber", param.getPageNumber()); // 현재 페이지
		model.addAttribute("choice", param.getChoice()); // 검색 카테고리
		model.addAttribute("search", param.getSearch()); // 검색어
		
		return "admin/freepostList";
	}
}
