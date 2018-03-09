package multi.club.vo;

public class Club_board_repleVO {
	
	//기본생성자 생성
	public Club_board_repleVO() {}
	
	//프로퍼티 선언
	private Integer c_board_reple_no=null;
	private String c_board_reple_content=null;
	private String the_time=null;
	private String user_id=null;
	private Integer c_board_no=null;
	
	//getter & setter
	public Integer getC_board_reple_no() {
		return c_board_reple_no;
	}
	public void setC_board_reple_no(Integer c_board_reple_no) {
		this.c_board_reple_no = c_board_reple_no;
	}
	public String getC_board_reple_content() {
		return c_board_reple_content;
	}
	public void setC_board_reple_content(String c_board_reple_content) {
		this.c_board_reple_content = c_board_reple_content;
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
	public Integer getC_board_no() {
		return c_board_no;
	}
	public void setC_board_no(Integer c_board_no) {
		this.c_board_no = c_board_no;
	}
	
}
