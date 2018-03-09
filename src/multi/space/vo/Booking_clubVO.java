package multi.space.vo;

public class Booking_clubVO {
	Integer booking_no;
	Integer club_no;
	
	public Booking_clubVO(){}

	public Booking_clubVO(Integer booking_no, Integer club_no) {
		super();
		this.booking_no = booking_no;
		this.club_no = club_no;
	}

	public Integer getBooking_no() {
		return booking_no;
	}

	public void setBooking_no(Integer booking_no) {
		this.booking_no = booking_no;
	}

	public Integer getClub_no() {
		return club_no;
	}

	public void setClub_no(Integer club_no) {
		this.club_no = club_no;
	}
	
}
