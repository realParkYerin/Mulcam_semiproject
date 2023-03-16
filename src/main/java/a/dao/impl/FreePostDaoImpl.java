package a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a.dto.FreePostDto;
import a.dto.BbsParam;

@Repository
public class FreePostDaoImpl {
	
    @Autowired
    SqlSession sqlSession;
    
    String ns = "FreeBbs.";
    
    public List<FreePostDto> bbslist(BbsParam param) {
        return sqlSession.selectList(ns + "bbslist", param);
    }

    public int getAllBbs(BbsParam param) {
        return sqlSession.selectOne(ns + "getAllBbs", param);
    }
    
    public int writeBbs(FreePostDto dto) {
		return sqlSession.insert(ns + "writeBbs", dto);
	}
    

    
    
    // 게시물 상세보기
    
    public FreePostDto getBbs(int seq) {
    	return sqlSession.selectOne(ns + "getBbs", seq);
    }
    
    public FreePostDto getFreePostDetail(int bbs_seq) {
        FreePostDto freePostDetail = null;
        freePostDetail = sqlSession.selectOne("freePost.getFreePostDetail", bbs_seq);
        return freePostDetail;
    }
    
    // 게시물 작성
    public int writeFreePost(FreePostDto dto) {
        int res = sqlSession.insert("freePost.writeFreePost", dto);
        return res;
    }
    
    // 게시물 수정
    public int updateFreePost(FreePostDto dto) {
        int res = sqlSession.update("freePost.updateFreePost", dto);
        return res;
    }
    
    // 게시물 삭제
    public int deleteFreePost(int bbs_seq) {
        int res = sqlSession.update("freePost.deleteFreePost", bbs_seq);
        return res;
    }
    
    // 게시물 이미지 가져오기
    public String getFreePostImage(int bbs_seq) {
        String freePostImage = null;
        freePostImage = sqlSession.selectOne("freePost.getFreePostImage", bbs_seq);
        return freePostImage;
    }
    
    public String getFreePostFirstImage(int postId) {
        String firstImage = sqlSession.selectOne("freePost.getFreePostFirstImage", postId);
        return firstImage;
    }
    



    
}


