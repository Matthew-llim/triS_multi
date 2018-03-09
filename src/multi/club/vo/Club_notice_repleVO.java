package multi.club.vo;

public class Club_notice_repleVO {
	//기본생성자
	public Club_notice_repleVO() {}
	
	//프로퍼티들
	private Integer c_notice_reple_no = null;
	private String user_id = null;
	private Integer c_notice_no = null;
	private String the_time = null;
	private String c_notice_reple_content = null;
	
	//setter & getter
	public Integer getC_notice_reple_no() {
		return c_notice_reple_no;
	}
	public void setC_notice_reple_no(Integer c_notice_reple_no) {
		this.c_notice_reple_no = c_notice_reple_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Integer getC_notice_no() {
		return c_notice_no;
	}
	public void setC_notice_no(Integer c_notice_no) {
		this.c_notice_no = c_notice_no;
	}
	public String getThe_time() {
		return the_time;
	}
	public void setThe_time(String the_time) {
		this.the_time = the_time;
	}
	public String getC_notice_reple_content() {
		return c_notice_reple_content;
	}
	public void setC_notice_reple_content(String c_notice_reple_content) {
		this.c_notice_reple_content = c_notice_reple_content;
	}
}
