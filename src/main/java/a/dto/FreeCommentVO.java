package a.dto;

import java.util.Date;

public class FreeCommentVO {
	private int comment_seq;
	private String user_id;
	private int bbs_seq;
	private String cmt_content;
	private int target_id;
	private int comment_group;
	private int del_cmt;
	private Date reg_cmtdate;
	
	public FreeCommentVO() {	
	}

	public FreeCommentVO(int comment_seq, String user_id, int bbs_seq, String cmt_content, int target_id,
			int comment_group, int del_cmt, Date reg_cmtdate) {
		super();
		this.comment_seq = comment_seq;
		this.user_id = user_id;
		this.bbs_seq = bbs_seq;
		this.cmt_content = cmt_content;
		this.target_id = target_id;
		this.comment_group = comment_group;
		this.del_cmt = del_cmt;
		this.reg_cmtdate = reg_cmtdate;
	}

	public int getComment_seq() {
		return comment_seq;
	}

	public void setComment_seq(int comment_seq) {
		this.comment_seq = comment_seq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getBbs_seq() {
		return bbs_seq;
	}

	public void setBbs_seq(int bbs_seq) {
		this.bbs_seq = bbs_seq;
	}

	public String getCmt_content() {
		return cmt_content;
	}

	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}

	public int getTarget_id() {
		return target_id;
	}

	public void setTarget_id(int target_id) {
		this.target_id = target_id;
	}

	public int getComment_group() {
		return comment_group;
	}

	public void setComment_group(int comment_group) {
		this.comment_group = comment_group;
	}

	public int getDel_cmt() {
		return del_cmt;
	}

	public void setDel_cmt(int del_cmt) {
		this.del_cmt = del_cmt;
	}

	public Date getReg_cmtdate() {
		return reg_cmtdate;
	}

	public void setReg_cmtdate(Date reg_cmtdate) {
		this.reg_cmtdate = reg_cmtdate;
	}

	@Override
	public String toString() {
		return "FreeCommentVO [comment_seq=" + comment_seq + ", user_id=" + user_id + ", bbs_seq=" + bbs_seq
				+ ", cmt_content=" + cmt_content + ", target_id=" + target_id + ", comment_group=" + comment_group
				+ ", del_cmt=" + del_cmt + ", reg_cmtdate=" + reg_cmtdate + "]";
	} 
	
}