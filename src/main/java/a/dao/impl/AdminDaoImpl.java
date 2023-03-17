package a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.dao.AdminDao;
import a.dao.MemberDao;
import a.dto.BbsParam;
import a.dto.FreePostDto;
import a.dto.MemberDto;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	SqlSession sqlSession;
	
	//로그인한 회원이 관리자인지 확인 -> 추후 수정
	/*
	 * @Override public MemberDto selectMemberById(String user_id) { return
	 * sqlSession.selectOne("admin.selectMemberById", user_id); }
	 */
	
	//회원 목록 조회
	@Override
	public List<MemberDto> memberList() {
		return sqlSession.selectList("admin.memberList");
	}

	//회원 정보 상세 조회
	@Override
	public MemberDto viewMember(String user_id) {
		return sqlSession.selectOne("admin.viewMember",user_id);
	}
	
	//자유게시판 목록 조회
	@Override
	public List<FreePostDto> bbsList(BbsParam bbs) {
		return sqlSession.selectList("admin.bbsList",bbs);
	}

	@Override
	public int getAllBbs(BbsParam bbs) {
		return sqlSession.selectOne("admin.getAllBbs", bbs);
	}

	//게시글 bbs_seq가져오기
	@Override
	public FreePostDto getBbs(int bbs_seq) {
		return sqlSession.selectOne("admin.getBbs",bbs_seq);
	}

}
