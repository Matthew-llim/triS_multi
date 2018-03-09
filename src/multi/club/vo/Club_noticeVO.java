package multi.club.vo;

public class Club_noticeVO {
	public Club_noticeVO() {}
	
	private Integer c_notice_no;
    private String c_notice_title;
    private String c_notice_content;
    private String the_time;
    private String user_id;
    private Integer club_no;
    private Integer view_count;
    private String user_name;
    
	public Integer getC_notice_no() {
		return c_notice_no;
	}
	public void setC_notice_no(Integer c_notice_no) {
		this.c_notice_no = c_notice_no;
	}
	public String getC_notice_title() {
		return c_notice_title;
	}
	public void setC_notice_title(String c_notice_title) {
		this.c_notice_title = c_notice_title;
	}
	public String getC_notice_content() {
		return c_notice_content;
	}
	public void setC_notice_content(String c_notice_content) {
		this.c_notice_content = c_notice_content;
	}
	public String getThe_time() {
		return the_time;
	}
	public void setThe_time(String the_time) {
		this.the_time = the_time;
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
	public Integer getView_count() {
		return view_count;
	}
	public void setView_count(Integer view_count) {
		this.view_count = view_count;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
}
