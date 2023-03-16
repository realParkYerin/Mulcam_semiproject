package a.dto;

public class PetDto {
	
	private int pet_seq;
	private String species;
	private String kind;
	private String pet_name;
	private int pet_yy;
	private String user_id;
	private String gender;

	public PetDto() {
	}

	public PetDto(int pet_seq, String species, String kind, String pet_name, int pet_yy, String user_id,
			String gender) {
		super();
		this.pet_seq = pet_seq;
		this.species = species;
		this.kind = kind;
		this.pet_name = pet_name;
		this.pet_yy = pet_yy;
		this.user_id = user_id;
		this.gender = gender;
	}

	public int getPet_seq() {
		return pet_seq;
	}

	public void setPet_seq(int pet_seq) {
		this.pet_seq = pet_seq;
	}

	public String getSpecies() {
		return species;
	}

	public void setSpecies(String species) {
		this.species = species;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getPet_name() {
		return pet_name;
	}

	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}

	public int getPet_yy() {
		return pet_yy;
	}

	public void setPet_yy(int pet_yy) {
		this.pet_yy = pet_yy;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "PetDto [pet_seq=" + pet_seq + ", species=" + species + ", kind=" + kind + ", pet_name=" + pet_name
				+ ", pet_yy=" + pet_yy + ", user_id=" + user_id + ", gender=" + gender + "]";
	}
	
}
