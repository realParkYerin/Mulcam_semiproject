package a.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import a.dto.FreeCommentVO;
import a.dto.FreePostDto;
import a.dto.MemberDto;
import a.dto.PetDto;

public interface MemberDao {
	
	// 아이디 중복확인
	int idCheck(String user_id);
	
	// 닉네임 중복확인
	int nicknameCheck(String nickname);
	
	// 회원가입
	int addMember(MemberDto memDto);
	
	// 로그인
	MemberDto login(MemberDto memDto);
	
	// 펫 정보 불러오기
	PetDto getMyPet(MemberDto dto);
	
	// 내 글 정보 불러오기
	List<FreePostDto> getAllPost(MemberDto dto);
	
	// 내 댓글 정보 불러오기
	List<FreeCommentVO> getAllComment(MemberDto dto);
	
	// 로그아웃
	void logout(HttpSession session);

}
