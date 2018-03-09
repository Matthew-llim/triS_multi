package multi.admin.vo;

public class AdminSearchVO 
{
	public AdminSearchVO(){}
	public AdminSearchVO(String option, String option2, String content) {
		this.option = option;
		this.option2 = option2;
		this.content = content;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	private String option = null;
	private String option2 = null;
	private String content = null;
}
