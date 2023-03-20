package a.dto;

import java.util.List;

public class FpdImgDto {
	FreePostDto freepostdto;
	List<BbsImgVO> bbsimgvo;
	List<FreeCommentVO> commentvo;
	
	public FpdImgDto() {
		super();
	}

	public FpdImgDto(FreePostDto freepostdto, List<BbsImgVO> bbsimgvo, List<FreeCommentVO> commentvo) {
		super();
		this.freepostdto = freepostdto;
		this.bbsimgvo = bbsimgvo;
		this.commentvo = commentvo;
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

	@Override
	public String toString() {
		return "FpdImgDto [freepostdto=" + freepostdto + ", bbsimgvo=" + bbsimgvo + ", commentvo=" + commentvo + "]";
	}
	
	

	

	

	
	
	
}
