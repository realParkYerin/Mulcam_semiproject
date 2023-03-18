package a.service;

import java.util.List;
import javax.servlet.http.HttpSession;

import a.dto.BbsParam;
import a.dto.FreeCommentVO;
import a.dto.FreePostDto;
import a.dto.MemberDto;
import com.github.pagehelper.PageInfo;

public interface AdminService {
	
	//로그인한 회원이 관리자인지 확인 -> 추후 수정
	
	//회원 목록 조회
	List<MemberDto> memberList();
	PageInfo<MemberDto> searchByMemberList(String keyword, String choice);
	
	//아이디 클릭 시 회원 정보 상세보기
	MemberDto viewMember(String user_id);
	
	//게시글 목록 조회
	List<FreePostDto> bbsList();
	//	int getAllBbs(BbsParam bbs);
	
	//자유게시판 게시글 목록 - 검색
	PageInfo<FreePostDto> searchByFreePostList(String keyword, String choice);
	
	//게시글 bbs_seq가져오기
	FreePostDto getBbs(int bbs_seq);
	
	//자유게시판 댓글 목록
	List<FreeCommentVO> getComment();
	PageInfo<FreeCommentVO> searchByFreeCommentList(String keyword, String choice);
}

