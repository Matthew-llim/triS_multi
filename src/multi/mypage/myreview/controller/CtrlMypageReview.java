package multi.mypage.myreview.controller;

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
import main.vo.ReviewVO;
import multi.mypage.myreview.dao.MPReviewDAO;
import multi.mypage.vo.Mypage_searchVO;

/**
 * @author sb 마이페이지 리뷰
 */
@Controller
public class CtrlMypageReview {

	@Autowired
	@Qualifier("MPreviewDAO")
	private MPReviewDAO MPreviewDAO = null;

	// 전체 후기 뿌려오기
	@RequestMapping("/mypage_review_findAll.do")
	public ModelAndView PMreview_findAll(@CookieValue("user_id") String user_id, @ModelAttribute Mypage_searchVO search,
			@RequestParam("pg") String pg) throws Exception {

		ModelAndView mnv = new ModelAndView("mypage_review_findAll2");
		// List<ReviewVO> rl = MPreviewDAO.review_findAll(user_id);
		search.setUser_id(user_id);
		List<ReviewVO> rl = MPreviewDAO.search_reviews(search);
		PaginationDTO pz = new PaginationDTO().init(pg, rl.size());
		search.setStart_no(pz.getSkip());
		rl = MPreviewDAO.search_reviews(search);

		mnv.addObject("rl", rl);
		mnv.addObject("pz", pz);
		mnv.addObject("search", search);

		return mnv;
	}

}
