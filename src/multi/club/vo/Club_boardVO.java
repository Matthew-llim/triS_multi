package multi.club.vo;

public class Club_boardVO {
	public Club_boardVO() {}
	
	private Integer c_board_no;
	private String c_board_title;
    private String c_board_content;
    private String c_board_subject;
    private String the_time;
    private Integer club_no;
    private String user_id;
    private Integer view_count;
    private String user_name;
    
	public Integer getC_board_no() {
		return c_board_no;
	}
	public void setC_board_no(Integer c_board_no) {
		this.c_board_no = c_board_no;
	}
	public String getC_board_content() {
		return c_board_content;
	}
	public void setC_board_content(String c_board_content) {
		this.c_board_content = c_board_content;
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
	public Integer getView_count() {
		return view_count;
	}
	public void setView_count(Integer view_count) {
		this.view_count = view_count;
	}
	public String getC_board_title() {
		return c_board_title;
	}
	public void setC_board_title(String c_board_title) {
		this.c_board_title = c_board_title;
	}
	public Integer getClub_no() {
		return club_no;
	}
	public void setClub_no(Integer club_no) {
		this.club_no = club_no;
	}
	public String getC_board_subject() {
		return c_board_subject;
	}
	public void setC_board_subject(String c_board_subject) {
		this.c_board_subject = c_board_subject;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

}
