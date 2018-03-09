package multi.mypage.qna.controller;

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
import main.ResponseBody;
import multi.mypage.qna.dao.UserDAO;
import multi.mypage.vo.Mypage_searchVO;
import main.vo.UserVO;
import multi.mypage.qna.dao.Space_qnaDAO;
import main.vo.Space_qnaVO;
import main.vo.Space_qna_repleVO;
import multi.mypage.qna.dao.Space_qna_repleDAO;

@Controller
public class CtrlQnA {

	@Autowired
	@Qualifier("mypage_qna_UserDAO")
	private UserDAO UserDAO = null;

	@Autowired
	@Qualifier("mypage_qna_Space_qnaDAO")
	private Space_qnaDAO Space_qnaDAO = null;

	@Autowired
	@Qualifier("mypage_qna_Space_qna_repleDAO")
	private Space_qna_repleDAO Space_qna_repleDAO = null;

	
	/* 180115수정
	 * 마이페이지_Q&A 페이지 mypage_qna.jsp로 이동.
	 */
	@RequestMapping("/mypage_moveMypageQnAPage.do")
	public ModelAndView moveMypageQnAPage(@CookieValue("user_id") String user_id,
			@ModelAttribute Mypage_searchVO search,
			@RequestParam("pg") String pg) throws Exception {

		UserVO userInfo = UserDAO.find_userInfo(user_id);
		search.setUser_id(user_id);
		//List<Space_qnaVO> qnaInfo = Space_qnaDAO.find_qnaInfo(user_id);

		if (userInfo != null) {
			ModelAndView mnv = new ModelAndView("mypage_qna");
			List<Space_qnaVO> qnaInfo = Space_qnaDAO.search_QnA(search);
			PaginationDTO pz = new PaginationDTO().init(pg, qnaInfo.size());
			search.setStart_no(pz.getSkip());
			qnaInfo = Space_qnaDAO.search_QnA(search);
			
			mnv.addObject("userInfo", userInfo);
			mnv.addObject("pz", pz);
			mnv.addObject("qnaInfo", qnaInfo);
			mnv.addObject("search", search);
			return mnv;
		} else {
			return null;
		}

	}

	/* 180115수정
	 * 마이페이지_Q&A 페이지 에서 해당 내 질문 클릭시 
	 * 내 질문에 대한 reple find함.
	 */
	@RequestMapping("/mypage_getMypageQnAReple.do")
	public ModelAndView getMypageQnAReple(@CookieValue("user_id") String user_id, 
			@RequestParam("space_qna_no") String space_qna_no)
			throws Exception {
		ModelAndView mnv = new ModelAndView("mypage_qna_anwer");
		UserVO userInfo = UserDAO.find_userInfo(user_id);
		Space_qna_repleVO qna_repleInfo = Space_qna_repleDAO.find_qna_repleInfo(space_qna_no);
		Space_qnaVO qnaInfo = Space_qnaDAO.find_qnaByspace_no(space_qna_no);
		
		
		if(qna_repleInfo==null){
			qna_repleInfo = new Space_qna_repleVO();
			qna_repleInfo.setSpace_qna_reple_content("답변내용없음");			
		}
		
		mnv.addObject("space_qna_no", space_qna_no);
		mnv.addObject("userInfo", userInfo);
		mnv.addObject("Space_qna_repleVO", qna_repleInfo);
		mnv.addObject("qnaInfo", qnaInfo);
		return mnv;
	}
	
	@RequestMapping("/del_space_qna.do")
	public String del_space_qna(@RequestParam("space_qna_no") String space_qna_no)throws Exception{
		
		Space_qnaDAO.del_space_qna(space_qna_no);
		
		return "redirect:/mypage_moveMypageQnAPage.do";
	}
}