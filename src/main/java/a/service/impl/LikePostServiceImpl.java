package a.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import a.dao.impl.LikePostDaoImpl;
import a.dto.LikePostDto;

@Service
public class LikePostServiceImpl {
	
	@Autowired
	private LikePostDaoImpl LikePostDao;
	
	public boolean checkandtoggle(LikePostDto dto) {
		int n = LikePostDao.checkandtoggle(dto);
		return n>0?true:false;
	}

	public boolean findfirststate(LikePostDto dto) {
		int n = LikePostDao.findfirststate(dto);
		return n>0?true:false;
	}

}
