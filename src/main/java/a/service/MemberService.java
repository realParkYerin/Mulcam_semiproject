package a.service;

import a.dto.MemberDto;

public interface MemberService {
	
	boolean idCheck(String user_id);
	
	boolean nicknameCheck(String nickname);
	
	boolean addMember(MemberDto memDto);
}
