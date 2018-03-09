package multi.admin.vo; 
 
public class Admin_searchVO {
	public Admin_searchVO(){}
	private String search_option = null;
	public Admin_searchVO(String search_option, String search_content, Integer start_no){}
	public Admin_searchVO(String search_option, String search_content, String crn, String host_name, Integer start_no) {
		super();
		this.search_option = search_option;
		this.search_content = search_content;
		this.crn = crn;
		this.host_name = host_name;
		this.start_no = start_no;
	}
	public String getSearch_option() {
		return search_option;
	}
	public void setSearch_option(String search_option) {
		this.search_option = search_option;
	}
	public String getSearch_content() {
		return search_content;
	}
	public void setSearch_content(String search_content) {
		this.search_content = search_content;
	}
	public String getCrn() {
		return crn;
	}
	public void setCrn(String crn) {
		this.crn = crn;
	}
	public String getHost_name() {
		return host_name;
	}
	public void setHost_name(String host_name) {
		this.host_name = host_name;
	}
	public Integer getStart_no() {
		return start_no;
	}
	public void setStart_no(Integer start_no) {
		this.start_no = start_no;
	}
	private String search_content = null;
	private String crn = null;
	private String host_name = null;
	private Integer start_no = null;
}
