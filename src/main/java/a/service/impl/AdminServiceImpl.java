package a.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import a.dao.AdminDao;
import a.dao.MemberDao;
import a.dao.impl.AdminDaoImpl;
import a.dto.BbsParam;
import a.dto.FreePostDto;
import a.dto.MemberDto;
import a.service.AdminService;
import a.service.MemberService;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDao dao;
	
	//로그인한 회원이 관리자인지 확인
	/*
	 * @Override public boolean isAdmin(String user_id) { MemberDto loginUser =
	 * dao.selectMemberById(user_id);
	 * 
	 * return loginUser != null && loginUser.getAuth() ==2; }
	 */

	//회원목록 조회
	@Override
	public List<MemberDto> memberList() {
		return dao.memberList();
	}
	
	//회원 정보 상세 조회
	@Override
	public MemberDto viewMember(String user_id) {
		return dao.viewMember(user_id);
	}

	//게시글 목록 조회
	@Override
	public List<FreePostDto> bbsList(BbsParam bbs) {
		return dao.bbsList(bbs);
	}

	@Override
	public int getAllBbs(BbsParam bbs) {
		return dao.getAllBbs(bbs);
	}

	//게시글 bbs_seq가져오기
	@Override
	public FreePostDto getBbs(int bbs_seq) {
		return dao.getBbs(bbs_seq);
	}


}

