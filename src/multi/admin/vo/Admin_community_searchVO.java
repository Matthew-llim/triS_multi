package multi.admin.vo; 
 
public class Admin_community_searchVO {
	public Admin_community_searchVO(){}
	public Admin_community_searchVO(String commsearch_option, String commsearch_content) {
		this.commsearch_option = commsearch_option;
		this.commsearch_content = commsearch_content;
	}
	public String getCommsearch_option() {
		return commsearch_option;
	}
	public void setCommsearch_option(String commsearch_option) {
		this.commsearch_option = commsearch_option;
	}
	public String getCommsearch_content() { 
		return commsearch_content;
	}
	public void setCommsearch_content(String commsearch_content) {
		this.commsearch_content = commsearch_content;
	}
	private String commsearch_option = null;
	private String commsearch_content = null;	
}
