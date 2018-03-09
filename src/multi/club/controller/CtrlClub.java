package multi.club.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.security.RolesAllowed;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import main.BeanUtil;
import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.PaginationDTO;
import main.RequestMapping;
import main.RequestParam;
import main.ResponseBody;
import main.vo.ClubVO;
import main.vo.MessageVO;
import main.vo.SpaceVO;
import main.vo.UserVO;
import main.vo.User_clubVO;
import multi.club.dao.ClubDAO;
import multi.club.service.BoardPager;
import multi.club.vo.Club_applyVO;
import multi.club.vo.Club_boardVO;
import multi.club.vo.Club_community_listVO;
import multi.club.vo.Club_noticeVO;
import multi.club.vo.Club_searchVO;
import multi.space.vo.Space2VO;

@Controller
public class CtrlClub {

	@Autowired @Qualifier("clubDAO")
	private ClubDAO clubDAO = null;
	
	//모임 페이지 호출
	@RequestMapping("/club_home.do")
	public ModelAndView club_home(@CookieValue("user_id") String user_id) throws Exception {
		ModelAndView mnv = new ModelAndView("club_home");
		List<ClubVO> pvo = clubDAO.club_findAll();
		List<Map<Integer, Object>> lmap = clubDAO.club_find_l_category();
		List<Map<Integer, Object>> cmap = clubDAO.club_find_c_category();
		mnv.addObject("lmap", lmap);
		mnv.addObject("cmap", cmap);
		mnv.addObject("pvo", pvo);
		mnv.addObject("user_id", user_id);
		return mnv;
	}
	
	//모임 리스트 페이지 호출
	@RequestMapping("/club_list.do")
	public ModelAndView club_list(@ModelAttribute Club_searchVO svo, @RequestParam("curPage") String curPage ,@CookieValue("user_id") String user_id) throws Exception {
		ModelAndView mnv = new ModelAndView("club_list");
		// start, end이용해서 데이터 뽑아오기 
		List<Map<String, Object>> vo = clubDAO.club_search(svo);

		// 페이지 레코드의 개수 계산
		// 페이지 나누기 관련 처리
		PaginationDTO pz = new PaginationDTO().init(curPage, vo.size());
		svo.setStart(pz.getSkip());
		vo = clubDAO.club_search(svo);
		
		// 데이터 맵에 저장
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("vo", vo); // vo 저장
		map.put("pz", pz);
		map.put("svo", svo);
		map.put("user_id", user_id);
		mnv.addObject("map", map);
		
		return mnv;
	}
	
	//모임 등록 페이지 호출
	@RequestMapping("/club_add_page.do")
	public ModelAndView club_add_page(@CookieValue("user_id") String user_id) throws Exception {
		ModelAndView mnv = new ModelAndView("club_add_page");
		List<Map<Integer, Object>> lmap = clubDAO.club_find_l_category();
		List<Map<Integer, Object>> cmap = clubDAO.club_find_c_category();
		mnv.addObject("lmap", lmap);
		mnv.addObject("cmap", cmap);
		mnv.addObject("user_id", user_id);
		return mnv;
	}
	//모임 신청
	@RequestMapping("/club_apply.do")
	@ResponseBody
	public String club_apply(HttpServletRequest request) throws Exception {
		Club_applyVO pvo = new Club_applyVO();
		pvo.setUser_id(request.getParameter("user_id"));
		pvo.setClub_no(BeanUtil.pInt(request.getParameter("club_no")));
		pvo.setApply_content(request.getParameter("apply_content"));
		clubDAO.club_add_apply(pvo);
		return String.valueOf(pvo.getFlag());
	}
	
	//모임 등록 실행
	@RequestMapping("/club_add_page_submit.do")
	@ResponseBody
	public String club_add_submit(HttpServletRequest request) throws Exception {
		try{
			//String savePath = "C:\\Users\\student\\git\\msspace_01\\WebContent\\club_img";
			String savePath = request.getServletContext().getRealPath("club_img");
		    int sizeLimit = 1024*1024*15;
		    MultipartRequest mpr = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		    ClubVO pvo = new ClubVO();	      
		    pvo.setClub_name(mpr.getParameter("club_name"));
		    pvo.setClub_title(mpr.getParameter("club_title"));
		    pvo.setMax_member(Integer.parseInt(mpr.getParameter("max_member")));
		    pvo.setClub_content(mpr.getParameter("club_content"));
		    pvo.setClub_thumb_img(mpr.getFilesystemName("club_thumb_img"));
		    pvo.setL_category_no(Integer.parseInt(mpr.getParameter("l_category_no")));
		    pvo.setC_category_no(Integer.parseInt(mpr.getParameter("c_category_no")));
		    pvo.setUser_id(mpr.getParameter("user_id"));
			
			clubDAO.club_add_page_submit(pvo);
			
			return "ok";
		}catch(Exception e){
			e.printStackTrace();
			return e.toString();
		}
	}
	//모임 수정 실행
	@RequestMapping("/club_mod_club_submit.do")
	@ResponseBody
	public String club_mod_club_submit(HttpServletRequest request) throws Exception {
		try{
			//String savePath = "C:\\Users\\student\\git\\msspace_01\\WebContent\\club_img";
			String savePath = request.getServletContext().getRealPath("club_img");
			int sizeLimit = 1024*1024*15;
			MultipartRequest mpr = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
			ClubVO pvo = new ClubVO();	      
			pvo.setClub_name(mpr.getParameter("club_name"));
			pvo.setClub_title(mpr.getParameter("club_title"));
			pvo.setMax_member(Integer.parseInt(mpr.getParameter("max_member")));
			pvo.setClub_content(mpr.getParameter("club_content"));
			pvo.setClub_thumb_img(mpr.getFilesystemName("club_thumb_img"));
			pvo.setL_category_no(Integer.parseInt(mpr.getParameter("l_category_no")));
			pvo.setC_category_no(Integer.parseInt(mpr.getParameter("c_category_no")));
			pvo.setUser_id(mpr.getParameter("user_id"));
			pvo.setClub_no(BeanUtil.pInt(mpr.getParameter("club_no")));
			pvo.setCreate_time(mpr.getParameter("create_time"));
			clubDAO.club_mod_club_submit(pvo);
			
			return "ok";
		}catch(Exception e){
			e.printStackTrace();
			return e.toString();
		}
	}
	//모임 수정
	@RequestMapping("/club_mod_club.do")
	public ModelAndView club_mod_club(@ModelAttribute ClubVO pvo) throws Exception {
		ModelAndView mnv = new ModelAndView("club_mod_club");
		List<Map<Integer, Object>> lmap = clubDAO.club_find_l_category();
		List<Map<Integer, Object>> cmap = clubDAO.club_find_c_category();
		ClubVO vo = clubDAO.club_find_detail(pvo);

		mnv.addObject("lmap", lmap);
		mnv.addObject("cmap", cmap);
		mnv.addObject("vo", vo);
		
		return mnv;
	}
	
	//모임 디테일 페이지 호출
	@RequestMapping("/club_detail.do")
	public ModelAndView club_detail(@CookieValue("user_id") String user_id, @ModelAttribute ClubVO pvo, @RequestParam("flag") int flag ) throws Exception {
		ModelAndView mnv = new ModelAndView("club_detail");
		
		ClubVO vo = clubDAO.club_find_detail(pvo);
		List<SpaceVO> sVO = clubDAO.club_find_detail_space(pvo);
		Club_applyVO club_apply = new Club_applyVO();
		club_apply.setClub_no(pvo.getClub_no());
		club_apply.setUser_id(user_id);
		Club_applyVO club_applyVO = clubDAO.club_find_apply_detail(club_apply);
		mnv.addObject("vo", vo);
		mnv.addObject("sVO", sVO);
		mnv.addObject("flag", club_apply.getFlag());
		mnv.addObject("club_applyVO", club_applyVO);
		mnv.addObject("user_id", user_id);
		
		return mnv;
	}
	
	//모임 커뮤니티 페이지 호출
	@RequestMapping("/club_community.do")
	public ModelAndView club_community(@CookieValue("user_id") String user_id, @RequestParam("cur_notice_page") String cur_notice_page,
			@RequestParam("cur_board_page") String cur_board_page ,  @ModelAttribute ClubVO pvo) throws Exception {
		
		ModelAndView mnv = new ModelAndView("club_community");
		
		ClubVO vo = clubDAO.club_find_detail(pvo);
		String master = clubDAO.club_find_master(pvo);
		
		Club_community_listVO listVO = new Club_community_listVO();
		listVO.setClub_no(pvo.getClub_no());
		/* 공지사항 list 조회 */
		List<Club_noticeVO> noticeVO = clubDAO.club_findAll_notice(listVO);
		// 페이지 나누기 관련 처리(페이지 레코드 계산)
		PaginationDTO notice_pz = new PaginationDTO().init(cur_notice_page, noticeVO.size());
		listVO.setStart(notice_pz.getSkip());
		noticeVO = clubDAO.club_findAll_notice(listVO);
		/* 공지사항 list 조회 */

		/* 일반 게시판 list 조회 */
		listVO.setStart(null);
		List<Club_boardVO> boardVO = clubDAO.club_findAll_board(listVO);
		// 페이지 나누기 관련 처리(페이지 레코드 계산)
		PaginationDTO board_pz = new PaginationDTO().init(cur_board_page, boardVO.size());
		listVO.setStart(board_pz.getSkip());
		boardVO = clubDAO.club_findAll_board(listVO);
		/* 일반 게시판 list 조회 */
		
		List<UserVO> userVO = clubDAO.club_find_community_user(pvo);
		List<Club_applyVO> applyVO = clubDAO.club_find_apply(pvo);

		
		mnv.addObject("vo", vo);
		mnv.addObject("master", master);
		mnv.addObject("noticeVO", noticeVO);
		mnv.addObject("notice_pz", notice_pz);
		mnv.addObject("board_pz", board_pz);
		mnv.addObject("boardVO", boardVO);
		mnv.addObject("userVO", userVO);
		mnv.addObject("applyVO", applyVO);
		mnv.addObject("user_id", user_id);

		return mnv;
	}
	//모임 신청자 수락
	@RequestMapping("/club_apply_agree.do")
	@ResponseBody
	public String club_apply_agree(@ModelAttribute Club_applyVO pvo, HttpServletRequest request) throws Exception {
		try{
			pvo.setApply_content(request.getParameter("club_name")+"모임에 가입되셨습니다");
			clubDAO.club_apply_agree(pvo);
			return String.valueOf(pvo.getFlag());
		}catch(Exception e){
			return "10003";
		}
	}
	//모임 신청자 거절
	@RequestMapping("/club_apply_disagree.do")
	@ResponseBody
	public String club_apply_disagree(HttpServletRequest request) throws Exception {
		Club_applyVO pvo = new Club_applyVO();
		pvo.setClub_no(BeanUtil.pInt(request.getParameter("club_no")));
		pvo.setUser_id(request.getParameter("user_id"));
		pvo.setEtc(request.getParameter("club_name")+" 클럽에서 거절 당하였습니다.");
		try{
			clubDAO.club_apply_disagree(pvo);
			return "ok";
		}catch(Exception e){
			return "no";
		}
	}
	//모임 탈퇴_유저
	@RequestMapping("/club_del_user.do")
	@ResponseBody
	public String club_del_user(@ModelAttribute User_clubVO pvo, @CookieValue("user_id") String user_id) throws Exception {
		try{
			pvo.setUser_id(user_id);
			clubDAO.club_del_user(pvo);
			return "ok";
		}catch(Exception e){
			return "no";
		}
	}
	
	//모임 해체
	@RequestMapping("/club_del_club.do")
	@ResponseBody
	public String club_del_club(@ModelAttribute User_clubVO pvo) throws Exception {
		try{
			clubDAO.club_del_club(pvo);
			return "ok";
		}catch(Exception e){
			return "no";
		}
	}
	
	//쪽지 보내기 팝업 실행
	@RequestMapping("/club_message_popup.do")
	public ModelAndView club_message_popup(@ModelAttribute MessageVO pvo) throws Exception {
		ModelAndView mnv = new ModelAndView("club_message_popup");
		mnv.addObject("vo", pvo);
		return mnv;
	}
	//쪽지 보내기 팝업 실행
	@RequestMapping("/club_add_message.do")
	@ResponseBody
	public String club_add_message(HttpServletRequest request) throws Exception {
		MessageVO pvo = new MessageVO();
		pvo.setMsg_content(request.getParameter("msg_content"));
		pvo.setReceive_user_id(request.getParameter("receive_user_id"));
		pvo.setSend_user_id(request.getParameter("send_user_id"));
		try{
			clubDAO.club_add_message(pvo);
			return "ok";
		}catch(Exception e){
			return "no";
		}
	}
	//모임 회원 방출
	@RequestMapping("/club_user_release.do")
	@ResponseBody
	public String club_user_release(@ModelAttribute Club_applyVO pvo, HttpServletRequest request) throws Exception {
		try{
			pvo.setApply_content(request.getParameter("club_name")+"에서 방출되셨습니다.");
			clubDAO.club_user_release(pvo);
			return "ok";
		}catch(Exception e){
			return "no";
		}
	}
	
	//main.html에 best_club
	@RequestMapping("/best_club.do")
	@ResponseBody
	public String best_club() throws Exception{
		List<Map<String, Object>> list = clubDAO.find_best_club();
		
		StringBuffer sb = new StringBuffer();
		try{
			sb.append("{ 'data' :[ ");
			int flag=0;
			for(Map<String, Object> vo : list){
				flag++;
				sb.append("{");
				sb.append("'club_no'");
				sb.append(":");
				sb.append("'"+vo.get("club_no")+"',");
				sb.append("'club_name'");
				sb.append(":");
				sb.append("'"+vo.get("club_name")+"',");
				sb.append("'club_title'");
				sb.append(":");
				sb.append("'"+vo.get("club_title")+"',");
				sb.append("'club_thumb_img'");
				sb.append(":");
				sb.append("'"+vo.get("club_thumb_img")+"',");
				sb.append("'count'");
				sb.append(":");
				sb.append("'"+vo.get("count")+"'");
				sb.append("}");
				if(flag==list.size()){} 
				else {
					sb.append(",");
				}
			}
			sb.append("]}");
			return sb.toString();
		} catch(Exception e){
			return null;
		}
	}

}