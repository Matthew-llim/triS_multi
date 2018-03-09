package multi.admin.vo;

import java.util.List;

public class Admin_search2VO {
	private List<AdminSearchVO> list = null;
	
	public Admin_search2VO(){}
	public Admin_search2VO(List<AdminSearchVO> list) {
		this.list = list;
	}

	public List<AdminSearchVO> getList() {
		return list;
	}

	public void setList(List<AdminSearchVO> list) {
		this.list = list;
	}
}
