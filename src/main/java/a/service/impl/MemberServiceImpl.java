package a.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import a.dao.MemberDao;
import a.dto.MemberDto;
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
	
	
	
}
