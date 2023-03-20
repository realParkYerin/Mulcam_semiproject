package a.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import a.dao.impl.FreeCommentDaoImpl;
import a.dto.FreeCommentVO;

@Service
public class FreeCommentServiceImpl {

	@Autowired
	FreeCommentDaoImpl FreeCommentDao;

	public boolean cmtinsert(FreeCommentVO dto) {
		int n = FreeCommentDao.cmtinsert(dto);
		return n>0?true:false;
	}

	public boolean cmtupdate(FreeCommentVO dto) {
		int n = FreeCommentDao.cmtupdate(dto);
		return  n>0?true:false;
	}

	public boolean cmtdelete(FreeCommentVO dto) {
		int n = FreeCommentDao.cmtdelete(dto);
		return n>0?true:false;
	}
	
	
}
