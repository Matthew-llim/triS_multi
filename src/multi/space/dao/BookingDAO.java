package multi.space.dao;

import java.util.List;

import main.vo.BookingVO;
import multi.space.vo.Booking_clubVO;

public interface BookingDAO {
	public Integer add_booking(BookingVO vo) throws Exception;
	public List<BookingVO> find_booking_by_space_no_and_booking_date(BookingVO booking) throws Exception; 
}
