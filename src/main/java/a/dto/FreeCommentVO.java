package a.dto;

import java.util.Date;

public class FreeCommentVO {
    private int commentSeq; // 댓글 번호
    private String userSeq; // 작성자 번호
    private int bbsSeq; // 게시글 번호
    private String cmtContent; // 댓글 내용
    private int targetId; // 대상 댓글 번호 (대댓글 작성 시 사용)
    private int commentGroup; // 댓글 그룹 (대댓글 작성 시 사용)
    private boolean delCmt; // 삭제 여부
    private Date regCmtDate; // 작성일
    
	public FreeCommentVO() {
		super();
	}

	public FreeCommentVO(int commentSeq, String userSeq, int bbsSeq, String cmtContent, int targetId, int commentGroup,
			boolean delCmt, Date regCmtDate) {
		super();
		this.commentSeq = commentSeq;
		this.userSeq = userSeq;
		this.bbsSeq = bbsSeq;
		this.cmtContent = cmtContent;
		this.targetId = targetId;
		this.commentGroup = commentGroup;
		this.delCmt = delCmt;
		this.regCmtDate = regCmtDate;
	}

	public int getCommentSeq() {
		return commentSeq;
	}

	public void setCommentSeq(int commentSeq) {
		this.commentSeq = commentSeq;
	}

	public String getUserSeq() {
		return userSeq;
	}

	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}

	public int getBbsSeq() {
		return bbsSeq;
	}

	public void setBbsSeq(int bbsSeq) {
		this.bbsSeq = bbsSeq;
	}

	public String getCmtContent() {
		return cmtContent;
	}

	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}

	public int getTargetId() {
		return targetId;
	}

	public void setTargetId(int targetId) {
		this.targetId = targetId;
	}

	public int getCommentGroup() {
		return commentGroup;
	}

	public void setCommentGroup(int commentGroup) {
		this.commentGroup = commentGroup;
	}

	public boolean isDelCmt() {
		return delCmt;
	}

	public void setDelCmt(boolean delCmt) {
		this.delCmt = delCmt;
	}

	public Date getRegCmtDate() {
		return regCmtDate;
	}

	public void setRegCmtDate(Date regCmtDate) {
		this.regCmtDate = regCmtDate;
	}
	
	

    // 생성자, Getter/Setter 생략
    
}