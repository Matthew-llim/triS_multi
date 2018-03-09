package multi.space.vo;

public class ImageVO {
	public Integer image_no;
	public Integer space_no;
	public String image_one;
	public String image_two;
	public String image_three;
	public String image_four;
	public String image_five;
	public String image_six;
	public String image_seven;
	
	public ImageVO(){}

	public ImageVO(Integer image_no, Integer space_no, String image_one, String image_two, String image_three,
			String image_four, String image_five, String image_six, String image_seven) {
		super();
		this.image_no = image_no;
		this.space_no = space_no;
		this.image_one = image_one;
		this.image_two = image_two;
		this.image_three = image_three;
		this.image_four = image_four;
		this.image_five = image_five;
		this.image_six = image_six;
		this.image_seven = image_seven;
	}

	public Integer getImage_no() {
		return image_no;
	}

	public void setImage_no(Integer image_no) {
		this.image_no = image_no;
	}

	public Integer getSpace_no() {
		return space_no;
	}

	public void setSpace_no(Integer space_no) {
		this.space_no = space_no;
	}

	public String getImage_one() {
		return image_one;
	}

	public void setImage_one(String image_one) {
		this.image_one = image_one;
	}

	public String getImage_two() {
		return image_two;
	}

	public void setImage_two(String image_two) {
		this.image_two = image_two;
	}

	public String getImage_three() {
		return image_three;
	}

	public void setImage_three(String image_three) {
		this.image_three = image_three;
	}

	public String getImage_four() {
		return image_four;
	}

	public void setImage_four(String image_four) {
		this.image_four = image_four;
	}

	public String getImage_five() {
		return image_five;
	}

	public void setImage_five(String image_five) {
		this.image_five = image_five;
	}

	public String getImage_six() {
		return image_six;
	}

	public void setImage_six(String image_six) {
		this.image_six = image_six;
	}

	public String getImage_seven() {
		return image_seven;
	}

	public void setImage_seven(String image_seven) {
		this.image_seven = image_seven;
	}
	
}
