package a.service;

import java.util.HashMap;
import java.util.List;

import a.dto.FreeCommentVO;
import a.dto.FreePostDto;
import a.dto.MemberDto;
import a.dto.PetDto;

public interface MyPageService {
	
	MemberDto login(MemberDto dto);
	
	String pwdCheck(String user_id);
	
	int nickCheck(String nickname);
	
	boolean updateMember(MemberDto dto);
	
	boolean insertPet(PetDto pet);
	
	boolean updatePet(PetDto pet);
	
	PetDto getMyPet(MemberDto dto);
	
	List<FreePostDto> getSortPost(HashMap<String, String> paramMap);
	
	List<FreeCommentVO> getSortCmt(HashMap<String, String> paramMap);
	
	boolean delMember(MemberDto dto);

}
