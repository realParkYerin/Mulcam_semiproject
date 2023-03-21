package a.dto;

import java.util.List;

public class FpdImgDto {
	FreePostDto freepostdto;
	List<BbsImgVO> bbsimgvo;
	List<FreeCommentVO> commentvo;
	
	// 아래 두개는 작성자 이미지를 불러오기 위한 dto와, 댓글 작성자들의 이미지를 불러오기 위한 dto list
	MemberDto writor;
	List<MemberDto> cmtwritorlist;
	
	
	public FpdImgDto() {
		super();
	}


	public FpdImgDto(FreePostDto freepostdto, List<BbsImgVO> bbsimgvo, List<FreeCommentVO> commentvo, MemberDto writor,
			List<MemberDto> cmtwritorlist) {
		super();
		this.freepostdto = freepostdto;
		this.bbsimgvo = bbsimgvo;
		this.commentvo = commentvo;
		this.writor = writor;
		this.cmtwritorlist = cmtwritorlist;
	}


	public FreePostDto getFreepostdto() {
		return freepostdto;
	}


	public void setFreepostdto(FreePostDto freepostdto) {
		this.freepostdto = freepostdto;
	}


	public List<BbsImgVO> getBbsimgvo() {
		return bbsimgvo;
	}


	public void setBbsimgvo(List<BbsImgVO> bbsimgvo) {
		this.bbsimgvo = bbsimgvo;
	}


	public List<FreeCommentVO> getCommentvo() {
		return commentvo;
	}


	public void setCommentvo(List<FreeCommentVO> commentvo) {
		this.commentvo = commentvo;
	}


	public MemberDto getWritor() {
		return writor;
	}


	public void setWritor(MemberDto writor) {
		this.writor = writor;
	}


	public List<MemberDto> getCmtwritorlist() {
		return cmtwritorlist;
	}


	public void setCmtwritorlist(List<MemberDto> cmtwritorlist) {
		this.cmtwritorlist = cmtwritorlist;
	}


	@Override
	public String toString() {
		return "FpdImgDto [freepostdto=" + freepostdto + ", bbsimgvo=" + bbsimgvo + ", commentvo=" + commentvo
				+ ", writor=" + writor + ", cmtwritorlist=" + cmtwritorlist + "]";
	}

	
	

	

	

	
	
	
}
