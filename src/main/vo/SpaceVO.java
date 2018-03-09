package main.vo;

public class SpaceVO {
	public Integer getSpace_no() {
		return space_no;
	}
	public void setSpace_no(Integer space_no) {
		this.space_no = space_no;
	}
	public String getCrn() {
		return crn;
	}
	public void setCrn(String crn) {
		this.crn = crn;
	}
	public String getSpace_title() {
		return space_title;
	}
	public void setSpace_title(String space_title) {
		this.space_title = space_title;
	}
	public String getSpace_content() {
		return space_content;
	}
	public void setSpace_content(String space_content) {
		this.space_content = space_content;
	}
	public String getSpace_thumb_img() {
		return space_thumb_img;
	}
	public void setSpace_thumb_img(String space_thumb_img) {
		this.space_thumb_img = space_thumb_img;
	}
	public String getOpen_time() {
		return open_time;
	}
	public void setOpen_time(String open_time) {
		this.open_time = open_time;
	}
	public String getClose_time() {
		return close_time;
	}
	public void setClose_time(String close_time) {
		this.close_time = close_time;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getMax_people() {
		return max_people;
	}
	public void setMax_people(Integer max_people) {
		this.max_people = max_people;
	}
	public Integer getMin_people() {
		return min_people;
	}
	public void setMin_people(Integer min_people) {
		this.min_people = min_people;
	}
	public String getSpace_call() {
		return space_call;
	}
	public void setSpace_call(String space_call) {
		this.space_call = space_call;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public Integer getL_category_no() {
		return l_category_no;
	}
	public void setL_category_no(Integer l_category_no) {
		this.l_category_no = l_category_no;
	}
	public String getThe_time() {
		return the_time;
	}
	public void setThe_time(String the_time) {
		this.the_time = the_time;
	}
	public Integer space_no;
	public String crn;
	public String space_title;
	public String space_content;
	public String space_thumb_img;
	public String open_time;
	public String close_time;
	public Integer price;
	public Integer max_people;
	public Integer min_people;
	public String space_call;
	public String zipcode;
	public Integer s_category_no;
	public Double latitude;
	public Double longitude;
	public SpaceVO(Integer space_no, String crn, String space_title, String space_content, String space_thumb_img,
			String open_time, String close_time, Integer price, Integer max_people, Integer min_people,
			String space_call, String zipcode, Integer s_category_no, Double latitude, Double longitude,
			Integer l_category_no, String the_time) {
		super();
		this.space_no = space_no;
		this.crn = crn;
		this.space_title = space_title;
		this.space_content = space_content;
		this.space_thumb_img = space_thumb_img;
		this.open_time = open_time;
		this.close_time = close_time;
		this.price = price;
		this.max_people = max_people;
		this.min_people = min_people;
		this.space_call = space_call;
		this.zipcode = zipcode;
		this.s_category_no = s_category_no;
		this.latitude = latitude;
		this.longitude = longitude;
		this.l_category_no = l_category_no;
		this.the_time = the_time;
	}
	public Double getLatitude() {
		return latitude;
	}
	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
	public Double getLongitude() {
		return longitude;
	}
	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}
	public Integer getS_category_no() {
		return s_category_no;
	}
	public void setS_category_no(Integer s_category_no) {
		this.s_category_no = s_category_no;
	}
	public Integer l_category_no;
	public String the_time;
	public SpaceVO(){}
	
}
