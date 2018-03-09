package main.vo;

public class HostApplyVO {
	public Integer host_apply_no;
	public String crn;
	public String user_id;
	public String host_name;
	public String host_account;
	public String account_name;
	public String etc;

	public HostApplyVO() {
	}

	public HostApplyVO(Integer host_apply_no, String crn, String user_id, String host_name, String host_account,
			String account_name, String etc) {
		super();
		this.host_apply_no = host_apply_no;
		this.crn = crn;
		this.user_id = user_id;
		this.host_name = host_name;
		this.host_account = host_account;
		this.account_name = account_name;
		this.etc = etc;
	}

	public Integer getHost_apply_no() {
		return host_apply_no;
	}

	public void setHost_apply_no(Integer host_apply_no) {
		this.host_apply_no = host_apply_no;
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

	public String getAccount_name() {
		return account_name;
	}

	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

}