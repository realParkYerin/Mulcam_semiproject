package a.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.github.pagehelper.PageInfo;

import a.dao.AdminDao;
import a.dao.MemberDao;
import a.dto.BbsParam;
import a.dto.FreeCommentVO;
import a.dto.FreePostDto;
import a.dto.MemberDto;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	SqlSession sqlSession;
	
	//로그인한 회원이 관리자인지 확인 -> 추후 수정

	//회원 목록 - 조회
	@Override
	public List<MemberDto> memberList() {
		return sqlSession.selectList("admin.memberList");
	}
	
	//회원 목록 - 검색 
	@Override
	public PageInfo<MemberDto> searchByMemberList(String keyword,String choice) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("param1", choice);
		parameters.put("param2", keyword);
		return PageInfo.of(sqlSession.selectList("admin.searchByMemberList",parameters));
	}

	//회원 정보 상세 조회
	@Override
	public MemberDto viewMember(String user_id) {
		return sqlSession.selectOne("admin.viewMember",user_id);
	}
	
	//자유게시판 목록 조회
	@Override
	public List<FreePostDto> bbsList() {
		return sqlSession.selectList("admin.bbsList");
	}
	
	//자유게시판 목록 - 검색
	@Override
	public PageInfo<FreePostDto> searchByFreePostList(String keyword, String choice) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("param1", choice);
		parameters.put("param2", keyword);
		
		return PageInfo.of(sqlSession.selectList("admin.searchByFreePostList", parameters));
	}

//	@Override
//	public int getAllBbs(BbsParam bbs) {
//		return sqlSession.selectOne("admin.getAllBbs", bbs);
//	}

	//게시글 bbs_seq가져오기
	@Override
	public FreePostDto getBbs(int bbs_seq) {
		return sqlSession.selectOne("admin.getBbs",bbs_seq);
	}
	
	//자유게시판 댓글 목록
	@Override
	public List<FreeCommentVO> getComment() {
		return sqlSession.selectList("admin.getComment");
	}

	//자유게시판 댓글 목록 - 검색
	@Override
	public PageInfo<FreeCommentVO> searchByFreeCommentList(String keyword, String choice) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("param1", choice);
		parameters.put("param2", keyword);
		
		return PageInfo.of(sqlSession.selectList("admin.searchByFreeCommentList",parameters));
	}
}
