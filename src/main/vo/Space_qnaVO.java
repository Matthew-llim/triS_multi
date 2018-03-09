package main.vo;

public class Space_qnaVO {
	public Integer space_qna_no;
	public Integer space_no;
	public String user_id;
	public String space_qna_content;
	public String space_qna_title;
	public String the_time;
	
	public Space_qnaVO(){}
	
	public Space_qnaVO(Integer space_qna_no, Integer space_no, String user_id, String space_qna_content,
			String space_qna_title, String the_time) {
		super();
		this.space_qna_no = space_qna_no;
		this.space_no = space_no;
		this.user_id = user_id;
		this.space_qna_content = space_qna_content;
		this.space_qna_title = space_qna_title;
		this.the_time = the_time;
	}
	public Integer getSpace_qna_no() {
		return space_qna_no;
	}
	public void setSpace_qna_no(Integer space_qna_no) {
		this.space_qna_no = space_qna_no;
	}
	public Integer getSpace_no() {
		return space_no;
	}
	public void setSpace_no(Integer space_no) {
		this.space_no = space_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getSpace_qna_content() {
		return space_qna_content;
	}
	public void setSpace_qna_content(String space_qna_content) {
		this.space_qna_content = space_qna_content;
	}
	public String getSpace_qna_title() {
		return space_qna_title;
	}
	public void setSpace_qna_title(String space_qna_title) {
		this.space_qna_title = space_qna_title;
	}
	public String getThe_time() {
		return the_time;
	}
	public void setThe_time(String the_time) {
		this.the_time = the_time;
	}
	
}
