package multi.community.qna.vo;

public class Community_qna_searchVO {
	private String comm_search_option;
	private String comm_search_content;
	private Integer start;
	
	public String getComm_search_option() {
		return comm_search_option;
	}
	public void setComm_search_option(String comm_search_option) {
		this.comm_search_option = comm_search_option;
	}
	public String getComm_search_content() {
		return comm_search_content;
	}
	public void setComm_search_content(String comm_search_content) {
		this.comm_search_content = comm_search_content;
	}
	
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
}
