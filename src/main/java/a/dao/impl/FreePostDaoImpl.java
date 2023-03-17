package a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import a.dto.FreePostDto;
import a.dto.BbsImgVO;
import a.dto.BbsParam;
import a.dto.FpdImgDto;

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
    
    
     
     
    // 사진이 없다면.
    public int writeBbs(FreePostDto dto) {
		return sqlSession.insert(ns + "writeBbs", dto);
	}
    
    
    
    /*
	public int writeImg(List<BbsImgVO> bbsImglist) {
		int n = 0;
		for (BbsImgVO bbsImg : bbsImglist) {
			// 각각의 모든 img를 콘트롤러에서 set된 dto for문 돌면서 모두 추가.
			sqlSession.insert(ns + "writeImg", bbsImg);
			n++;
		}
		return n;
	}
    */
	
    // 사진이 있다면.
	public int writeBbs(FreePostDto dto, List<BbsImgVO> bbsImglist) {
		sqlSession.insert(ns + "writeBbs", dto);
		System.out.println("DAO.writeBbs");
		// 글 내용 DB에 추가
		int n=0;
		
		for (BbsImgVO bbsImg : bbsImglist) {
			// 각각의 모든 img를 콘트롤러에서 set된 dto for문 돌면서 모두 추가.
			System.out.println("multiimg + img_rel");
			sqlSession.insert(ns + "multiimg", bbsImg);
			sqlSession.insert(ns + "img_rel");
			
			n++;
		}
		
		return n;
	}
    
    
    // 게시물 상세보기
    
    public FpdImgDto getBbs(int bbs_seq) {

    	sqlSession.update(ns + "increaseReadcount", bbs_seq);
    	FpdImgDto dto = new FpdImgDto();
    	
    	FreePostDto fdto = sqlSession.selectOne(ns + "getBbs", bbs_seq);
    	List<BbsImgVO> ivo = sqlSession.selectList(ns + "getImg", bbs_seq);
    	
    	
    	// System.out.println(ivo.toString());
    	dto.setFreepostdto(fdto);
    	dto.setBbsimgvo(ivo);
    	return dto;
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


