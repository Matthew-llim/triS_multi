package multi.admin.controller;
 
import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.ModelAndView;
import main.ModelAttribute;
import main.PaginationDTO;
import main.RequestMapping;
import main.RequestParam;
import main.vo.ClubVO;
import main.vo.SpaceVO;
import main.vo.UserVO;
import main.vo.User_clubVO;
import multi.admin.dao.Admin_ClubDAO;
import multi.admin.vo.Admin_searchVO;

/* 
모임 관리

모임 리스트 확인 페이지
특정 모임 삭제시 이용. 리다이렉트 시 모임 리스트 확인 페이지
특정 모임 정보를 확인하는 페이지
 */

@Controller
public class Ctrl_Admin_Clubs {
	@Autowired @Qualifier("admin_ClubDAO")
	private Admin_ClubDAO admin_ClubDAO = null;
	
	// 모임 리스트 확인 페이지
	@RequestMapping("/admin_clubs.do")
	public ModelAndView admin_clubs( @RequestParam("pg") String pg,
			@ModelAttribute Admin_searchVO search ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_clubs");
		/* List<ClubVO> ls = admin_ClubDAO.findAllClub(); 
		@ModelAttribute Admin_searchVO search */
		
		List<ClubVO> ls = admin_ClubDAO.club_search(search);
		PaginationDTO pz = new PaginationDTO().init(pg, ls.size()) ;
		search.setStart_no(pz.getSkip());
		ls = admin_ClubDAO.club_search(search);
		mnv.addObject("ls", ls);
		mnv.addObject("pz", pz);
		mnv.addObject("search", search);

		return mnv;
	}
	@RequestMapping("/admin_clubs_search.do")
	public ModelAndView admin_clubs_search( @ModelAttribute Admin_searchVO search, @RequestParam("pg") String pg) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_clubs_search");
		String field = search.getSearch_option(); 
		String keyword = search.getSearch_content();
		if( field.equals("5") ){
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
		if( field.equals("6") ){
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
		System.out.println(field);
		System.out.println(keyword);
		search.setSearch_content(keyword);
		
		List<ClubVO> ls = admin_ClubDAO.club_search(search);
		PaginationDTO pz = new PaginationDTO().init(pg, ls.size()) ;
		search.setStart_no(pz.getSkip());
		ls = admin_ClubDAO.club_search(search);
		mnv.addObject("ls", ls);
		mnv.addObject("pz", pz);
		mnv.addObject("search", search);

		return mnv;
	}
	
	// 특정 모임 삭제시 이용. 리다이렉트 시 모임 리스트 확인 페이지
	@RequestMapping("/admin_club_remove.do")
	public ModelAndView admin_club_remove( @ModelAttribute ClubVO cvo ) throws Exception {
		ModelAndView mnv = new ModelAndView();
		admin_ClubDAO.removeClub(cvo);
		mnv.setViewName("redirect:/admin_clubs.do");
		return mnv;
	}
	// 특정 모임 정보를 확인하는 페이지
	@RequestMapping("/admin_club_detail.do")
	public ModelAndView admin_club_detail( @ModelAttribute ClubVO cvo, @ModelAttribute User_clubVO uvo ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_club_detail");
		ClubVO vo = admin_ClubDAO.check_specific_Club(cvo);
		List<User_clubVO> ls = admin_ClubDAO.check_joined_Users(cvo);
		mnv.addObject("vo", vo);
		mnv.addObject("ls", ls);
		return mnv;
	}
	
	
	
	
}