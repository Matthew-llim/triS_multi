package multi.space.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import main.CaptchaUtil;
import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.RequestParam;
import main.ResponseBody;
import main.vo.BookingVO;
import main.vo.BookmarkVO;
import main.vo.ClubVO;
import main.vo.HostVO;
import main.vo.ReviewVO;
import main.vo.SpaceVO;
import main.vo.Space_qnaVO;
import main.vo.Space_qna_repleVO;
import main.vo.UserVO;
import main.vo.ZipcodeVO;
import multi.space.PaginationDTO_review;
import multi.space.PaginationDTO_space;
import multi.space.dao.BookingDAO;
import multi.space.dao.BookmarkDAO;
import multi.space.dao.HostDAO;
import multi.space.dao.ReviewDAO;
import multi.space.dao.SpaceDAO;
import multi.space.dao.Space_QnADAO;
import multi.space.dao.Space_QnA_RepleDAO;
import multi.space.dao.UserDAO;
import multi.space.vo.Booking_clubVO;
import multi.space.vo.ImageVO;
import multi.space.vo.Review_searchVO;
import multi.space.vo.Space2VO;
import multi.space.vo.Space_qna_searchVO;
import multi.space.vo.Space_searchVO;

@Controller
public class CtrlSpace {
	//테스트
	public Integer StringToInteger(String str){
		return Integer.parseInt(str);
	}
	
	@Autowired @Qualifier("space_spaceDAO")
	public SpaceDAO spaceDAO = null;
	
	@Autowired @Qualifier("space_bookingDAO")
	public BookingDAO bookingDAO = null;
	
	@Autowired @Qualifier("space_space_QnADAO")
	public Space_QnADAO space_QnADAO = null;
	
	@Autowired @Qualifier("space_space_QnA_RepleDAO")
	public Space_QnA_RepleDAO space_QnA_RepleDAO = null;
	
	@Autowired @Qualifier("space_reviewDAO")
	public ReviewDAO reviewDAO = null;
	
	@Autowired @Qualifier("space_userDAO")
	public UserDAO userDAO = null;
	
	@Autowired @Qualifier("space_hostDAO")
	public HostDAO hostDAO = null;
	
	@Autowired @Qualifier("space_bookmarkDAO")
	public BookmarkDAO bookmarkDAO = null;
	

	//main.html
	@RequestMapping("/best_space.do")
	@ResponseBody
	public String find_best_space() throws Exception{
		List<Space2VO> list = spaceDAO.find_best_space();
		
		StringBuffer sb = new StringBuffer();
		sb.append("{ 'data' :[ ");
		int flag=0;
		for(Space2VO space : list){
			flag++;
			sb.append("{");
			sb.append("'space_title'");
			sb.append(":");
			sb.append("'"+space.getSpace_title()+"',");
			sb.append("'price'");
			sb.append(":");
			sb.append("'"+space.getPrice()+"',");
			sb.append("'count'");
			sb.append(":");
			sb.append("'"+space.getCount()+"',");
			sb.append("'space_img'");
			sb.append(":");
			sb.append("'"+space.getSpace_thumb_img()+"',");
			sb.append("'space_no'");
			sb.append(":");
			sb.append("'"+space.getSpace_no()+"'");
			sb.append("}");
			if(flag==list.size()){
				
			} else {
				sb.append(",");
			}
		}
		sb.append("]}");
		return sb.toString();
	}
	
	//main.html
		@RequestMapping("/best_space2.do")
		@ResponseBody
		public String find_best_space2() throws Exception{
			List<Space2VO> list = spaceDAO.find_best_space2();
			StringBuffer sb = new StringBuffer();
			sb.append("{ 'data' :[ ");
			int flag=0;
			for(Space2VO space : list){
				flag++;
				sb.append("{");
				sb.append("'space_title'");
				sb.append(":");
				sb.append("'"+space.getSpace_title()+"',");
				sb.append("'price'");
				sb.append(":");
				sb.append("'"+space.getPrice()+"',");
				sb.append("'count'");
				sb.append(":");
				sb.append("'"+space.getCount()+"',");
				sb.append("'space_img'");
				sb.append(":");
				sb.append("'"+space.getSpace_thumb_img()+"',");
				sb.append("'space_no'");
				sb.append(":");
				sb.append("'"+space.getSpace_no()+"'");
				sb.append("}");
				if(flag==list.size()){
					
				} else {
					sb.append(",");
				}
			}
			sb.append("]}");
			return sb.toString();
		}
	
	//공간 첫화면
	@RequestMapping("/space_home.do")
	public ModelAndView space_home(@RequestParam("space_code") String space_code,@CookieValue("user_id") String user_id) throws Exception {
		ModelAndView mnv = new ModelAndView("space_home");
		List<Map<Integer,String>> local_list = spaceDAO.find_l_category();
		List<Map<Integer,String>> category_list = spaceDAO.find_s_category();
		UserVO user2 = userDAO.find_user_by_user_id(user_id);
		
		mnv.addObject("space_code", space_code);
		mnv.addObject("local_list", local_list);
		mnv.addObject("category_list", category_list);
		mnv.addObject("user", user2);
		return mnv;
	}
	
	//공간 첫화면 아이프레임
	@RequestMapping("/space_home_iframe.do")
	public ModelAndView space_home_iframe(@ModelAttribute Space_searchVO search,@RequestParam("pg") String pg) throws Exception {
		ModelAndView mnv = new ModelAndView("space_home_iframe");
		List<SpaceVO> list2 = spaceDAO.search_space(search); // 찾고자 하는 게시판의 전체 글 갯수를 가져와야합니다.
		/*
		 * 처음 시작에는 검색이 되지 않은 전체 글 갯수가 리턴됩니당. 100개 글이면 처음 들어갈 땐 검색이 없기 때문에 100개가 리턴됨.
		 */
		PaginationDTO_space pz = new PaginationDTO_space().init(pg, list2.size()) ;
		/* pg값은 현재 페이지를 뜻합니다!
		 * 처음 시작에는 pg 값이 없기 때문에 PaginationDTO에서 pg값이 null일 경우 1로 만들어주기 때문에 현재 페이지 1로 페이지네이션이 시작됩니다.
		 * 
		 */
		search.setStart_no(pz.getSkip());
		list2 = spaceDAO.search_space(search);
		List<Map<Integer,String>> local_list = spaceDAO.find_l_category();
		
		
		mnv.addObject("list2", list2);
		mnv.addObject("pz", pz); // 페이지네이션을 심어줍니다!
		mnv.addObject("search", search);
		mnv.addObject("local_list", local_list);
		return mnv;
	}
	
	
	//공간 등록 페이지
	@RequestMapping("/space_add.do")
	public ModelAndView space_add(@CookieValue("user_id") String user_id) throws Exception{
		if(user_id==null || user_id.length()<=1){
			ModelAndView mnv = new ModelAndView("redirect:/home_moveLoginPage.do");
			return mnv;
		}
		UserVO user2 = userDAO.find_user_by_user_id(user_id);
		List<HostVO> host = hostDAO.find_host_by_user_id(user_id);
		
		//등급이 판매자가 아니면 홈화면으로 돌려보냄
		if(user2.getGrade()!=2){
			ModelAndView mnv = new ModelAndView("redirect:/space_home.do?space_code=20007");
			return mnv;
		}
		
		ModelAndView mnv = new ModelAndView("space_add");
		List<Map<Integer,String>> local_list = spaceDAO.find_l_category();
		List<Map<Integer,String>> category_list = spaceDAO.find_s_category();
		
		mnv.addObject("local_list", local_list);
		mnv.addObject("category_list", category_list);
		mnv.addObject("host", host);
		return mnv;
	}
	
	//공간 등록 작업
	@RequestMapping("/space_add2.do")
	public ModelAndView space_add2(HttpServletRequest request,@CookieValue("user_id") String user_id) throws Exception{
		ModelAndView mnv = new ModelAndView("redirect:/space_add_clear.jsp");
		String thumbnailSavePath = request.getServletContext().getRealPath("space_img");
		//String thumbnailSavePath = "C:\\Users\\student\\git\\msspace_01\\WebContent\\space_img";
		int sizeLimit = 1024*1024*15;
		MultipartRequest mpr = new MultipartRequest(request, thumbnailSavePath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());
		
		
		SpaceVO vo = new SpaceVO();
		
		String crn = mpr.getParameter("crn");
		String space_title = mpr.getParameter("space_title");
		String space_content = mpr.getParameter("space_content");
		String space_thumb_img = mpr.getFilesystemName("space_thumb_img");

		String open_time = mpr.getParameter("open_time");
		
		String close_time= mpr.getParameter("close_time");
		
		String price_str = mpr.getParameter("price");
		Integer price = StringToInteger(price_str);
		
		String min_people_str = mpr.getParameter("min_people");
		Integer min_people = StringToInteger(min_people_str);
		
		String max_people_str = mpr.getParameter("max_people");
		Integer max_people = StringToInteger(max_people_str);
		
		String space_call = mpr.getParameter("space_call");
		String s_category_no_str = mpr.getParameter("s_category_no");
		Integer s_category_no = StringToInteger(s_category_no_str);
		String zipcode=mpr.getParameter("zipcode");
		
		String l_category_no_str = mpr.getParameter("l_category_no");
		Integer l_category_no = StringToInteger(l_category_no_str);
		
		String latitude_str = mpr.getParameter("latitude");
		Double latitude = Double.valueOf(latitude_str);
		String longitude_str = mpr.getParameter("longitude");
		Double longitude = Double.valueOf(longitude_str);
		
		
		if(min_people==null){
			min_people=0;
		}
		if(max_people == null){
			max_people=0;
		}
		if(space_call == null){
			//나중에 자기 연락처로 지정되게 바꿔야함
			space_call="01029927762";
		}
		
		vo.setCrn(crn); vo.setSpace_title(space_title); vo.setSpace_content(space_content); vo.setSpace_thumb_img(space_thumb_img); vo.setOpen_time(open_time);
		vo.setClose_time(close_time); vo.setPrice(price); vo.setMin_people(min_people); vo.setMax_people(max_people); vo.setSpace_call(space_call);
		vo.setS_category_no(s_category_no); vo.setL_category_no(l_category_no);vo.setZipcode(zipcode);vo.setLatitude(latitude);vo.setLongitude(longitude);
		spaceDAO.add_space(vo);
		
		ImageVO image = new ImageVO();
		Integer space_no = spaceDAO.find_space_no();

		image.setImage_one(mpr.getFilesystemName("image_one"));
		image.setImage_two(mpr.getFilesystemName("image_two"));
		image.setImage_three(mpr.getFilesystemName("image_three"));
		image.setImage_four(mpr.getFilesystemName("image_four"));
		image.setImage_five(mpr.getFilesystemName("image_five"));
		image.setImage_six(mpr.getFilesystemName("image_six"));
		image.setImage_seven(mpr.getFilesystemName("image_seven"));
		image.setSpace_no(space_no);
		spaceDAO.add_space_image(image);
		
		return mnv;
	}
	
	//공간 삭제
	@RequestMapping("/space_del.do")
	public String space_del(@ModelAttribute SpaceVO spaceVO) throws Exception{
		spaceDAO.del_space_by_space_no(spaceVO);
		return "redirect:/space_home.do?space_code=20006";
	}
	
	//공간 수정
	@RequestMapping("/space_mod.do")
	public ModelAndView space_mod(@ModelAttribute SpaceVO spaceVO) throws Exception{
		ModelAndView mnv = new ModelAndView("space_mod");
		List<Map<Integer,String>> local_list = spaceDAO.find_l_category();
		List<Map<Integer,String>> category_list = spaceDAO.find_s_category();
		
		mnv.addObject("local_list", local_list);
		mnv.addObject("category_list", category_list);
		mnv.addObject("space", spaceVO);
		return mnv;
	}
	
	//공간 수정
		@RequestMapping("/space_mod2.do")
		public ModelAndView space_mod2(@ModelAttribute SpaceVO spaceVO) throws Exception{

			spaceDAO.mod_space(spaceVO);
			ModelAndView mnv = new ModelAndView("redirect:/space_detail.do?space_no="+spaceVO.getSpace_no());
			return mnv;
		}
	
		//리뷰 
	@RequestMapping("/review.do")
	public ModelAndView review_find_by_space_no(@RequestParam("pg") String pg,@ModelAttribute Review_searchVO review,@CookieValue("user_id") String user_id,@RequestParam("space_code") String space_code) throws Exception{
		ModelAndView mnv = new ModelAndView("review_iframe");
		List<ReviewVO> list_review = reviewDAO.find_review_by_space_no(review);
		PaginationDTO_review pz_review =new PaginationDTO_review().init(pg, list_review.size());
		review.setStart_no(pz_review.getSkip());
		list_review = reviewDAO.find_review_by_space_no(review);
		mnv.addObject("list_review", list_review);
		mnv.addObject("pz_review", pz_review);
		mnv.addObject("space_no", review.getSpace_no());
		mnv.addObject("user_id", user_id);
		mnv.addObject("space_code", space_code);
		return mnv;
	}
	//qna 
	@RequestMapping("/space_qna.do")
	public ModelAndView qna_find_by_space_no(@RequestParam("pg") String pg,@ModelAttribute Space_qna_searchVO space_qna,@CookieValue("user_id") String user_id,@RequestParam("space_code") String space_code) throws Exception{
		ModelAndView mnv = new ModelAndView("space_qna_iframe");
		List<Space_qnaVO> list_space_qna = space_QnADAO.find_space_QnA_by_space_no(space_qna);
		PaginationDTO_review pz_space_qna =new PaginationDTO_review().init(pg, list_space_qna.size());
		space_qna.setStart_no(pz_space_qna.getSkip());
		list_space_qna = space_QnADAO.find_space_QnA_by_space_no(space_qna);
		mnv.addObject("list_space_qna", list_space_qna);
		mnv.addObject("pz_space_qna", pz_space_qna);
		mnv.addObject("space_no", space_qna.getSpace_no());
		mnv.addObject("user_id", user_id);
		mnv.addObject("space_code", space_code);
		return mnv;
	}
		
	//공간 상세
	@RequestMapping("/space_detail.do")
	public ModelAndView space_detail_find_by_pk(@ModelAttribute ImageVO image, @ModelAttribute SpaceVO spaceVO,@ModelAttribute Review_searchVO review,@ModelAttribute Space_qna_searchVO space_qna,
			@ModelAttribute BookmarkVO bookmark, @CookieValue("user_id") String user_id,@RequestParam("space_code") String space_code,@RequestParam("pg_review") String pg_review,@RequestParam("pg_qna") String pg_qna
			,HttpServletRequest request,@RequestParam("review_flag") String review_flag,@RequestParam("qna_flag") String qna_flag
			,@RequestParam("review_flag_imsi") String review_flag_imsi,@RequestParam("qna_flag_imsi") String qna_flag_imsi) throws Exception{
		ModelAndView mnv = new ModelAndView("space_detail");
		ImageVO image2 = spaceDAO.find_image_by_space_no(image);
		SpaceVO space = spaceDAO.find_space_by_pk(spaceVO);
		String s_category = spaceDAO.find_s_category_by_space_no(spaceVO);
		String l_category = spaceDAO.find_l_category_by_space_no(spaceVO);

		List<HostVO> host = hostDAO.find_host_by_user_id(user_id);
		
		bookmark.setUser_id(user_id);
		BookmarkVO return_bookmark = bookmarkDAO.find_bookmark(bookmark);
		
		//리뷰 페이지네이션,뽑아오기
		List<ReviewVO> list_review = reviewDAO.find_review_by_space_no(review);
		PaginationDTO_review pz_review =new PaginationDTO_review().init(pg_review, list_review.size());
		review.setStart_no(pz_review.getSkip());
		list_review = reviewDAO.find_review_by_space_no(review);
		
		//qna 페이지네이션,뽑아오기
		List<Space_qnaVO> list_space_qna = space_QnADAO.find_space_QnA_by_space_no(space_qna);
		PaginationDTO_review pz_space_qna =new PaginationDTO_review().init(pg_qna, list_space_qna.size());
		space_qna.setStart_no(pz_space_qna.getSkip());
		list_space_qna = space_QnADAO.find_space_QnA_by_space_no(space_qna);
		
		mnv.addObject("list_space_qna", list_space_qna);
		mnv.addObject("pz_space_qna", pz_space_qna);
		mnv.addObject("list_review", list_review);
		mnv.addObject("pz_review", pz_review);
		mnv.addObject("bookmark", return_bookmark);
		mnv.addObject("space", space);
		mnv.addObject("user_id", user_id);
		mnv.addObject("space_code", space_code);
		mnv.addObject("s_category", s_category);
		mnv.addObject("l_category", l_category);
		mnv.addObject("host", host);
		mnv.addObject("image", image2);
		mnv.addObject("review_flag", review_flag);
		mnv.addObject("qna_flag", qna_flag);
		mnv.addObject("review_flag_imsi", review_flag_imsi);
		mnv.addObject("qna_flag_imsi", qna_flag_imsi);
		return mnv;
	}
	
	//공간 상세 노 헤더
	@RequestMapping("/space_detail_no_header.do")
	public ModelAndView space_detail_no_header_find_by_pk(@ModelAttribute ImageVO image, @ModelAttribute SpaceVO spaceVO,@ModelAttribute Review_searchVO review,@ModelAttribute Space_qna_searchVO space_qna,
			@ModelAttribute BookmarkVO bookmark, @CookieValue("user_id") String user_id,@RequestParam("space_code") String space_code,@RequestParam("pg_review") String pg_review,@RequestParam("pg_qna") String pg_qna
			,HttpServletRequest request,@RequestParam("review_flag") String review_flag,@RequestParam("qna_flag") String qna_flag
			,@RequestParam("review_flag_imsi") String review_flag_imsi,@RequestParam("qna_flag_imsi") String qna_flag_imsi) throws Exception{
		ModelAndView mnv = new ModelAndView("space_detail_no_header");
		ImageVO image2 = spaceDAO.find_image_by_space_no(image);
		SpaceVO space = spaceDAO.find_space_by_pk(spaceVO);
		String s_category = spaceDAO.find_s_category_by_space_no(spaceVO);
		String l_category = spaceDAO.find_l_category_by_space_no(spaceVO);
		
		List<HostVO> host = hostDAO.find_host_by_user_id(user_id);
		
		bookmark.setUser_id(user_id);
		BookmarkVO return_bookmark = bookmarkDAO.find_bookmark(bookmark);
		
		//리뷰 페이지네이션,뽑아오기
		List<ReviewVO> list_review = reviewDAO.find_review_by_space_no(review);
		PaginationDTO_review pz_review =new PaginationDTO_review().init(pg_review, list_review.size());
		review.setStart_no(pz_review.getSkip());
		list_review = reviewDAO.find_review_by_space_no(review);
		
		//qna 페이지네이션,뽑아오기
		List<Space_qnaVO> list_space_qna = space_QnADAO.find_space_QnA_by_space_no(space_qna);
		PaginationDTO_review pz_space_qna =new PaginationDTO_review().init(pg_qna, list_space_qna.size());
		space_qna.setStart_no(pz_space_qna.getSkip());
		list_space_qna = space_QnADAO.find_space_QnA_by_space_no(space_qna);
		
		mnv.addObject("list_space_qna", list_space_qna);
		mnv.addObject("pz_space_qna", pz_space_qna);
		mnv.addObject("list_review", list_review);
		mnv.addObject("pz_review", pz_review);
		mnv.addObject("bookmark", return_bookmark);
		mnv.addObject("space", space);
		mnv.addObject("user_id", user_id);
		mnv.addObject("space_code", space_code);
		mnv.addObject("s_category", s_category);
		mnv.addObject("l_category", l_category);
		mnv.addObject("host", host);
		mnv.addObject("image", image2);
		mnv.addObject("review_flag", review_flag);
		mnv.addObject("qna_flag", qna_flag);
		mnv.addObject("review_flag_imsi", review_flag_imsi);
		mnv.addObject("qna_flag_imsi", qna_flag_imsi);
		return mnv;
	}
	
	//공간 예약
	@RequestMapping("/space_reservation.do")
	public ModelAndView space_reseravtion_find_by_pk(@ModelAttribute SpaceVO spaceVO,@CookieValue("user_id") String user_id,@ModelAttribute BookingVO bookingVO) throws Exception{
	/*	if(user_id==null || user_id.length()<=1){
			ModelAndView mnv = new ModelAndView("redirect:/home_moveLoginPage.do");
			return mnv;
		
		}*/
		
		ModelAndView mnv = new ModelAndView("space_reservation");
		
		//오늘날짜로 될 수 있도록 수정합시다.
		Calendar currentDate = Calendar.getInstance();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate = df.format(currentDate.getTime());
		bookingVO.setBooking_date(sysdate);
		
		List<BookingVO> booking_list = bookingDAO.find_booking_by_space_no_and_booking_date(bookingVO);

		SpaceVO space = spaceDAO.find_space_by_pk(spaceVO);
		List<ClubVO> club_list = spaceDAO.find_user_club(user_id);
		for(ClubVO A : club_list ) {
			System.out.println(A.getClub_name());
			System.out.println(A.getClub_no());
		}
		mnv.addObject("club_list", club_list);			
		mnv.addObject("space", space);
		mnv.addObject("user_id", user_id);
		mnv.addObject("booking_list", booking_list);
		return mnv;
	}
	
	//공간 결제 페이지
	@RequestMapping("/space_payment.do")
	public ModelAndView space_payment(@RequestParam("club_list") Integer club_list,@ModelAttribute BookingVO bookingVO,@ModelAttribute SpaceVO spaceVO,@CookieValue("user_id") String user_id) throws Exception{
		if(user_id==null || user_id.length()<=1 ){
			ModelAndView mnv = new ModelAndView("redirect:/home_moveLoginPage.do");
			return mnv;
		}

		System.out.println(club_list);
		ModelAndView mnv = new ModelAndView("space_payment");
		SpaceVO space = spaceDAO.find_space_by_pk(spaceVO);
		HostVO host = spaceDAO.find_host_by_space_no(spaceVO);
		mnv.addObject("host", host);
		mnv.addObject("space", space);
		mnv.addObject("booking", bookingVO);
		mnv.addObject("club_list", club_list);
		return mnv;
	}
	
	//공간 결제 완료 페이지
	@RequestMapping("/space_payment_clear.do")
	public ModelAndView space_payment_clear(@ModelAttribute SpaceVO spaceVO,@ModelAttribute BookingVO bookingVO,@CookieValue("user_id") String user_id) throws Exception{
		ModelAndView mnv = new ModelAndView("space_payment_clear");
		
		System.out.println(bookingVO.getClub_list());
		HostVO host = spaceDAO.find_host_by_space_no(spaceVO);
		bookingDAO.add_booking(bookingVO);
		SpaceVO space = spaceDAO.find_space_by_pk(spaceVO);

		mnv.addObject("booking", bookingVO);
		mnv.addObject("user_id", user_id);
		mnv.addObject("space", space);
		mnv.addObject("host", host);
		return mnv;
	}
	
	//space qna등록
	@RequestMapping("/add_space_qna.do")
	public String add_space_qna(@ModelAttribute Space_qnaVO space_QnAVO,@CookieValue("user_id") String user_id) throws Exception{
		if(user_id==null || user_id.length()<=1 ){
			return "redirect:/home_moveLoginPage.do";
		}
		space_QnADAO.add_spaceQnA(space_QnAVO);
		return "redirect:/space_detail.do?space_no="+space_QnAVO.getSpace_no()+"&space_code=20006&qna_flag_imsi=1";
	}
	
	//space qna삭제
	@RequestMapping("/delete_space_qna.do")
	public String delete_space_qna(@ModelAttribute Space_qnaVO space_QnAVO,@CookieValue("user_id") String user_id) throws Exception{
		if(user_id==null|| user_id.length()<=1){
			return "redirect:/home_moveLoginPage.do";
		}
		
		Space_qnaVO qna = space_QnADAO.find_space_QnA_by_space_qna_no(space_QnAVO);
		if(user_id.equals(qna.getUser_id())) {
			space_QnADAO.delete_spaceQnA_by_spane_qna_no(space_QnAVO);
			space_QnA_RepleDAO.delete_spaceQnA_by_space_qna_no(space_QnAVO);
			return "redirect:/space_detail.do?space_no="+space_QnAVO.getSpace_no()+"&space_code=20005&qna_flag_imsi=1";
			
		}
		return "redirect:/space_detail.do?space_no="+qna.getSpace_no()+"&space_code=20001&qna_flag_imsi=1";
	}
	
	//qna 수정
	@RequestMapping("/mod_space_qna.do")
	public String mod_space_qna(@ModelAttribute Space_qnaVO space_QnAVO,@CookieValue("user_id") String user_id) throws Exception{
		if(user_id==null|| user_id.length()<=1){
			return "redirect:/home_moveLoginPage.do";
		}
		Space_qnaVO qna = space_QnADAO.find_space_QnA_by_space_qna_no(space_QnAVO);
		if(user_id.equals(qna.getUser_id())) {
			space_QnADAO.mod_spaceQnA_by_spane_qna_no(space_QnAVO);
			return "redirect:/space_detail.do?space_no="+space_QnAVO.getSpace_no()+"&space_code=20004&qna_flag_imsi=1";
			
		}
		return "redirect:/space_detail.do?space_no="+qna.getSpace_no()+"&space_code=20001&qna_flag_imsi=1";
	}
	
	//space reple 등록
	@RequestMapping("/add_space_qna_reple.do")
	public String add_space_qna_reple(@ModelAttribute Space_qna_repleVO space_QnA_RepleVO,@CookieValue("user_id") String user_id) throws Exception{
		if(user_id==null|| user_id.length()<=1){
			return "redirect:/home_moveLoginPage.do";
		}
		space_QnA_RepleDAO.add_space_QnA_Reple_by_space_qna_no(space_QnA_RepleVO);
		return "redirect:/space_detail.do?space_no="+space_QnA_RepleVO.getSpace_no()+"&qna_flag_imsi=1";
	}
	
	//qna_replw 뿌려주는 ajax
	@RequestMapping("/find_space_qna_reple.do")
	@ResponseBody
	public String find_space_qna_reple(@ModelAttribute Space_qna_repleVO space_QnA_RepleVO) throws Exception{
		Space_qna_repleVO space_qna_reple = space_QnA_RepleDAO.find_space_QnA_Reple(space_QnA_RepleVO);
		try{
		String qna_reple = 
				" { 'qna_reple_content' :'"+ space_qna_reple.getSpace_qna_reple_content()+"'}";
			return qna_reple;
		} catch( Exception e ) {return null;}	
	}
	
	
	//후기 작성
		@RequestMapping("/review_add.do")
		public ModelAndView add_review(@ModelAttribute ReviewVO reviewVO,@CookieValue("user_id") String user_id) throws Exception{
			if(user_id==null|| user_id.length()<=1){
				ModelAndView mnv = new ModelAndView("redirect:/home_moveLoginPage.do");
				return mnv;
			}
			ModelAndView mnv = new ModelAndView("review_add");
			mnv.addObject("review", reviewVO);
			return mnv;
		}
		
		
	//후기 추가
	@RequestMapping("/review_add2.do")
	public String add_review2(HttpServletRequest request) throws Exception{
		String savePath = request.getServletContext().getRealPath("review_img");
		//String savePath = "C:\\Users\\student\\git\\msspace_01\\WebContent\\review_img";
		int sizeLimit = 1024*1024*15;
		MultipartRequest mpr = new MultipartRequest(request, savePath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());
		
		String review_title = mpr.getParameter("review_title");
		
		String review_content = mpr.getParameter("review_content");
		
		String user_id = mpr.getParameter("user_id");
		
		String space_no_str = mpr.getParameter("space_no");
		Integer space_no = Integer.parseInt(space_no_str);
		
		String review_score_str = mpr.getParameter("review_score");
		Double review_score = Double.parseDouble(review_score_str);
		
		String review_img = mpr.getFilesystemName("review_img");
		
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setReview_title(review_title);
		reviewVO.setReview_content(review_content);
		reviewVO.setUser_id(user_id);
		reviewVO.setSpace_no(space_no);
		reviewVO.setReview_img(review_img);
		reviewVO.setReview_score(review_score);
		reviewDAO.add_review(reviewVO);
		return "redirect:/space_detail.do?space_no="+reviewVO.getSpace_no()+"&space_code=20003&review_flag_imsi=1";
	}
	
	//후기 삭제
	@RequestMapping("/del_review.do")
	public String del_review(@ModelAttribute ReviewVO reviewVO,@CookieValue("user_id") String user_id) throws Exception{
		if(user_id==null|| user_id.length()<=1){
			return "redirect:/home_moveLoginPage.do";
		}
		ReviewVO review = reviewDAO.find_review_by_review_no(reviewVO);
		if(user_id.equals(review.getUser_id())) {
			reviewDAO.del_review(reviewVO);
			return "redirect:/space_detail.do?space_no="+reviewVO.getSpace_no()+"&space_code=20002&review_flag_imsi=1";
		}
		return "redirect:/space_detail.do?space_no="+reviewVO.getSpace_no()+"&space_code=20001&review_flag_imsi=1";
		
	}
	
	//북마크 등록
	@RequestMapping("/add_bookmark.do")
	@ResponseBody
	public String add_bookmark(@ModelAttribute BookmarkVO bookmark) throws Exception{
		bookmarkDAO.add_bookmark(bookmark);
		return null;
	}
	
	//북마크 해제
	@RequestMapping("/del_bookmark.do")
	@ResponseBody
	public String del_bookmark(@ModelAttribute BookmarkVO bookmark) throws Exception{
		bookmarkDAO.del_bookmark(bookmark);
		return null;
	}
		
	@RequestMapping("/reserve_change_day.do")
	@ResponseBody
	public String reserve_change_day(@ModelAttribute BookingVO bookingVO) throws Exception{
		List<BookingVO> booking_list = bookingDAO.find_booking_by_space_no_and_booking_date(bookingVO);
		StringBuffer sb = new StringBuffer();
		sb.append("{ 'data' :[ ");
		int flag=0;
		for(BookingVO booking : booking_list){
			flag++;
			sb.append("{");
			sb.append("'start_time'");
			sb.append(":");
			sb.append("'"+booking.getStart_time()+"',");
			sb.append("'end_time'");
			sb.append(":");
			sb.append("'"+booking.getEnd_time()+"'");
			sb.append("}");
			if(flag==booking_list.size()){
				
			} else {
				sb.append(",");
			}
		}
		sb.append("]}");
		return sb.toString();
	}
	
	
}