package a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.dao.MyPageDao;
import a.dto.FreePostDto;
import a.dto.MemberDto;
import a.dto.PetDto;

@Repository
public class MyPageDaoImpl implements MyPageDao {
	
	@Autowired
	SqlSession session;
	
	String ns1 = "MyPage.";
	String ns2 = "Member.";
	
	@Override
	public MemberDto login(MemberDto dto) {
		return session.selectOne(ns2 + "login", dto);
	}

	@Override
	public String pwdCheck(String user_id) {
		return session.selectOne(ns1 + "pwdCheck", user_id);
	}
	
	@Override
	public int nickCheck(String nickname) {
		int n = session.selectOne(ns1 + "nickCheck", nickname);
		return n;
	}
	
	@Override
	public int updateMember(MemberDto dto) {
		int n = session.update(ns1 + "updateMember", dto);
		return n;
	}
	
	@Override
	public PetDto getMyPet(MemberDto dto) {
		return session.selectOne(ns1 + "getMyPet", dto);
	}
	
	@Override
	public int insertPet(PetDto pet) {
		int n = session.insert(ns1 + "insertPet", pet);
		return n;
	}
	
	@Override
	public int updatePet(PetDto pet) {
		int n = session.update(ns1 + "updatePet", pet);
		return n;
	}
	
	@Override
	public List<FreePostDto> getAllPost(MemberDto dto) {
		return session.selectList(ns1 + "getAllPost", dto);
	}
	
}
