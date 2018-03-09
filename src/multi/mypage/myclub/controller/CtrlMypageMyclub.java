package multi.mypage.myclub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.PaginationDTO;
import main.RequestMapping;
import main.RequestParam;
import main.vo.ClubVO;
import multi.mypage.myclub.dao.MyclubDAO;
import multi.mypage.vo.Mypage_searchVO;

/**
 * @author sb 마이페이지 내 클럽
 */
@Controller
public class CtrlMypageMyclub {

	@Autowired
	@Qualifier("myclubDAO")
	private MyclubDAO myclubDAO;

	//내 클럽 목록 찾기
	@RequestMapping("/myclub_findAll.do")
	public ModelAndView findMyclub(@CookieValue("user_id") String user_id, @ModelAttribute Mypage_searchVO search,
			@RequestParam("pg") String pg) throws Exception {

		ModelAndView mnv = new ModelAndView("myclub_findAll2");
		// List<ClubVO> rl = myclubDAO.find_myClub(user_id);
		search.setUser_id(user_id);

		List<ClubVO> rl = myclubDAO.search_clubs(search);
		PaginationDTO pz = new PaginationDTO().init(pg, rl.size());
		search.setStart_no(pz.getSkip());
		rl = myclubDAO.search_clubs(search);

		mnv.addObject("rl", rl);
		mnv.addObject("pz", pz);
		mnv.addObject("search", search);
		return mnv;
	}
}
