package a.dao;

import a.dto.MemberDto;
import a.dto.PetDto;

public interface MyPageDao {

	MemberDto login(MemberDto dto);
	String pwdCheck(String user_id);
	int nickCheck(String nickname);
	int updateMember(MemberDto dto);
	PetDto getMyPet(MemberDto dto);
	int insertPet(PetDto pet);
	int updatePet(PetDto pet);

}
