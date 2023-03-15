package a.dao;

import a.dto.MemberDto;

public interface MemberDao {
	
	// 아이디 중복확인
	int idCheck(String user_id);
	
	// 닉네임 중복확인
	int nicknameCheck(String nickname);
	
	// 회원가입
	int addMember(MemberDto memDto);
}
