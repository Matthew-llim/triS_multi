package multi.club.vo;

public class Club_searchVO {
	//기본 생성자 생성
	public Club_searchVO() {}
	
	//프로퍼티 선언
	private Integer l_category_no;
	private Integer c_category_no;
	private Integer search_option;
	private String search_content;
	private Integer start;
	private Integer end;
	
	//setter & getter
	public Integer getL_category_no() {
		return l_category_no;
	}
	public void setL_category_no(Integer l_category_no) {
		this.l_category_no = l_category_no;
	}
	public Integer getC_category_no() {
		return c_category_no;
	}
	public void setC_category_no(Integer c_category_no) {
		this.c_category_no = c_category_no;
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
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getEnd() {
		return end;
	}
	public void setEnd(Integer end) {
		this.end = end;
	}
	

}
