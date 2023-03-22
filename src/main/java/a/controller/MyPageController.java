package a.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import a.aop.AopSkip;
import a.dto.FreeCommentVO;
import a.dto.FreePostDto;
import a.dto.MemberDto;
import a.dto.PetDto;
import a.service.MyPageService;
import a.util.BbsUtil;
import a.util.PdsUtil;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageService service;
	
	// 세션 만료 시 message.jsp로 이동
	@AopSkip
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
	public String updateAf(Model model, MemberDto dto, 
							@RequestParam(value = "newMemImg", required = false)
							MultipartFile newMemImg,
							HttpServletRequest req) {
		if (!newMemImg.isEmpty()) { // 업로드한 파일이 존재
			// filename 취득 : 원본 파일명
			String filename = newMemImg.getOriginalFilename();
			String newfilename = BbsUtil.getNewFileName(filename);
			
			// upload의 경로 설정(2가지 : server / folder)
			// folder
			// String filepath = "c:\\memberImgs";	// 일단 절대경로로 설정했습니다. tiles 배치 후 상대경로 시도해보죠.
			
			// 여기에 저장된 filepath는 저장이 된후 찾아가기 위한 DB의 경로입니다!!! 헷갈리시면 안됩니다.
			String filepath = req.getContextPath() + "/resources/memberImg/";
			dto.setImg_path(filepath + newfilename);	// 여기서, 우리는 컬럼이 하나로 시작해서.. 무조건 경로와 파일명을 모두 가지고 있어야합니다.
			// memDto에 저장해놓았으니 밑에서 재할당해도 문제 X
			
			// 여기에 저장된 filepath는 당장 컨트롤러에서 파일을 생성하기위한 경로입니다!!!
			filepath = "C:\\Users\\ahgus\\Desktop\\multiCampus\\SemiProject\\semiProj\\src\\main\\webapp\\resources\\memberImg\\";
			
			File file = new File(filepath + newfilename);
			System.out.println("다음의 경로에 유저 프로필 이미지 업로드 : " + filepath + newfilename);
			
			try {
				// 실제로 파일 생성 + 기입 = 업로드 (newFileName으로 변형되어 저장)
				FileUtils.writeByteArrayToFile(file, newMemImg.getBytes());	
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
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
		model.addAttribute("sortOption", sortOption);
		
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
		model.addAttribute("sortOption", sortOption);
		
		return "commentmanage";
	}
	
	// 회원탈퇴 페이지로 이동
	@GetMapping("delMember.do")
	public String delMember() {
		return "deletemember";
	}
	
	// 회원 탈퇴 - DB 접근하여 delete 후 message로 이동
	// TODO : 수정 필요
	@GetMapping("delMemberAf.do")
	public String delMemberAf(Model model, MemberDto dto) {
		boolean isS = service.delMember(dto);
		String delMemMsg = "";
		
		if (isS) {
			delMemMsg = "DELETE_SUCCESS";
		} else {
			delMemMsg = "DELETE_FAIL";
		}
		
		model.addAttribute("delMemMsg", delMemMsg);
		
		return "message";
	}
	
}
