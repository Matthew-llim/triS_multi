package multi.space.vo;

public class Space_searchVO {
	public Integer l_category_no;
	public Integer s_category_no;
	public Integer search_option;
	public String search_content;
	public Integer start_no;
	
	public Space_searchVO(){}

	public Space_searchVO(Integer l_category_no, Integer s_category_no, Integer search_option, String search_content,Integer start_no) {
		super();
		this.l_category_no = l_category_no;
		this.s_category_no = s_category_no;
		this.search_option = search_option;
		this.search_content = search_content;
		this.start_no = start_no;
	}

	public Integer getStart_no() {
		return this.start_no;
	}

	public void setStart_no(Integer start_no) {
			this.start_no = start_no;
	}

	public Integer getL_category_no() {
		return l_category_no;
	}

	public void setL_category_no(Integer l_category_no) {
		this.l_category_no = l_category_no;
	}

	public Integer getS_category_no() {
		return s_category_no;
	}

	public void setS_category_no(Integer s_category_no) {
		this.s_category_no = s_category_no;
	}

	public Integer getSearch_option() {
		return search_option;
	}

	public void setSearch_option(Integer search_option) {
		this.search_option = search_option;
	}

	public String getSearch_content() {
		return search_content;
	}

	public void setSearch_content(String search_content) {
		this.search_content = search_content;
	}
	
	
	
}
