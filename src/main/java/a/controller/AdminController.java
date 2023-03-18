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

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import a.dto.BbsParam;
import a.dto.Choice;
import a.dto.FreeCommentVO;
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
	@RequestMapping(value = "admin/memberlist.do", method = RequestMethod.GET)
	public String memberList(Model model, @RequestParam(defaultValue = "1") int page,
	        @RequestParam(defaultValue = "user_id") String choice, @RequestParam(defaultValue = "") String search) {
	        System.out.println("AdminController memberList " + new Date());
	        //logger.info("MemberController memberList....");
			choice = validation(choice);

			PageHelper.startPage(page, 10);
	        PageInfo<MemberDto> memberDtoPageInfo = service.searchByMemberList(search, choice);
	        model.addAttribute("dto", memberDtoPageInfo);
	        model.addAttribute("choice", choice);
	        model.addAttribute("search", search);
	        System.out.println("AdminController memberDtoPageInfo = " + memberDtoPageInfo);
        return "admin/memberlist";
    }

	private static String validation(String choice) {
		try {
			Choice.valueOf(choice);
		} catch (Exception e) {
			choice = "user_id";
		}
		return choice;
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
	@GetMapping(value="admin/freepostList.do")
	public String freepostList(Model model, @RequestParam(defaultValue ="1")int page, 
			@RequestParam(defaultValue = "user_id")String choice, @RequestParam(defaultValue = "") String search) {
		System.out.println("AdminController freepostList" + new Date());
		
		choice = validation(choice);
		
		PageHelper.startPage(page,10);
		PageInfo<FreePostDto> freepostDtoPageInfo = service.searchByFreePostList(search, choice);
		
		model.addAttribute("dto", freepostDtoPageInfo);
		model.addAttribute("choice", choice);
		model.addAttribute("search", search);
		System.out.println("AdminController freepostDtoPageInfo=" + freepostDtoPageInfo);
		
		return "admin/freepostList";
	}

	//자유게시판 댓글 목록 - 검색, 페이징
	@GetMapping(value="admin/commentList.do")
	public String commentList(Model model, @RequestParam(defaultValue ="1")int page, 
			@RequestParam(defaultValue = "user_id")String choice, @RequestParam(defaultValue = "") String search) {
		System.out.println("AdminController commentList" + new Date());
		
		choice = validation(choice);
		
		PageHelper.startPage(page,10);
		PageInfo<FreeCommentVO> freecommentVOPageInfo = service.searchByFreeCommentList(search, choice);
		
		model.addAttribute("dto", freecommentVOPageInfo);
		model.addAttribute("choice", choice);
		model.addAttribute("search", search);
		System.out.println("AdmiinController freecommentVOPageInfo=" + freecommentVOPageInfo);
		
		return "admin/commentList";
	}
}
