package multi.mypage.booking.controller;

import java.util.List;
import static main.Single.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.PaginationDTO;
import main.RequestMapping;
import main.RequestParam;
import multi.mypage.booking.dao.BookingDAO;
import multi.mypage.booking.dao.UserDAO;
import multi.mypage.booking.vo.BookingVO;
import multi.mypage.vo.Mypage_searchVO;
import main.vo.SpaceVO;
import main.vo.UserVO;

@Controller
public class CtrlBooking {

	@Autowired
	@Qualifier("mypage_booking_UserDAO")
	private UserDAO UserDAO = null;

	@Autowired
	@Qualifier("mypage_booking_BookingDAO")
	private BookingDAO BookingDAO = null;

	/*
	 * 180115수정 마이페이지에서 내 구매 페이지로 이동. 
	 * user_id 쿠키 값을 통해 userInfo 와 bookingInfo 같이
	 * 보냄
	 */
	@RequestMapping("/mypage_moveMypageBookingPage.do")
	public ModelAndView moveMypageBookingPage(@CookieValue("user_id") String user_id,
			@ModelAttribute Mypage_searchVO search,
			@RequestParam("pg") String pg) throws Exception {
			
		UserVO userInfo = UserDAO.find_userInfo(user_id);
		//List<BookingVO> bookingInfo = BookingDAO.find_bookingInfo(user_id);

		if (userInfo != null) {
			ModelAndView mnv = new ModelAndView("mypage_booking");
			search.setUser_id(user_id);
			List<BookingVO> bookingInfo = BookingDAO.search_bookings(search);
			
			PaginationDTO pz = new PaginationDTO().init(pg, bookingInfo.size());
			search.setStart_no(pz.getSkip());
			bookingInfo = BookingDAO.search_bookings(search);
			
			mnv.addObject("userInfo", userInfo);
			mnv.addObject("bookingInfo", bookingInfo);
			mnv.addObject("search", search);
			mnv.addObject("pz", pz);
			return mnv;
		} else {
			return null;
		}
	}

	
	/* 180115수정
	 * 내 구매 페이지에서 space_no 클릭시 해당 space 상세보기 페이지로 이동
	 */
	@RequestMapping("/mypage_moveSpaceinfo.do")
	public ModelAndView moveSpaceinfo(@ModelAttribute SpaceVO svo) throws Exception {

		ModelAndView mnv = new ModelAndView("space_info");
		mnv.addObject("space_no", svo.getSpace_no());
		return mnv;

	}

}