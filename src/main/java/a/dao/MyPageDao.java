package a.dao;

import java.util.HashMap;
import java.util.List;

import a.dto.FreeCommentVO;
import a.dto.FreePostDto;
import a.dto.MemberDto;
import a.dto.PetDto;

public interface MyPageDao {

	MemberDto login(MemberDto dto);
	
	String pwdCheck(String user_id);
	
	int nickCheck(String nickname);
	
	int updateMember(MemberDto dto);
	
	int insertPet(PetDto pet);
	
	int updatePet(PetDto pet);
	
	PetDto getMyPet(MemberDto dto);
	
	List<FreePostDto> getSortPost(HashMap<String, String> paramMap);
	
	List<FreeCommentVO> getSortCmt(HashMap<String, String> paramMap);
	
	int delMember(MemberDto dto);

}
