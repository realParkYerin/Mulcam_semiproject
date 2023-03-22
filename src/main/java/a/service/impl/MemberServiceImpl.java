package a.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import a.dao.MemberDao;
import a.dto.FreeCommentVO;
import a.dto.FreePostDto;
import a.dto.MemberDto;
import a.dto.PetDto;
import a.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao memDao;

	@Override
	public boolean idCheck(String user_id) {
		int count = memDao.idCheck(user_id);
		return count>0?true:false;
	}

	@Override
	public boolean nicknameCheck(String nickname) {
		int count = memDao.nicknameCheck(nickname);
		return count>0?true:false;
	}

	@Override
	public boolean addMember(MemberDto memDto) {
		int count = memDao.addMember(memDto);
		return count>0?true:false;
	}

	@Override
	public MemberDto login(MemberDto memDto) {
		return memDao.login(memDto);
	}
	
	@Override
	public PetDto getMyPet(MemberDto dto) {
		return memDao.getMyPet(dto);
	}
	
	@Override
	public List<FreePostDto> getAllPost(MemberDto dto) {
		return memDao.getAllPost(dto);
	}
	
	@Override
	public List<FreeCommentVO> getAllComment(MemberDto dto) {
		return memDao.getAllComment(dto);
	}

	@Override
	public void logout(HttpSession session) {
		// 세션 전체를 무효화
		session.invalidate();
		
	}
	
	
}
