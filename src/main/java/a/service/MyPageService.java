package a.service;

import java.util.List;

import a.dto.FreePostDto;
import a.dto.MemberDto;
import a.dto.PetDto;

public interface MyPageService {
	
	MemberDto login(MemberDto dto);
	String pwdCheck(String user_id);
	int nickCheck(String nickname);
	boolean updateMember(MemberDto dto);
	PetDto getMyPet(MemberDto dto);
	boolean insertPet(PetDto pet);
	boolean updatePet(PetDto pet);
	List<FreePostDto> getAllPost(MemberDto dto);

}
