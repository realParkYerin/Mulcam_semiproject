package a.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import a.dto.FreeCommentVO;
import a.dto.FreePostDto;
import a.dto.MemberDto;
import a.dto.PetDto;
import a.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageService service;
	
	// 로그인 시 세션 설정 및 메인 이동
//	@PostMapping("loginAf.do")
//	public String loginAf(HttpServletRequest req, MemberDto dto) {
//		MemberDto mem = service.login(dto);

//		if (mem != null) {
//			req.getSession().setAttribute("login", mem); // session에 로그인 정보 저장
//			req.getSession().setMaxInactiveInterval(60 * 60 * 2);
//			return "main";
//		} else {
//			return "";
//		}
//	}
	
	// 세션 만료 시 message.jsp로 이동
	@GetMapping("sessionOut.do")
	public String sessionOut(Model model) {
		String sessionOut = "logout";
		model.addAttribute("sessionOut", sessionOut);
		
		return "message";
	}
	
	// 마이 페이지 입장 시 세션 검사
	@GetMapping("memberUpdate.do")
	public String memberUpdate(HttpServletRequest req, Model model) {
		if (req.getSession().getAttribute("login") != null) {
			return "memberUpdate";
		} else { // 세션 만료됨
			model.addAttribute("sessionOut" , "logout");
			return "message";
		}
	}
	
	// 회원 정보 수정 시 비밀번호 재확인
	@ResponseBody
	@PostMapping("pwdcheck.do")
	public String pwdCheck(HttpServletRequest req, String pwd) {
		MemberDto dto = (MemberDto) req.getSession().getAttribute("login");
		String pwdFromDb = service.pwdCheck(dto.getUser_id());
		
		if (pwd.equals(pwdFromDb) || pwd == pwdFromDb)
			return "YES";
		else
			return "NO";
	}
	
	// 회원 정보 수정 진행 중 닉네임 변경 시 중복 확인
	@ResponseBody
	@PostMapping("nickcheck.do")
	public String nickCheck(String nickname) {
		int n = service.nickCheck(nickname);
		
		if (n > 0)
			return "NO";
		else
			return "YES";
	}
	
	// 정보 수정 완료 후 message.jsp로 이동
	@PostMapping("memberUpdateAf.do")
	public String updateAf(Model model, MemberDto dto) {
		boolean isS = service.updateMember(dto);
		String message = "";
		
		if (isS) {
			message = "UPDATE_SUCCESS";
		} else {
			message = "UPDATE_FAIL";
		}
		model.addAttribute("updateMsg", message);
		
		return "message";
	}
	
	// 내 반려동물 관리 페이지로 이동
	@GetMapping("petUpdate.do")
	public String petUpdate() {
		return "petUpdate";
	}
	
	// 반려동물 수정 완료 후 message로 이동
	@PostMapping("petUpdateAf.do")
	public String petUpdateAf(PetDto pet, HttpServletRequest req, Model model) {
		System.out.println(pet.toString());
		MemberDto dto = (MemberDto) req.getSession().getAttribute("login");
		boolean isS = false;
		
		// 기존 등록된 반려동물이 있으면 update, 없으면 insert		
		if (service.getMyPet(dto) == null) {
			isS = service.insertPet(pet);
		} else {
			isS = service.updatePet(pet);
		}

		String message = "";
		if (isS) {
			message = "UPDATE_PET_SUCCESS";
		} else {
			message = "UPDATE_PET_FAIL";
		}
		
		model.addAttribute("petUpdateMsg", message);
		
		return "message";
	}
	
	// 내 글 관리 페이지로 이동
	@GetMapping("postManage.do")
	public String postManage() {
		return "postmanage";
	}
	
	// 내 글 목록 정렬하여 데이터 재 전송
	@GetMapping("sortPost.do")
	public String sortPost(String sortOption, Model model, HttpServletRequest req) {
		if (sortOption.equals("new")) {
			sortOption = "bbs_seq";
		} else if (sortOption.equals("old")) {
			sortOption = "bbs_seq desc";
		} else if (sortOption.equals("comment")) {
			sortOption = "cmtcount desc";
		} else if (sortOption.equals("like")) {
			sortOption = "likecount desc";
		}
		
		MemberDto memDto = (MemberDto) req.getSession().getAttribute("login");
		
		HashMap<String, String> paramMap = new HashMap<>();
		paramMap.put("option", sortOption);
		paramMap.put("user_id", memDto.getUser_id());
		
		List<FreePostDto> sortPostList = service.getSortPost(paramMap);
		
		model.addAttribute("sortPost", sortPostList);
		
		return "postmanage";
	}
	
	// 내 댓글 관리 페이지로 이동
	@GetMapping("commentManage.do")
	public String commentmanage() {
		return "commentmanage";
	}
	
	// 댓글 목록 정렬 후 재 전송
	@GetMapping("sortComment.do")
	public String sortComment(String sortOption, Model model, HttpServletRequest req) {
		if (sortOption.equals("new")) {
			sortOption = "comment_seq";
		} else if (sortOption.equals("old")) {
			sortOption = "comment_seq desc";
		}
		
		MemberDto memDto = (MemberDto) req.getSession().getAttribute("login");
		
		HashMap<String, String> paramMap = new HashMap<>();
		paramMap.put("option", sortOption);
		paramMap.put("user_id", memDto.getUser_id());
		
		List<FreeCommentVO> sortCmtList = service.getSortCmt(paramMap);
		
		model.addAttribute("sortComment", sortCmtList);
		
		return "commentmanage";
	}
	
	// 회원탈퇴 페이지로 이동
	@GetMapping("delMember.do")
	public String delMember() {
		return "deletemember";
	}
	
	@GetMapping("delMemberAf.do")
	public String delMemberAf(Model model, HttpServletRequest req) {
		MemberDto memDto = (MemberDto) req.getSession().getAttribute("login");
		boolean isS = service.delMember(memDto);
		String delMemMsg = "";
		
		if (isS) {
			delMemMsg = "DELETE_SUCCESS";
		} else {
			delMemMsg = "DELETE_FAIL";
		}
		
		model.addAttribute("delMemMsg", delMemMsg);
		
		return "message";
	}
	
	@GetMapping("apitest.do")
	public String apiTest() {
		return "apiTest";
	}
	
}
