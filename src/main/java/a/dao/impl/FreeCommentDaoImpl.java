package a.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.dto.FreeCommentVO;

@Repository
public class FreeCommentDaoImpl {
	
	@Autowired
	SqlSession sqlSession;
	
	String ns = "FreeCommentBbs.";

	public int cmtinsert(FreeCommentVO dto) {
		int n = 0;
		n = sqlSession.update(ns + "bbscmtcountUp", dto);	System.out.println("코멘트 카운트 + :" + n);
		n += sqlSession.insert(ns + "cmtinsert", dto);		System.out.println("코멘트 DB삽입 완료: " + n);
		return n;
	}

	public int cmtupdate(FreeCommentVO dto) {
		return sqlSession.update(ns + "cmtupdate", dto);
	}

	public int cmtdelete(FreeCommentVO dto) {
		System.out.println(dto.toString());
		return sqlSession.update(ns + "cmtdelete", dto);
	}

}
