package main.vo;

public class User_clubVO {
	public Integer club_no;
	public String user_id;
	
	public User_clubVO(){}
	
	public User_clubVO(Integer club_no, String user_id) {
		super();
		this.club_no = club_no;
		this.user_id = user_id;
	}
	public Integer getClub_no() {
		return club_no;
	}
	public void setClub_no(Integer club_no) {
		this.club_no = club_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
}
