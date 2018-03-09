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
import main.ResponseBody;
import main.vo.MessageVO;
import multi.admin.dao.Admin_MessageDAO;
import multi.admin.vo.Admin_searchVO;


/* 
메시지 관리

// 메시지 보내기 작성 페이지
특정 모임 삭제시 이용. 리다이렉트 시 모임 리스트 확인 페이지
특정 모임 정보를 확인하는 페이지
 */

@Controller
public class Ctrl_Admin_Message {
	@Autowired @Qualifier("admin_MessageDAO")
	private Admin_MessageDAO admin_MessageDAO = null;
	
	// 메시지 보내기 작성 페이지
	@RequestMapping("/admin_message_write.do")
	public ModelAndView admin_message_write( ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_message_write");
		
		return mnv;
	}
	
	// 메시지 보내기
	@RequestMapping("/admin_writing_message.do")
	@ResponseBody
	public String admin_writing_message( @ModelAttribute MessageVO mvo ) throws Exception {
		
		admin_MessageDAO.writing_message(mvo);
		
		return null;
	}
/*	@RequestMapping("/admin_writing_message.do")
	public ModelAndView admin_writing_message( @ModelAttribute MessageVO mvo ) throws Exception {
		ModelAndView mnv = new ModelAndView();
		admin_MessageDAO.writing_message(mvo);
		mnv.setViewName("redirect:/admin_message_write.do");
		
		return mnv;
	}*/
	
	@RequestMapping("/admin_message_read_to.do")
	public ModelAndView admin_message_read_to( @ModelAttribute MessageVO mvo, 
			@ModelAttribute Admin_searchVO search, @RequestParam("pg") String pg) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_message_read_to");
		/*List<MessageVO> ls = admin_MessageDAO.findToGetMessages();
		mnv.addObject("ls", ls);*/
		List<MessageVO> ls = admin_MessageDAO.search_All(search);
		PaginationDTO pz = new PaginationDTO().init(pg, ls.size()) ;
		search.setStart_no(pz.getSkip());
		ls = admin_MessageDAO.search_All(search);
		mnv.addObject("ls", ls);
		mnv.addObject("pz", pz);
		mnv.addObject("search", search);
		return mnv;
	}
}