package main.vo;

public class UserVO {
	private String user_id = null;
	private String ssn1 = null;
	private String ssn2 = null;
	private String passwd = null;
	private String user_name = null;
	private String gender = null;
	private String phone = null;
	private String nickname = null;
	private String zipcode = null;
	private String email = null;
	private Integer grade = null;
	private String zipdetail = null;

	public UserVO() {
		// TODO Auto-generated constructor stub
	}

	public UserVO(String user_id, String ssn1, String ssn2, String passwd, String user_name, String gender,
			String phone, String nickname, String zipcode, String email, Integer grade, String zipdetail) {
		super();
		this.user_id = user_id;
		this.ssn1 = ssn1;
		this.ssn2 = ssn2;
		this.passwd = passwd;
		this.user_name = user_name;
		this.gender = gender;
		this.phone = phone;
		this.nickname = nickname;
		this.zipcode = zipcode;
		this.email = email;
		this.grade = grade;
		this.zipdetail = zipdetail;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getSsn1() {
		return ssn1;
	}

	public void setSsn1(String ssn1) {
		this.ssn1 = ssn1;
	}

	public String getSsn2() {
		return ssn2;
	}

	public void setSsn2(String ssn2) {
		this.ssn2 = ssn2;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public String getZipdetail() {
		return zipdetail;
	}

	public void setZipdetail(String zipdetail) {
		this.zipdetail = zipdetail;
	}

}
