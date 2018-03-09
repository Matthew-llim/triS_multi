package multi.admin.vo; 
 
public class Admin_User_Del_EmailVO {
	public Admin_User_Del_EmailVO(){}
	
	
	public Admin_User_Del_EmailVO(String writing_no, String user_id, String user_name, String email, String subject,
			String mail_content, String the_time) {
		this.writing_no = writing_no;
		this.user_id = user_id;
		this.user_name = user_name;
		this.email = email;
		this.subject = subject;
		this.mail_content = mail_content;
		this.the_time = the_time;
	}
	public String getWriting_no() {
		return writing_no;
	}
	public void setWriting_no(String writing_no) {
		this.writing_no = writing_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMail_content() {
		return mail_content;
	}
	public void setMail_content(String mail_content) {
		this.mail_content = mail_content;
	}
	public String getThe_time() {
		return the_time;
	}
	public void setThe_time(String the_time) {
		this.the_time = the_time;
	}
	
	private String writing_no = null;
	private String user_id = null;
	private String user_name = null;
	private String email = null;
	private String subject = null;
	private String mail_content = null;
	private String the_time = null;
}
