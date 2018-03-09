package multi.club.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.http.parser.HttpParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.BeanUtil;
import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.ResponseBody;
import main.vo.ClubVO;
import multi.club.dao.ClubDAO;
import multi.club.vo.Club_board_repleVO;
import multi.club.vo.Club_noticeVO;
import multi.club.vo.Club_notice_repleVO;

@Controller
public class CtrlClub_notice {

	@Autowired @Qualifier("clubDAO")
	private ClubDAO clubDAO = null;
	
	//모임 커뮤니티 공지사항 작성 페이지 호출
	@RequestMapping("/club_add_community_notice.do")
	public ModelAndView club_add_community_notice(@CookieValue("user_id") String user_id, @ModelAttribute ClubVO pvo) throws Exception {
		ModelAndView mnv = new ModelAndView("club_add_community_notice");
		mnv.addObject("club_no", pvo.getClub_no());
		mnv.addObject("user_id", user_id);
		return mnv;
	}
	
	//모임 커뮤니티 공지사항 작성
	@RequestMapping("/club_add_community_notice_submit.do")
	@ResponseBody
	public String club_add_community_notice_submit(HttpServletRequest request) throws Exception {
		Club_noticeVO pvo = new Club_noticeVO();
		pvo.setC_notice_title(request.getParameter("c_notice_title"));
		pvo.setC_notice_content(request.getParameter("c_notice_content"));
		pvo.setClub_no(BeanUtil.pInt(request.getParameter("club_no")));
		pvo.setUser_id(request.getParameter("user_id"));
		
		try{
			clubDAO.club_add_community_notice_submit(pvo);
			return "ok";
		}catch(Exception e){
			return "no";
		}
	}
	
	//모임 커뮤니티 공지사항 디테일 페이지 호출
	@RequestMapping("/club_notice_detail.do")
	public ModelAndView club_notice_detail(@CookieValue("user_id") String user_id, @ModelAttribute Club_noticeVO pvo) throws Exception {
		ModelAndView mnv = new ModelAndView("club_notice_detail");
		//공지사항 디테일 조회
		Club_noticeVO vo = clubDAO.club_find_notice_detail(pvo);
		
		//리플 리스트 조회
		List<Club_notice_repleVO> reVO = clubDAO.club_find_notice_reple(pvo);

		mnv.addObject("vo", vo);
		mnv.addObject("reVO", reVO);
		mnv.addObject("user_id", user_id);
		return mnv;
	}
	
	//모임 공지사항 수정 페이지 호출
	@RequestMapping("/club_mod_notice_detail.do")
	public ModelAndView club_mod_notice_detail(@ModelAttribute Club_noticeVO pvo) throws Exception {
		ModelAndView mnv = new ModelAndView("club_mod_notice_detail");
		Club_noticeVO vo = clubDAO.club_find_notice_detail(pvo);
		mnv.addObject("vo", vo);
		return mnv;
	}
	//모임 공지사항 수정
	@RequestMapping("/club_mod_notice_detail_submit.do")
	@ResponseBody
	public String club_mod_notice_detail_submit(HttpServletRequest request) throws Exception {
		Club_noticeVO pvo = new Club_noticeVO();
		pvo.setC_notice_no(BeanUtil.pInt(request.getParameter("c_notice_no")));
		pvo.setC_notice_title(request.getParameter("c_notice_title"));
		pvo.setC_notice_content(request.getParameter("c_notice_content"));
		try{
			clubDAO.club_mod_notice_detail(pvo);
			return "ok";
		}catch(Exception e){
			return "no";
		}
	}
	//모임 공지사항 삭제
	@RequestMapping("/club_del_notice_detail.do")
	@ResponseBody
	public String club_del_notice_detail(@ModelAttribute Club_noticeVO pvo) throws Exception {
		try{
			clubDAO.club_del_notice_detail(pvo);
			return "ok";
			
		}catch(Exception e){
			return "no";
		}
	}
	
	//모임 커뮤니티 게시판 댓글 조회
	@RequestMapping("/club_find_notice_reple.do")
	@ResponseBody
	public String club_find_reple(@ModelAttribute Club_noticeVO pvo) throws Exception {
		List<Club_notice_repleVO> reVO = clubDAO.club_find_notice_reple(pvo);
		
		StringBuffer sb = null;
		try{
			for (Club_notice_repleVO vo : reVO) {
				if (sb == null) {
					sb = new StringBuffer();
			        sb.append("{data:[");
			} else {
				sb.append(",");
			}
			sb.append("{'user_id' :'").append(vo.getUser_id()).append("', 'c_notice_reple_content' : '").append(vo.getC_notice_reple_content())
			.append("', 'the_time' : '").append(vo.getThe_time()).append("', 'c_notice_no' : '").append(vo.getC_notice_no()).append("', 'c_notice_reple_no' : '")
			.append(vo.getC_notice_reple_no()).append("'}");
			
			}
			sb.append("]}");
			return sb.toString();
		}catch(Exception e){
			return null;
		}
		
	}
		
	//모임 커뮤니티 공지사항 댓글 작성
	@RequestMapping("/club_add_notice_reple.do")
	@ResponseBody
	public String club_add_notice_reple(HttpServletRequest request) throws Exception {
		Club_notice_repleVO pvo = new Club_notice_repleVO();
		pvo.setC_notice_reple_content(request.getParameter("c_notice_reple_content"));
		pvo.setUser_id(request.getParameter("user_id"));
		pvo.setC_notice_no(BeanUtil.pInt(request.getParameter("c_notice_no")));
		try{
			clubDAO.club_add_notice_reple(pvo);
			return "ok";
		}catch(Exception e){
			return "no";
		}
	}
	//모임 커뮤니티 공지사항 댓글 삭제
	@RequestMapping("/club_del_notice_reple.do")
	@ResponseBody
	public String club_del_notice_reple(@ModelAttribute Club_notice_repleVO pvo) throws Exception {
		try{
			clubDAO.club_del_notice_reple(pvo);
			return "ok";
		}catch(Exception e){
			return "no";
		}
	}
	
	//모임 커뮤니티 공지사항 댓글 수정
	@RequestMapping("/club_mod_notice_reple.do")
	@ResponseBody
	public String club_mod_notice_reple(HttpServletRequest request) throws Exception {
		Club_notice_repleVO pvo = new Club_notice_repleVO();
		pvo.setC_notice_reple_no(BeanUtil.pInt(request.getParameter("c_notice_reple_no")));
		pvo.setC_notice_reple_content(request.getParameter("c_notice_reple_content"));
		try{
			clubDAO.club_mod_notice_reple(pvo);
			return "ok";
		}catch(Exception e){
			return "no";
		}
	}
	
}
