package a.dto;

import java.util.List;

public class FpdImgDto {
	FreePostDto freepostdto;
	List<BbsImgVO> bbsimgvo;
	
	public FpdImgDto() {
		super();
	}

	public FpdImgDto(FreePostDto freepostdto, List<BbsImgVO> bbsimgvo) {
		super();
		this.freepostdto = freepostdto;
		this.bbsimgvo = bbsimgvo;
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

	@Override
	public String toString() {
		return "FpdImgDto [freepostdto=" + freepostdto + ", bbsimgvo=" + bbsimgvo + "]";
	}

	
	
	
}
