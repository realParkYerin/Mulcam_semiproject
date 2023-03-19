package a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.dao.MemberDao;
import a.dto.FreeCommentVO;
import a.dto.FreePostDto;
import a.dto.MemberDto;
import a.dto.PetDto;

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
	
	@Override
	public PetDto getMyPet(MemberDto dto) {
		return session.selectOne(ns + "getMyPet", dto);
	}
	
	@Override
	public List<FreePostDto> getAllPost(MemberDto dto) {
		return session.selectList(ns + "getAllPost", dto);
	}
	
	@Override
	public List<FreeCommentVO> getAllComment(MemberDto dto) {
		return session.selectList(ns + "getAllComment", dto);
	}
	
}
