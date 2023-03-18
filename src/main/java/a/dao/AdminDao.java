package a.dao;

import java.sql.Connection;
import java.util.List;

import org.springframework.jdbc.CannotGetJdbcConnectionException;

import a.dto.BbsParam;
import a.dto.FreeCommentVO;
import a.dto.FreePostDto;
import a.dto.MemberDto;
import com.github.pagehelper.PageInfo;

public interface AdminDao {

	//회원 목록
	List<MemberDto> memberList();
	PageInfo <MemberDto> searchByMemberList(String keyword, String choice);
	
	//회원 정보 상세보기
	MemberDto viewMember(String user_id);
	
	//게시글 목록 조회
	List<FreePostDto> bbsList();	
	PageInfo <FreePostDto> searchByFreePostList(String keyword, String choice);
	
	//게시글 bbs_seq가져오기
	//freepostList(자유게시판 관리 페이지)에서 title클릭 시 해당하는 게시물을 bbs_seq로 받아오기 위함
	FreePostDto getBbs(int bbs_seq);
	
	//자유게시판 댓글 목록
	List<FreeCommentVO> getComment();
	PageInfo<FreeCommentVO> searchByFreeCommentList(String keyword, String choice);

	
}