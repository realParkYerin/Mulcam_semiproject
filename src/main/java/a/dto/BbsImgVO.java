package a.dto;

public class BbsImgVO {
	// int bbs_seq;
	int img_seq;
	String img_name;
	String img_path;
	String img_type;
	
	public BbsImgVO() {
		super();
	}
	
	

	public BbsImgVO(int img_seq, String img_path) {
		super();
		this.img_seq = img_seq;
		this.img_path = img_path;
	}



	public BbsImgVO(int img_seq, String img_name, String img_path, String img_type) {
		super();
		this.img_seq = img_seq;
		this.img_name = img_name;
		this.img_path = img_path;
		this.img_type = img_type;
	}

	public int getImg_seq() {
		return img_seq;
	}

	public void setImg_seq(int img_seq) {
		this.img_seq = img_seq;
	}

	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public String getImg_type() {
		return img_type;
	}

	public void setImg_type(String img_type) {
		this.img_type = img_type;
	}

	@Override
	public String toString() {
		return "BbsImgVO [img_seq=" + img_seq + ", img_name=" + img_name + ", img_path=" + img_path + ", img_type="
				+ img_type + "]";
	}
	
	
}
