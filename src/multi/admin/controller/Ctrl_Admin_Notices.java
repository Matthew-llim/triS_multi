package multi.admin.controller;
 
import java.util.List; 
import static main.Single.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import main.Controller;
import main.ModelAndView;
import main.ModelAttribute;
import main.PaginationDTO;
import main.RequestMapping;
import main.RequestParam;
import main.vo.NoticeVO;
import multi.admin.dao.Admin_FaqDAO;
import multi.admin.dao.Admin_HostDAO;
import multi.admin.dao.Admin_NoticeDAO;
import multi.admin.dao.Admin_SpaceDAO;
import multi.admin.dao.Admin_UserDAO;
import multi.admin.dao.Admin_o2oQnADAO;
import multi.admin.vo.Admin_searchVO;


/* 
공지사항 관리

공지사항 리스트 확인하기
공지사항 하나 읽기
공지사항 추가 페이지
공지사항 추가시 이용. 리다이렉트 시 공지사항 리스트 확인하기 페이지
공지사항 수정 페이지. 특정 공지사항 클릭시 정보 받아들임.
공지사항 수정 처리. 리다이렉트로 특정 공지사항 읽기 페이지 전달
공지사항 삭제. 리다이렉트 시 공지사항 리스트 확인하기 페이지
 */

@Controller
public class Ctrl_Admin_Notices {
	@Autowired @Qualifier("admin_NoticeDAO")
	private Admin_NoticeDAO admin_NoticeDAO = null;
	
	// 공지사항 리스트 확인하기
	@RequestMapping("/admin_notice_list.do")
	public ModelAndView textList(@ModelAttribute Admin_searchVO search, @RequestParam("pg") String pg) throws Exception {
		ModelAndView mnv=new ModelAndView("admin_notice_list");
		//List<NoticeVO> rl = admin_NoticeDAO.findAll();
		//mnv.addObject("rl",rl);
		List<NoticeVO> rl = admin_NoticeDAO.search_All(search);
		PaginationDTO pz = new PaginationDTO().init(pg, rl.size()) ;
		search.setStart_no(pz.getSkip());
		rl = admin_NoticeDAO.search_All(search);
		mnv.addObject("rl", rl);
		mnv.addObject("pz", pz);
		mnv.addObject("search", search);
		
		return mnv;
	}
	// 공지사항 하나 읽기
	@RequestMapping("/admin_notice_read.do")
	public ModelAndView textRead(@ModelAttribute NoticeVO pvo) throws Exception {
		
		NoticeVO vo = admin_NoticeDAO.findByPK(pvo);
		ModelAndView mnv=new ModelAndView("admin_notice_read");
		mnv.addObject("vo",vo);

		return mnv;
	}
	// 공지사항 추가 페이지
	@RequestMapping("/admin_notice_add.do")
	public ModelAndView textAdd(@ModelAttribute NoticeVO pvo) throws Exception {
		ModelAndView mnv=new ModelAndView("admin_notice_add");
		return mnv;
	}
	// 공지사항 추가시 이용. 리다이렉트 시 공지사항 리스트 확인하기 페이지
	@RequestMapping("/admin_notice_add2.do")
	public String textAdd2(@ModelAttribute NoticeVO pvo) throws Exception {
		admin_NoticeDAO.add(pvo);
		return "redirect:/admin_notice_list.do";
	}
	// 공지사항 수정 페이지. 특정 공지사항 클릭시 정보 받아들임.
	@RequestMapping("/admin_notice_mod.do")
	public ModelAndView mod(@ModelAttribute NoticeVO pvo) throws Exception {
		ModelAndView mnv=new ModelAndView("admin_notice_mod");
		mnv.addObject("vo", pvo);
		return mnv;
	}
	// 공지사항 수정 처리. 리다이렉트로 특정 공지사항 읽기 페이지 전달
	@RequestMapping("/admin_notice_mod2.do")
	public String mod2(@ModelAttribute NoticeVO pvo) throws Exception {
		
		admin_NoticeDAO.mod(pvo);
		return "redirect:/admin_notice_read.do?notice_no="+pvo.getNotice_no();
	}
	// 공지사항 삭제. 리다이렉트 시 공지사항 리스트 확인하기 페이지
	@RequestMapping("/admin_notice_del.do")
	public String del(@ModelAttribute NoticeVO pvo) throws Exception {
		admin_NoticeDAO.delByPK(pvo);
		return "redirect:/admin_notice_list.do";
	}
	
}