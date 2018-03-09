package main.vo;

public class Space_qna_repleVO {
	public Integer space_qna_reple_no;
	public Integer space_qna_no;
	public Integer space_no;
	public String space_qna_reple_content;
	public String the_time;
	public String user_id;
	
	public Space_qna_repleVO(){}
	
	public Space_qna_repleVO(Integer space_qna_reple_no, Integer space_qna_no, Integer space_no,
			String space_qna_reple_content, String the_time, String user_id) {
		super();
		this.space_qna_reple_no = space_qna_reple_no;
		this.space_qna_no = space_qna_no;
		this.space_no = space_no;
		this.space_qna_reple_content = space_qna_reple_content;
		this.the_time = the_time;
		this.user_id = user_id;
	}
	public Integer getSpace_qna_reple_no() {
		return space_qna_reple_no;
	}
	public void setSpace_qna_reple_no(Integer space_qna_reple_no) {
		this.space_qna_reple_no = space_qna_reple_no;
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
	public String getSpace_qna_reple_content() {
		return space_qna_reple_content;
	}
	public void setSpace_qna_reple_content(String space_qna_reple_content) {
		this.space_qna_reple_content = space_qna_reple_content;
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
	
}
