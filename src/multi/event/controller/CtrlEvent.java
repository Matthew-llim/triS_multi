package multi.event.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.RequestParam;
import main.vo.EventVO;
import main.vo.UserVO;
import multi.event.dao.EventDAO;
import multi.event.vo.Event_searchVO;

@Controller
public class CtrlEvent {
	
	@Autowired @Qualifier("eventDAO")
	private EventDAO EventDAO = null;
	
	// 이벤트 리스트 페이지
	@RequestMapping("/event_list.do")
	public ModelAndView textList() throws Exception {
		List<EventVO> rl = EventDAO.findAll();
		ModelAndView mnv = new ModelAndView("event_list");
		mnv.addObject("rl",rl);
		return mnv;
	}
	
	// 이벤트 등록 함수
	@RequestMapping("/event_add2.do")
	public ModelAndView event_add2(HttpServletRequest request) throws Exception{
		ModelAndView mnv = new ModelAndView("redirect:/event_list.do");

		String savePath = "C:\\Users\\student\\git\\msspace_01\\WebContent\\thumbnail";
		int sizeLimit = 1024*1024*15;
		System.out.println(savePath);
		MultipartRequest mpr = new MultipartRequest(request, savePath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());
				
		EventVO vo = new EventVO();
		
		String eve_title = mpr.getParameter("eve_title");
		String eve_content = mpr.getParameter("eve_content");
		String eve_thumb_img = mpr.getFilesystemName("eve_thumb_img");
		System.out.println("121");
		vo.setEve_title(eve_title); vo.setEve_content(eve_content); vo.setEve_thumb_img(eve_thumb_img);
		EventDAO.add(vo);
		return mnv;
	}
	
	@RequestMapping("/event_add.do")
//	public String textread2(@RequestParam("textNo") int pk) throws Exception {
	public ModelAndView textadd() throws Exception {
		ModelAndView mnv = new ModelAndView("event_add"); 
		return mnv;	
	}
	
	//  TextVO pvo 는 폼에 
	
	// 이벤트 삭제 
	@RequestMapping("/event_del2.do")
	public String textdel2(@ModelAttribute EventVO pvo) throws Exception {
		EventDAO.delByPK(pvo);
		return "redirect:/event_list.do";
	}
	
	// 이벤트 읽어오는 페이지
	@RequestMapping("/event_read.do")
//	public String textread2(@RequestParam("textNo") int pk) throws Exception {
	public ModelAndView textread2(@RequestParam("eve_no") int pk) throws Exception {
		ModelAndView mnv = new ModelAndView("event_read"); 
		 EventVO text = EventDAO.getByPK(pk);
		 System.out.println("asdasd");
		mnv.addObject("text", text );
		return mnv;	
	}
	
	// 이벤트 수정페이지
	@RequestMapping("/event_mod.do")
	public ModelAndView textmod(@ModelAttribute EventVO pvo) throws Exception{
		ModelAndView mnv = new ModelAndView("event_mod");
		mnv.addObject("text", pvo);
		return mnv;
		//@RequestParam("textNo") text_list.do?textNo=1 여기에 넘어오는 정보를
	}
	
	

	@RequestMapping("/event_mod2.do")
	public ModelAndView event_mod2(HttpServletRequest request) throws Exception{
		
		String savePath = "C:\\workspaceN\\test15\\WebContent\\img";
		int sizeLimit = 1024*1024*15;
		System.out.println(savePath);
		MultipartRequest mpr = new MultipartRequest(request, savePath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());
				
		EventVO vo = new EventVO();

		Integer eve_no = Integer.parseInt(mpr.getParameter("eve_no"));
		
		String eve_title = mpr.getParameter("eve_title");
		String eve_content = mpr.getParameter("eve_content");
		String eve_thumb_img = mpr.getFilesystemName("eve_thumb_img");

		vo.setEve_no(eve_no);
		vo.setEve_title(eve_title); 
		vo.setEve_content(eve_content); 
		vo.setEve_thumb_img(eve_thumb_img); 
		
		EventDAO.mod(vo);
		
		ModelAndView mnv = new ModelAndView("redirect:/event_read.do?eve_no=" + eve_no);
		return mnv;
	}
	
	// 클라이언트 화면 리스트 페이지
	@RequestMapping("/event_user_list.do") 
	public ModelAndView event_listll(HttpServletRequest request) throws Exception {
		
		List<EventVO> rl = null;
		Integer eve_option = null;
		String eve_key = null;
		
		if (request.getParameter("eve_option") != null) {
			eve_option = Integer.parseInt(request.getParameter("eve_option"));
		}
		if (request.getParameter("eve_key") != null) {
			eve_key = request.getParameter("eve_key");
		}
			
		if( eve_option == null && eve_key == null){
			rl = EventDAO.findAll();
		} else {
			Event_searchVO svo = new Event_searchVO(eve_option, eve_key);
			rl = EventDAO.search(svo);
		}
		
		ModelAndView mnv = new ModelAndView("event_user_list");
		mnv.addObject("rl",rl);
		return mnv;
	}
		
	
	// 클라이언트 이벤트 화면 페이지 
	@RequestMapping("/event_user_read.do")
//	public String textread2(@RequestParam("textNo") int pk) throws Exception {
	public ModelAndView event_read2(@RequestParam("eve_no") int pk) throws Exception {
		ModelAndView mnv = new ModelAndView("event_user_read"); 
		 EventVO text = EventDAO.getByPK(pk);
		mnv.addObject("text", text );
		return mnv;	
	}
	
				
		//return "redirect:/event_read.do?eve_no="+pvo.getEve_no();
		//@RequestParam("textNo") text_list.do?textNo=1 여기에 넘어오는 정보를
		//"redirect:/text_list.do";	
		//"redirect:/text_read.do?textNo="+pvo.getTextNo();
}
