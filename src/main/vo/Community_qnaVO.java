package main.vo;

public class Community_qnaVO {
	
	public Integer getCom_qna_no() {
		return com_qna_no;
	}
	public void setCom_qna_no(Integer com_qna_no) {
		this.com_qna_no = com_qna_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getThe_time() {
		return the_time;
	}
	public void setThe_time(String the_time) {
		this.the_time = the_time;
	}
	public String getCom_qna_content() {
		return com_qna_content;
	}
	public void setCom_qna_content(String com_qna_content) {
		this.com_qna_content = com_qna_content;
	}
	public String getCom_qna_title() {
		return com_qna_title;
	}
	public void setCom_qna_title(String com_qna_title) {
		this.com_qna_title = com_qna_title;
	}
	public Integer getView_count() {
		return view_count;
	}
	public void setView_count(Integer view_count) {
		this.view_count = view_count;
	}
	private Integer com_qna_no=null;
	private String user_id=null;
	private String the_time=null;
	private String com_qna_content=null;
	private String com_qna_title=null;
	private Integer view_count=null;
}
