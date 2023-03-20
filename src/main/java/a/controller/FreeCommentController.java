package a.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import a.dto.FreeCommentVO;
import a.service.impl.FreeCommentServiceImpl;

@Controller
public class FreeCommentController {

	@Autowired
	FreeCommentServiceImpl FreeCommentService;
	
	
	// 코멘트 작성시
	@PostMapping(value = "comment_insert.do")
	public String cmtinsert(FreeCommentVO dto) {
	    System.out.println(dto.toString());
	    
	    boolean isS = FreeCommentService.cmtinsert(dto);
	    if(isS) {
	        int bbs_seq = dto.getBbs_seq();
	        if (bbs_seq > 0) {
	            return "redirect:./bbsdetail.do?bbs_seq=" + bbs_seq;
	        } else {
	            return "redirect:./bbslist.do";
	        }
	    } else {
	        return "redirect:./login.do?";
	    }
	}
	
	// 코멘트 수정시
	@PostMapping(value = "comment_update.do")
	@ResponseBody
	public boolean cmtupdate(FreeCommentVO dto) {
		// System.out.println(dto.toString());
		boolean isS = FreeCommentService.cmtupdate(dto);
		
		if(isS) {
			System.out.println("댓글 수정 DB반영 완료");
		} else {
			System.out.println("댓글 수정 DB반영 실패");
		}
		
		return isS;
		

		} 
		

	@PostMapping(value = "comment_delete.do")
	public String cmtdelete(FreeCommentVO dto) {
		System.out.println(dto.toString());
		
		boolean isS = FreeCommentService.cmtdelete(dto);
		
		if(isS) {
			int bbs_seq = dto.getBbs_seq();
			System.out.println("댓글 삭제 DB반영 완료");
			return "redirect:./bbsdetail.do?bbs_seq=" + bbs_seq;
		} else {
			System.out.println("댓글 삭제 DB반영 완료");
			
			return "redirect:./login.do?";
		}
		
	}


} 
	
	

