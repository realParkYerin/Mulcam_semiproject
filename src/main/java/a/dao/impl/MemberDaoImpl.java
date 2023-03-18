package a.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.dao.MemberDao;
import a.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	SqlSession session;
	
	String ns = "Member.";

	@Override
	public int idCheck(String user_id) {
		return session.selectOne(ns + "idcheck", user_id);
	}

	@Override
	public int nicknameCheck(String nickname) {
		return session.selectOne(ns + "nicknamecheck", nickname);
	}

	@Override
	public int addMember(MemberDto memDto) {
		return session.insert(ns + "addmember", memDto);
	}

	@Override
	public MemberDto login(MemberDto memDto) {
		return session.selectOne(ns + "login", memDto);
	}
	
	
}
