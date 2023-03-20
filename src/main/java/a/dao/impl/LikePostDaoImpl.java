package a.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.dto.LikePostDto;

@Repository
public class LikePostDaoImpl {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "LikePost.";
	
	public int checkandtoggle(LikePostDto dto) {
		
		// 1 -> 좋아요 취소를 출력 해야함 ( 현재 좋아요가 아닌 상태 )
		int n = sqlSession.selectOne(ns + "findLike", dto);
		// System.out.println("findlike" + n); // 0 or 1 출력
		
		int count = 0;
		
		if(n==0) {	// 처음이거나 좋아요가 없는 경우 insert into like post 테이블 // user_id와 bbs_seq
					// 그리고, freepost테이블의 bbs_seq가 일치하는 것 likecount + 1
			count = sqlSession.insert(ns + "likepostinsert", dto);		
			count += sqlSession.update(ns + "likeupCount", dto);
			
					// ( 현재 좋아요 상태 )
		} else {	// delete likepost테이블에서 bbs_seq와 user_id값이 일치하는 것 삭제. 
					// 그리고, freepost테이블의 bbs_seq가 일치하는 것 likecount - 1 
			count = sqlSession.delete(ns + "dislikepostdel", dto);
			count += sqlSession.update(ns + "likedownCount", dto);
		}
		return count;
	}

	public int findfirststate(LikePostDto dto) {
		int n = sqlSession.selectOne(ns + "findLike", dto);
		return n;
	}

}
