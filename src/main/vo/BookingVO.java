package main.vo;

public class BookingVO {
	public Integer booking_no;
	public Integer space_no;
	public String user_id;
	public String du_time;
	public String booking_date;
	public String start_time;
	public String end_time;
	public Integer booking_people;
	public Integer booking_price;
	public Integer club_no;
	public String booking_user_name;
	public String booking_phone;
	public String booking_email;
	public String booking_message;
	public Integer club_list;
	
	public Integer getClub_list() {
		return club_list;
	}



	public void setClub_list(Integer club_list) {
		this.club_list = club_list;
	}



	public BookingVO(Integer booking_no, Integer space_no, String user_id, String du_time, String booking_date,
			String start_time, String end_time, Integer booking_people, Integer booking_price, Integer club_no,
			String booking_user_name, String booking_phone, String booking_email, String booking_message,Integer club_list) {
		super();
		this.club_list = club_list;
		this.booking_no = booking_no;
		this.space_no = space_no;
		this.user_id = user_id;
		this.du_time = du_time;
		this.booking_date = booking_date;
		this.start_time = start_time;
		this.end_time = end_time;
		this.booking_people = booking_people;
		this.booking_price = booking_price;
		this.club_no = club_no;
		this.booking_user_name = booking_user_name;
		this.booking_phone = booking_phone;
		this.booking_email = booking_email;
		this.booking_message = booking_message;
	}



	public String getBooking_user_name() {
		return booking_user_name;
	}



	public void setBooking_user_name(String booking_user_name) {
		this.booking_user_name = booking_user_name;
	}



	public String getBooking_phone() {
		return booking_phone;
	}



	public void setBooking_phone(String booking_phone) {
		this.booking_phone = booking_phone;
	}



	public String getBooking_email() {
		return booking_email;
	}



	public void setBooking_email(String booking_email) {
		this.booking_email = booking_email;
	}



	public String getBooking_message() {
		return booking_message;
	}



	public void setBooking_message(String booking_message) {
		this.booking_message = booking_message;
	}



	public BookingVO(){}


	public Integer getBooking_no() {
		return booking_no;
	}

	public void setBooking_no(Integer booking_no) {
		this.booking_no = booking_no;
	}

	public Integer getSpace_no() {
		return space_no;
	}

	public void setSpace_no(Integer space_no) {
		this.space_no = space_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getDu_time() {
		return du_time;
	}

	public void setDu_time(String du_time) {
		this.du_time = du_time;
	}

	public String getBooking_date() {
		return booking_date;
	}

	public void setBooking_date(String booking_date) {
		this.booking_date = booking_date;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public Integer getBooking_people() {
		return booking_people;
	}

	public void setBooking_people(Integer booking_people) {
		this.booking_people = booking_people;
	}

	public Integer getBooking_price() {
		return booking_price;
	}

	public void setBooking_price(Integer booking_price) {
		this.booking_price = booking_price;
	}

	public Integer getClub_no() {
		return club_no;
	}

	public void setClub_no(Integer club_no) {
		this.club_no = club_no;
	}	
	
	
	
}
