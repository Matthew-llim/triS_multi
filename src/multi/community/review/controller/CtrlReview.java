package multi.community.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.ModelAndView;
import main.PaginationDTO;
import main.RequestMapping;
import main.RequestParam;
import main.vo.ReviewVO;
import multi.admin.dao.Admin_ReviewDAO;
import multi.community.review.dao.Community_board_reviewDAO;


@Controller
public class CtrlReview {
	
	@Autowired 	@Qualifier("community_board_reviewDAO")
	private Community_board_reviewDAO community_board_reviewDAO = null;
	
	@RequestMapping("/community_review_list.do")
	public ModelAndView community_review_list(@RequestParam("cur_page") String cur_page) throws Exception{
		
		ModelAndView mnv = new ModelAndView("community_review_list");
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", null);
		List<ReviewVO> rl = community_board_reviewDAO.review_findAll(map);
		PaginationDTO board_pz = new PaginationDTO().init(cur_page, rl.size());
		map.put("start", board_pz.getSkip());
		rl = community_board_reviewDAO.review_findAll(map);
		
		mnv.addObject("rl", rl);
		mnv.addObject("board_pz", board_pz);
		return mnv;
	}

}
