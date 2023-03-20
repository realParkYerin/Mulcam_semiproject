package a.dto;

public class LikePostDto {
	private String user_id;
	private int bbs_seq;
	
	public LikePostDto() {
		super();
	}

	public LikePostDto(String user_id, int bbs_seq) {
		super();
		this.user_id = user_id;
		this.bbs_seq = bbs_seq;
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

	@Override
	public String toString() {
		return "LikePostDto [user_id=" + user_id + ", bbs_seq=" + bbs_seq + "]";
	}
	
	
	
}
