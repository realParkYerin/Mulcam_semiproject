package a.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import a.dto.BbsParam;
import a.dto.FreePostDto;
import a.dto.MemberDto;

public interface AdminService {
	
	//로그인한 회원이 관리자인지 확인 -> 추후 수정
	/* boolean isAdmin(String user_id); */
	
	//회원 목록 조회
	List<MemberDto> memberList();
	
	//아이디 클릭 시 회원 정보 상세보기
	MemberDto viewMember(String user_id);
	
	//게시글 목록 조회
	List<FreePostDto> bbsList(BbsParam bbs);
	int getAllBbs(BbsParam bbs);
	
	//게시글 bbs_seq가져오기
	FreePostDto getBbs(int bbs_seq);
	
}

