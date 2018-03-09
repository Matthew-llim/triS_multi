package main.vo;

public class Community_qna_repleVO {

	public Integer getCom_qna_reple_no() {
		return com_qna_reple_no;
	}
	public void setCom_qna_reple_no(Integer com_qna_reple_no) {
		this.com_qna_reple_no = com_qna_reple_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Integer getCom_qna_no() {
		return com_qna_no;
	}
	public void setCom_qna_no(Integer com_qna_no) {
		this.com_qna_no = com_qna_no;
	}
	public String getCom_qna_reple_content() {
		return com_qna_reple_content;
	}
	public void setCom_qna_reple_content(String com_qna_reple_content) {
		this.com_qna_reple_content = com_qna_reple_content;
	}
	public String getThe_time() {
		return the_time;
	}
	public void setThe_time(String the_time) {
		this.the_time = the_time;
	}
	public Integer getRecom_count() {
		return recom_count;
	}
	public void setRecom_count(Integer recom_count) {
		this.recom_count = recom_count;
	}
	public Community_qna_repleVO(){}
	public Community_qna_repleVO(Integer com_qna_reple_no, String user_id, Integer com_qna_no,
			String com_qna_reple_content, String the_time, Integer recom_count) {
		this.com_qna_reple_no = com_qna_reple_no;
		this.user_id = user_id;
		this.com_qna_no = com_qna_no;
		this.com_qna_reple_content = com_qna_reple_content;
		this.the_time = the_time;
		this.recom_count = recom_count;
	}
	private Integer com_qna_reple_no=null;
	private String user_id=null;
	private Integer com_qna_no=null;
	private String com_qna_reple_content=null;
	private String the_time=null;
	private Integer recom_count=null;
}
