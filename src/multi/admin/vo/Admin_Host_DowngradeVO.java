package multi.admin.vo; 
 
public class Admin_Host_DowngradeVO {
	public Admin_Host_DowngradeVO(){}
	
	private String crn = null;
	public Admin_Host_DowngradeVO(String crn, String user_id, String host_name, String host_account, String zipcode,
			String account_name, String msg_no, String send_user_id, String receive_user_id, String msg_content,
			String the_time, String view_count) {
		this.crn = crn;
		this.user_id = user_id;
		this.host_name = host_name;
		this.host_account = host_account;
		this.zipcode = zipcode;
		this.account_name = account_name;
		this.msg_no = msg_no;
		this.send_user_id = send_user_id;
		this.receive_user_id = receive_user_id;
		this.msg_content = msg_content;
		this.the_time = the_time;
		this.view_count = view_count;
	}
	public String getCrn() {
		return crn;
	}
	public void setCrn(String crn) {
		this.crn = crn;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getHost_name() {
		return host_name;
	}
	public void setHost_name(String host_name) {
		this.host_name = host_name;
	}
	public String getHost_account() {
		return host_account;
	}
	public void setHost_account(String host_account) {
		this.host_account = host_account;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAccount_name() {
		return account_name;
	}
	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}
	public String getMsg_no() {
		return msg_no;
	}
	public void setMsg_no(String msg_no) {
		this.msg_no = msg_no;
	}
	public String getSend_user_id() {
		return send_user_id;
	}
	public void setSend_user_id(String send_user_id) {
		this.send_user_id = send_user_id;
	}
	public String getReceive_user_id() {
		return receive_user_id;
	}
	public void setReceive_user_id(String receive_user_id) {
		this.receive_user_id = receive_user_id;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	public String getThe_time() {
		return the_time;
	}
	public void setThe_time(String the_time) {
		this.the_time = the_time;
	}
	public String getView_count() {
		return view_count;
	}
	public void setView_count(String view_count) {
		this.view_count = view_count;
	}

	private String user_id = null;
	private String host_name = null;
	private String host_account = null;
	private String zipcode = null;
	private String account_name = null;
	private String msg_no = null;
	private String send_user_id = null;
	private String receive_user_id = null;
	private String msg_content = null;
	private String the_time = null;
	private String view_count = null;
}
