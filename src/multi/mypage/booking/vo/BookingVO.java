package multi.mypage.booking.vo;

public class BookingVO {

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


	public BookingVO(Integer booking_no, Integer space_no, String user_id, String du_time, String booking_date,
			String start_time, String end_time, Integer booking_people, Integer booking_price, Integer club_no,
			String booking_user_name, String booking_phone, String booking_email, String booking_message) {
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

	public BookingVO() {

	}
	
	private Integer booking_no = null;
	private Integer space_no = null;
	private String user_id = null;
	private String du_time = null;
	private String booking_date = null;
	private String start_time = null;
	private String end_time = null;	
	private Integer booking_people = null;		
	private Integer booking_price = null;		
	private Integer club_no = null;
	private String booking_user_name = null;		
	private String booking_phone = null;	
	private String booking_email = null;		
	private String booking_message = null;	



}
