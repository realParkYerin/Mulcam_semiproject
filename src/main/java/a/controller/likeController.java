package a.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import a.dto.LikePostDto;
import a.service.impl.LikePostServiceImpl;

@Controller
public class likeController {

	@Autowired
	LikePostServiceImpl likePostService;
	
	@GetMapping(value = "likepost.do")
	@ResponseBody
	public boolean likeposting(LikePostDto dto) {
		// 로그인 세션으로 부터 넘어온 id와 게시물 seq 취득
		
		// System.out.println(dto.toString());
		boolean isS = likePostService.checkandtoggle(dto);
		
		if(isS) {
			System.out.println("toggle 성공 유저:" + dto.getUser_id() + " bbs_seq:" + dto.getBbs_seq());
		}else {
			System.out.println("toggle 실패");
		}
		
		return isS;
	}
	
	
	@RequestMapping("/checkstate.do")
	@ResponseBody
	public boolean checkfirst(LikePostDto dto) {
	    boolean isState = likePostService.findfirststate(dto);
	    
	    if(isState) {
	    	System.out.println("현재상태 좋아요 : " + isState);
	    }else {
	    	System.out.println("현재상태 좋아요 아님 : " + isState);
	    }
	    
	    return isState;
	}
	


}
