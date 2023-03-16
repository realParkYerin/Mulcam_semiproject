package a.service;

import a.dto.MemberDto;
import a.dto.PetDto;

public interface MyPageService {
	
	MemberDto login(MemberDto dto);
	String pwdCheck(String user_id);
	int nickCheck(String nickname);
	boolean updateMember(MemberDto dto);
	PetDto getMyPet(MemberDto dto);

}
