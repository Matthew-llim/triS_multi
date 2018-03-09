package multi.admin.controller;
 
import java.util.List; 

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import main.Controller;
import main.ModelAndView;
import main.ModelAttribute;
import main.PaginationDTO;
import main.RequestMapping;
import main.RequestParam;
import main.vo.EventVO;
import multi.admin.dao.Admin_EventDAO;
import multi.admin.vo.Admin_searchVO;


@Controller
public class Ctrl_Admin_Events {
	
	@Autowired @Qualifier("admin_EventDAO")
	private Admin_EventDAO admin_EventDAO = null;
	
	// 이벤트 리스트 페이지
	@RequestMapping("/admin_event_list.do")
	public ModelAndView textList(@ModelAttribute Admin_searchVO search, @RequestParam("pg") String pg) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_event_list");
		/*List<EventVO> rl = admin_EventDAO.findAll();
		mnv.addObject("rl",rl);*/
		
		List<EventVO> rl = admin_EventDAO.search_All(search);
		PaginationDTO pz = new PaginationDTO().init(pg, rl.size()) ;
		search.setStart_no(pz.getSkip());
		rl = admin_EventDAO.search_All(search);
		mnv.addObject("rl", rl);
		mnv.addObject("pz", pz);
		mnv.addObject("search", search);
		
		return mnv;
	}
	
	// 이벤트 등록 함수
	@RequestMapping("/admin_event_add2.do")
	public ModelAndView admin_event_add2(HttpServletRequest request) throws Exception{
		ModelAndView mnv = new ModelAndView("redirect:/admin_event_list.do");
		//String savePath = "C:\\Users\\student\\git\\msspace_01\\WebContent\\thumbnail";
		String thumbnailSavePath = request.getServletContext().getRealPath("thumbnail");
		
		int sizeLimit = 1024*1024*15;
		MultipartRequest mpr = new MultipartRequest(request, thumbnailSavePath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());
				
		EventVO vo = new EventVO();
		
		String eve_title = mpr.getParameter("eve_title");
		String eve_content = mpr.getParameter("eve_content");
		String eve_thumb_img = mpr.getFilesystemName("eve_thumb_img");
		vo.setEve_title(eve_title); vo.setEve_content(eve_content); vo.setEve_thumb_img(eve_thumb_img);
		admin_EventDAO.add(vo);
		return mnv;
	}
	
	@RequestMapping("/admin_event_add.do")
	public ModelAndView textadd() throws Exception {
		ModelAndView mnv = new ModelAndView("admin_event_add"); 
		return mnv;	
	}
	
	//  TextVO pvo 는 폼에 
	
	// 이벤트 삭제 
	@RequestMapping("/admin_event_del2.do")
	public String textdel2(@ModelAttribute EventVO pvo) throws Exception {
		admin_EventDAO.delByPK(pvo);
		return "redirect:/admin_event_list.do";
	}
	
	// 이벤트 읽어오는 페이지
	@RequestMapping("/admin_event_read.do")
//	public String textread2(@RequestParam("textNo") int pk) throws Exception {
	public ModelAndView textread2(@RequestParam("eve_no") int pk) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_event_read"); 
		EventVO text = admin_EventDAO.getByPK(pk);
		mnv.addObject("text", text );
		return mnv;	
	}
	
	// 이벤트 수정페이지
	@RequestMapping("/admin_event_mod.do")
	public ModelAndView textmod(@ModelAttribute EventVO pvo) throws Exception{
		ModelAndView mnv = new ModelAndView("admin_event_mod");
		mnv.addObject("text", pvo);
		return mnv;
		//@RequestParam("textNo") text_list.do?textNo=1 여기에 넘어오는 정보를
	}
	
	

	@RequestMapping("/admin_event_mod2.do")
	public ModelAndView admin_event_mod2(HttpServletRequest request) throws Exception{
		String thumbnailSavePath = request.getServletContext().getRealPath("thumbnail");
		//String savePath = "C:\\Users\\student\\git\\msspace_01\\WebContent\\thumbnail";
		int sizeLimit = 1024*1024*15;
		MultipartRequest mpr = new MultipartRequest(request, thumbnailSavePath, sizeLimit,"utf-8",new DefaultFileRenamePolicy());
				
		EventVO vo = new EventVO();

		Integer eve_no = Integer.parseInt(mpr.getParameter("eve_no"));
		
		String eve_title = mpr.getParameter("eve_title");
		String eve_content = mpr.getParameter("eve_content");
		String eve_thumb_img = mpr.getFilesystemName("eve_thumb_img");

		vo.setEve_no(eve_no);
		vo.setEve_title(eve_title); 
		vo.setEve_content(eve_content); 
		vo.setEve_thumb_img(eve_thumb_img); 
		
		admin_EventDAO.mod(vo);
		
		ModelAndView mnv = new ModelAndView("redirect:/admin_event_read.do?eve_no=" + eve_no);
		return mnv;
	}

}
