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
import main.vo.FaqVO;
import multi.admin.dao.Admin_FaqDAO;
import multi.admin.dao.Admin_HostDAO;
import multi.admin.dao.Admin_NoticeDAO;
import multi.admin.dao.Admin_SpaceDAO;
import multi.admin.dao.Admin_UserDAO;
import multi.admin.dao.Admin_o2oQnADAO;
import multi.admin.vo.Admin_searchVO;

/* 
FAQ 관리

FAQ 리스트 확인하는 페이지
특정 FAQ을 읽는 페이지
특정 FAQ을 수정 시 처리. 리다이렉트 시 FAQ 리스트 확인하는 페이지
특정 FAQ을 삭제 시 이용. 리다이렉트 시 FAQ 리스트 확인하는 페이지
FAQ 추가 페이지
FAQ 추가 시 처리. 리다이렉트 시 FAQ 리스트 확인하는 페이지
 */

@Controller
public class Ctrl_Admin_FAQ {
	@Autowired @Qualifier("admin_FaqDAO")
	private Admin_FaqDAO admin_FaqDAO = null;
		
	// FAQ 리스트 확인하는 페이지
	@RequestMapping("/admin_faq.do")
	public ModelAndView admin_faq(@ModelAttribute Admin_searchVO search, @RequestParam("pg") String pg) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_faq");
		/*List<FaqVO> rl = admin_FaqDAO.findAll();
		mnv.addObject("rl", rl);*/
		List<FaqVO> rl = admin_FaqDAO.search_All(search);
		PaginationDTO pz = new PaginationDTO().init(pg, rl.size()) ;
		search.setStart_no(pz.getSkip());
		rl = admin_FaqDAO.search_All(search);
		mnv.addObject("rl", rl);
		mnv.addObject("pz", pz);
		mnv.addObject("search", search);
		return mnv;
	}
	// 특정 FAQ을 읽는 페이지
	@RequestMapping("/admin_faq_read.do")
	public ModelAndView admin_faq_read( @ModelAttribute FaqVO fvo ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_faq_read");
		FaqVO vo = admin_FaqDAO.faq_read(fvo);
		mnv.addObject("vo", vo);
		return mnv;
	}
	// 특정 FAQ을 수정 시 처리. 리다이렉트 시 FAQ 리스트 확인하는 페이지
	@RequestMapping("/admin_faq_mod.do")
	public ModelAndView admin_faq_mod( @ModelAttribute FaqVO fvo ) throws Exception {
		ModelAndView mnv = new ModelAndView();
		admin_FaqDAO.faq_modify(fvo);
		mnv.setViewName("redirect:/admin_faq.do");
		return mnv;
	}
	// 특정 FAQ을 삭제 시 이용. 리다이렉트 시 FAQ 리스트 확인하는 페이지
	@RequestMapping("/admin_faq_remove.do")
	public ModelAndView admin_faq_remove( @ModelAttribute FaqVO fvo ) throws Exception {
		ModelAndView mnv = new ModelAndView();
		i(fvo.getFaq_no());
		admin_FaqDAO.faq_remove(fvo);
		mnv.setViewName("redirect:/admin_faq.do");
		return mnv;
	}
	// FAQ 추가 페이지
	@RequestMapping("/admin_faq_add.do")
	public ModelAndView admin_faq_add( ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_faq_add");
		return mnv;
	}
	// FAQ 추가 시 처리. 리다이렉트 시 FAQ 리스트 확인하는 페이지
	@RequestMapping("/admin_faq_add2.do")
	public ModelAndView admin_faq_add2( @ModelAttribute FaqVO fvo ) throws Exception {
		ModelAndView mnv = new ModelAndView();
		admin_FaqDAO.faq_add(fvo);
		mnv.setViewName("redirect:/admin_faq.do");
		return mnv;
	}
	
}