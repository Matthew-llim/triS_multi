package multi.mypage.booking.dao;

import java.util.List;

import multi.mypage.booking.vo.BookingVO;
import multi.mypage.vo.Mypage_searchVO;
import main.vo.UserVO;

public interface BookingDAO {

	public UserVO find_userInfo(String user_id) throws Exception;
	public List<BookingVO> find_bookingInfo(String user_id) throws Exception;
	public List<BookingVO> search_bookings(Mypage_searchVO search) throws Exception;
}
