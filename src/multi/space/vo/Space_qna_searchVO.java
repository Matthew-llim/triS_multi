package multi.space.vo;

public class Space_qna_searchVO {
	public Integer space_no;
	public Integer start_no;
	
	public Space_qna_searchVO(){}
	public Integer getSpace_no() {
		return space_no;
	}
	public void setSpace_no(Integer space_no) {
		this.space_no = space_no;
	}
	public Integer getStart_no() {
		return start_no;
	}
	public void setStart_no(Integer start_no) {
		this.start_no = start_no;
	}
	public Space_qna_searchVO(Integer space_no, Integer start_no) {
		super();
		this.space_no = space_no;
		this.start_no = start_no;
	}
}
