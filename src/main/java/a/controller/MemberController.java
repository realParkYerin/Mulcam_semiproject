package a.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import a.service.MemberService;
import a.util.PdsUtil;
import a.dto.MemberDto;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memService;
	
	// 로그인 화면 이동(임시)
	@GetMapping(value = "login.do")
	public String login() {
		return "login";
	}
	
	// 회원가입 화면 이동
	@GetMapping(value = "register.do")
	public String register() {
		return "register";
	}
	
	// 아이디 중복확인
	@ResponseBody
	@PostMapping(value = "idcheck.do")
	public String idcheck(String user_id) {
		
		boolean isS = memService.idCheck(user_id);
		if(isS) {
			return "NO";
		}else {
			return"YES";
		}
	}
	
	// 닉네임 중복확인
	@ResponseBody
	@PostMapping(value = "nicknamecheck.do")
	public String nicknamecheck(String nickname) {
		
		boolean isS = memService.nicknameCheck(nickname);
		if(isS ) {
			return "NO";
		}else {
			return"YES";
		}
	}
	
	// 회원가입 처리 
	@PostMapping(value = "registerAf.do")
	public String registerAf(MemberDto memDto,							 
							@RequestParam(value = "memberImg", required = false)
							MultipartFile memberImg,
							HttpServletRequest req,
							Model model) {
		System.out.println("MemberController registerAf " + new Date());
		
		// filename 취득 : 원본 파일명
		String filename = memberImg.getOriginalFilename();
		
		// upload의 경로 설정(2가지 : server / folder)
		// server
		String filepath = req.getServletContext().getRealPath("/memberImgs");
		
		// 파일명을 충돌되지 않는 명칭(Date)으로 변경
		String newfilename = PdsUtil.getNewFileName(filename);
		
		// 변경된 파일명
		memDto.setImg_path(newfilename);
		
		File file = new File(filepath + "/" + newfilename);
		
		try {
			// 실제로 파일 생성 + 기입 = 업로드
			FileUtils.writeByteArrayToFile(file, memberImg.getBytes());
			
			boolean isS = memService.addMember(memDto);
			String msg = "";
			if(isS == true) {
				msg = "MEMBER_ADD_YES";
			}else {
				msg = "MEMBER_ADD_NO";
			}
			model.addAttribute("register", msg);	
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "message";
					
	}
	
	
	
}
