package a.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import a.dto.FreeCommentVO;
import a.dto.FreePostDto;
import a.dto.MemberDto;
import a.dto.PetDto;

public interface MemberService {
	
	boolean idCheck(String user_id);
	
	boolean nicknameCheck(String nickname);
	
	boolean addMember(MemberDto memDto);
	
	MemberDto login(MemberDto memDto);
	
	List<FreePostDto> getAllPost(MemberDto dto);
	
	PetDto getMyPet(MemberDto dto);
	
	List<FreeCommentVO> getAllComment(MemberDto dto);
	
	void logout(HttpSession session);
	
}
