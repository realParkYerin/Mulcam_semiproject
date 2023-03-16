package a.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import a.dao.MyPageDao;
import a.dto.MemberDto;
import a.dto.PetDto;
import a.service.MyPageService;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	MyPageDao dao;
	
	@Override
	public MemberDto login(MemberDto dto) {
		return dao.login(dto);
	}
	
	@Override
	public String pwdCheck(String user_id) {
		return dao.pwdCheck(user_id);
	}
	
	@Override
	public int nickCheck(String nickname) {
		return dao.nickCheck(nickname);
	}
	
	@Override
	public boolean updateMember(MemberDto dto) {
		int n = dao.updateMember(dto);
		return n > 0 ? true : false;
	}
	
	@Override
	public PetDto getMyPet(MemberDto dto) {
		return dao.getMyPet(dto);
	}
	
	@Override
	public boolean insertPet(PetDto pet) {
		int n = dao.insertPet(pet);
		return n > 0 ? true : false;
	}
	
	@Override
	public boolean updatePet(PetDto pet) {
		int n = dao.updatePet(pet);
		return n > 0 ? true : false;
	}
	
}
