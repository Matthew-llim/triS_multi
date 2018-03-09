package multi.event.vo;

public class Event_searchVO {
	
	public Event_searchVO(Integer eve_option, String eve_key) {
		
		this.setEve_option(eve_option);
		this.setEve_key(eve_key);
	}
	
	public Integer getEve_option() {
		return eve_option;
	}
	public void setEve_option(Integer eve_option) {
		this.eve_option = eve_option;
	}

	public String getEve_key() {
		return eve_key;
	}

	public void setEve_key(String eve_key) {
		this.eve_key = eve_key;
	}

	private Integer eve_option = null;
	private String eve_key = null;
}
