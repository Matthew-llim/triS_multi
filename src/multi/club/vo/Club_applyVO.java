package multi.club.vo;

public class Club_applyVO {
	public Club_applyVO() {}
	
	private Integer apply_no = null; 
    private String user_id = null; 
    private Integer club_no = null; 
    private String apply_content = null;
    private String user_name = null;
    private Integer flag = null;
    private String etc = null;
    
	public Integer getApply_no() {
		return apply_no;
	}
	public void setApply_no(Integer apply_no) {
		this.apply_no = apply_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Integer getClub_no() {
		return club_no;
	}
	public void setClub_no(Integer club_no) {
		this.club_no = club_no;
	}
	public String getApply_content() {
		return apply_content;
	}
	public void setApply_content(String apply_content) {
		this.apply_content = apply_content;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public Integer getFlag() {
		return flag;
	}
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	} 
}
