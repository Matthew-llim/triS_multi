package multi.admin.controller;
 
import java.util.ArrayList;
import java.util.List; 
import static main.Single.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import main.BeanUtil;
import main.Controller;
import main.ModelAndView;
import main.ModelAttribute;
import main.PaginationDTO;
import main.RequestMapping;
import main.RequestParam;
import main.vo.ClubVO;
import main.vo.Community_boardVO;
import main.vo.HostVO;
import main.vo.SpaceVO;
import multi.admin.dao.Admin_FaqDAO;
import multi.admin.dao.Admin_HostDAO;
import multi.admin.dao.Admin_NoticeDAO;
import multi.admin.dao.Admin_SpaceDAO;
import multi.admin.dao.Admin_UserDAO;
import multi.admin.dao.Admin_o2oQnADAO;
import multi.admin.vo.AdminSearchVO;
import multi.admin.vo.Admin_community_searchVO;
import multi.admin.vo.Admin_search2VO;
import multi.admin.vo.Admin_searchVO;

/* 
물품 관리

물품 관리 리스트 페이지
장소에 따른 판매자 정보 확인 페이지
 */

@Controller
public class Ctrl_Admin_Spaces {
	@Autowired @Qualifier("admin_SpaceDAO")
	private Admin_SpaceDAO admin_SpaceDAO = null;
	
	@Autowired @Qualifier("admin_HostDAO")
	private Admin_HostDAO admin_HostDAO = null;

	// 물품 관리 리스트 페이지
	@RequestMapping("/admin_spaces.do")
	public ModelAndView admin_space( @ModelAttribute SpaceVO svo,
			@ModelAttribute Admin_searchVO search, @RequestParam("pg") String pg ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_spaces");
		
		List<SpaceVO> ls = admin_SpaceDAO.host_spaces_search(search);
		
		PaginationDTO pz = new PaginationDTO().init(pg, ls.size()) ;
		search.setStart_no(pz.getSkip());
		ls = admin_SpaceDAO.host_spaces_search(search);
		mnv.addObject("ls", ls);
		mnv.addObject("pz", pz);
		mnv.addObject("search", search);

		return mnv;
	}

	@RequestMapping("/admin_spaces_search.do")
	public ModelAndView admin_spaces_search( @RequestParam("pg") String pg, 
		@RequestParam("re") String re,
		@RequestParam("option") String field ,
		@RequestParam("option2") String field2 ,
		@RequestParam("content") String keyword ,
		@ModelAttribute Admin_searchVO search,
		HttpSession session ) throws Exception 
	{
		ModelAndView mnv = new ModelAndView("admin_spaces_search");
		if( field.equals("s_category_no") ){
			if(keyword.equals("공부")){
				keyword = "1";
			} else if( keyword.equals("회의") ){
				keyword = "2";
			} else if( keyword.equals("파티") ){
				keyword = "3";
			} else if( keyword.equals("레저") ){
				keyword = "4";
			} else if( keyword.equals("스포츠") ){
				keyword = "5";
			} else if( keyword.equals("기타") ){
				keyword = "6";
			}
		}
		
		if( field.equals("l_category_no") ){
			if(keyword.equals("서울")){
				keyword = "1";
			} else if( keyword.equals("경기") ){
				keyword = "2";
			} else if( keyword.equals("인천") ){
				keyword = "3";
			} else if( keyword.equals("강원") ){
				keyword = "4";
			} else if( keyword.equals("대전") ){
				keyword = "5";
			} else if( keyword.equals("세종") ){
				keyword = "6";
			} else if( keyword.equals("충남") ){
				keyword = "7";
			} else if( keyword.equals("충북") ){
				keyword = "8";
			} else if( keyword.equals("부산") ){
				keyword = "9";
			} else if( keyword.equals("울산") ){
				keyword = "10";
			} else if( keyword.equals("경남") ){
				keyword = "11";
			}  else if( keyword.equals("경북") ){
				keyword = "12";
			} else if( keyword.equals("대구") ){
				keyword = "13";
			} else if( keyword.equals("광주") ){
				keyword = "14";
			} else if( keyword.equals("전남") ){
				keyword = "15";
			} else if( keyword.equals("전북") ){
				keyword = "16";
			} else if( keyword.equals("제주") ){
				keyword = "17";
			} else if( keyword.equals("전국") ){
				keyword = "18";
			}
		}
		
		System.out.println("RE ==> " + re);
		//		STEP 1. 만일 검색후 재검색이 아니면 세션에 혹시 있을 수 있는 검색내역을 제거한다.
		if( re == null || !re.equals("Y") ) {
			session.removeAttribute("club_search");
		}

		//		STEP 2. 세션에 있는 기존의 검색 내용을 가져온다. 없으면 새로이 만든다.   
		List<AdminSearchVO> searchs = (List<AdminSearchVO>)session.getAttribute("club_search");
		if( searchs == null ) {
			searchs = new ArrayList<AdminSearchVO>();
			session.setAttribute( "club_search", searchs );
		}
		//		STEP 3. 검색내역을 세션에 추가한다.
		if( keyword != null && !keyword.equals("") ) {
			searchs.add( new AdminSearchVO( field ,field2, keyword ) );
		}
		
		for( AdminSearchVO vo : searchs){
			System.out.println( ">> " + vo.getOption() + "," + vo.getContent() );
		}

		List<SpaceVO> ls = spring().getBean("sqlSession",SqlSession.class).
			selectList("admin_space_search_All", new Admin_search2VO(searchs) );
		
		PaginationDTO pz = new PaginationDTO().init(pg, ls.size()) ;
		search.setStart_no(pz.getSkip());
		ls = spring().getBean("sqlSession",SqlSession.class).
				selectList("admin_space_search_All", new Admin_search2VO(searchs) );
		mnv.addObject("ls", ls);
		mnv.addObject("pz", pz);
		mnv.addObject("search", search);
		
		return mnv;
	}
	
	// 장소에 따른 판매자 정보 확인 페이지
	@RequestMapping("/admin_host_spaces.do")
	public ModelAndView admin_host_spaces( @ModelAttribute Admin_searchVO search, @RequestParam("pg") String pg) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_host_spaces");
		/*List<SpaceVO> ls = admin_SpaceDAO.findHostPlaces(svo);
		mnv.addObject("ls", ls);*/
		
		List<SpaceVO> ls = admin_SpaceDAO.search_All_specific_host(search);
		PaginationDTO pz = new PaginationDTO().init(pg, ls.size()) ;
		search.setStart_no(pz.getSkip());
		ls = admin_SpaceDAO.search_All_specific_host(search);
		mnv.addObject("ls", ls);
		mnv.addObject("pz", pz);
		mnv.addObject("search", search);
		
		mnv.addObject("crn", search.getCrn() );
		mnv.addObject("host_name", search.getHost_name() );
		return mnv;
	}
	
	// 특정 모임 삭제시 이용. 리다이렉트 시 모임 리스트 확인 페이지
	@RequestMapping("/admin_space_remove.do")
	public ModelAndView admin_space_remove( @ModelAttribute SpaceVO svo ) throws Exception {
		ModelAndView mnv = new ModelAndView();
		admin_SpaceDAO.removeSpace(svo);
		mnv.setViewName("redirect:/admin_spaces.do");
		return mnv;
	}
	
	// 특정 사업자 번호에 관한 정보를 확인 하는 페이지 @ModelAttribute HostVO hvo
	@RequestMapping("/admin_space_crn_check.do")
	public ModelAndView admin_host_space_rooms( @ModelAttribute SpaceVO svo  ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_space_crn_check");
		HostVO vo = admin_SpaceDAO.space_crn_check(svo);
		mnv.addObject("vo", vo);
		return mnv;
	}
	
}