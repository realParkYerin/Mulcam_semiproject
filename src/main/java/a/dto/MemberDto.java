package a.dto;

import java.io.Serializable;
import java.util.Date;

public class MemberDto implements Serializable{
	
	private String user_seq;
	private String username;
	private String pwd;
	private String email;
	private String nickname;
	private String img_path;
	private Date reg_date;
	private Date modify_date;
	private int auth;
	
	public MemberDto() {
		
	}

	public MemberDto(String userid, String username, String pwd, String email, String nickname, String img_path,
			Date reg_date, Date modify_date, int auth) {
		super();
		this.user_seq = userid;
		this.username = username;
		this.pwd = pwd;
		this.email = email;
		this.nickname = nickname;
		this.img_path = img_path;
		this.reg_date = reg_date;
		this.modify_date = modify_date;
		this.auth = auth;
	}

	public String getUserid() {
		return user_seq;
	}

	public void setUserid(String userid) {
		this.user_seq = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public Date getModify_date() {
		return modify_date;
	}

	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "MemberDto [user_seq=" + user_seq + ", username=" + username + ", pwd=" + pwd + ", email=" + email
				+ ", nickname=" + nickname + ", img_path=" + img_path + ", reg_date=" + reg_date + ", modify_date="
				+ modify_date + ", auth=" + auth + "]";
	}
	
	
}
