package multi.admin.controller;

import java.util.List;
import static main.Single.*;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.BeanUtil;
import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.PaginationDTO;
import main.RequestMapping;
import main.RequestParam;
import main.ResponseBody;
import main.vo.Community_boardVO;
import main.vo.Community_board_repleVO;
import multi.admin.dao.Admin_FreeboardDAO;
import multi.admin.vo.Admin_community_searchVO;
import multi.admin.vo.Admin_searchVO;
 
@Controller
public class Ctrl_Admin_Freeboard {
	
	@Autowired @Qualifier("admin_FreeboardDAO")
	private Admin_FreeboardDAO admin_FreeboardDAO = null;

	
	//커뮤니티 보드 
	 @RequestMapping("/admin_community_board_list.do")
	   public ModelAndView admin_community_board_list( @CookieValue("user_id") String user_id,
			   @ModelAttribute Admin_searchVO search, @RequestParam("pg") String pg) throws Exception{
	      ModelAndView mnv = new ModelAndView("admin_community_board_list");
	      mnv.addObject("user_id", user_id);
	      
	      List<Community_boardVO> rl = admin_FreeboardDAO.searchAll(search);
	      PaginationDTO pz = new PaginationDTO().init(pg, rl.size()) ;
	      search.setStart_no(pz.getSkip());
	      rl = admin_FreeboardDAO.searchAll(search);
	      mnv.addObject("pz", pz);
	      mnv.addObject("search", search);
	      
	      mnv.addObject("rl",rl);
	      return mnv;
	   }
	 
	 
	 @RequestMapping("/admin_community_board_add.do")
	 public ModelAndView admin_community_board_add(@ModelAttribute Community_boardVO pvo ) throws Exception{
		 ModelAndView mnv = new ModelAndView("admin_community_board_add");
		 return mnv;
		 
	 }
	 
	 @RequestMapping("/admin_community_board_add2.do")
	 public String admin_community_board_add2( @CookieValue("user_id") String user_id, 
			 @ModelAttribute Community_boardVO pvo)throws Exception {
		 pvo.setUser_id(user_id);
		 admin_FreeboardDAO.add(pvo);
		 return "redirect:/admin_community_board_list.do";
	 }
	 
	 
	 @RequestMapping("/admin_community_board_read.do")
	 public ModelAndView admin_community_board_read(@CookieValue("user_id") String user_id, 
			 @ModelAttribute Community_boardVO pvo, 
			 @ModelAttribute Community_board_repleVO rvo) throws Exception{
		 Community_boardVO bvo = admin_FreeboardDAO.findByPK(pvo);
		 ModelAndView mnv = new ModelAndView("admin_community_board_read");
		 mnv.addObject("user_id", user_id);
		 mnv.addObject("vo", bvo);
		 
		 admin_FreeboardDAO.incViewLogic(pvo);
		 List<Community_board_repleVO> rl = admin_FreeboardDAO.findAllreple(rvo);
		 mnv.addObject("rl",rl);
	
		 return mnv;
		 
	 }
	 
	 
	 @RequestMapping("/admin_community_board_mod.do")
	 public ModelAndView admin_community_board_mod (@ModelAttribute Community_boardVO pvo)throws Exception {
		ModelAndView mnv= new ModelAndView("admin_community_board_mod");
		mnv.addObject("mvo", pvo);
		return mnv;
		 
	 } 
	 
	 @RequestMapping("/admin_community_board_mod2.do")
	 public String admin_community_board_mod2(@ModelAttribute Community_boardVO pvo)throws Exception {
		 admin_FreeboardDAO.mod(pvo);
		 return "redirect:/admin_community_board_read.do?com_board_no="+pvo.getCom_board_no();
		 
	 }
	 
	 
	 @RequestMapping("/admin_community_board_del.do")
	 
	 public String admin_community_board_del(@ModelAttribute Community_boardVO pvo)throws Exception {
		 	admin_FreeboardDAO.delByPK(pvo);
			return "redirect:/admin_community_board_list.do";
	 }
	 
	 
	@RequestMapping("/admin_community_board_recom.do")
	@ResponseBody
	 public String admin_community_board_recom(@ModelAttribute Community_boardVO pvo)throws Exception {
		
		admin_FreeboardDAO.incRecomLogic(pvo);
		return pvo.getRecom_count().toString();
	 
	 }
	 
	
	//커뮤니티 보드 글 리플
	@RequestMapping("/admin_community_board_addreple.do")
	public String admin_community_board_addreple( @CookieValue("user_id") String user_id, @ModelAttribute Community_board_repleVO  pvo) throws Exception {
		admin_FreeboardDAO.addReple(pvo);
		return "redirect:/admin_community_board_read.do?com_board_no="+pvo.getCom_board_no();
	}
	
	@RequestMapping("/admin_community_board_replemod.do")
	@ResponseBody
	public String admin_community_board_replemod(HttpServletRequest request) throws Exception {
		
		Community_board_repleVO  pvo = new Community_board_repleVO();
		pvo.setCom_board_no( request.getParameter("com_board_no") );
		pvo.setCom_board_reple_no( request.getParameter("com_board_reple_no") );
		pvo.setCom_board_reple_content( request.getParameter("com_board_reple_content") );
		admin_FreeboardDAO.modReple(pvo);
		return  null;
	}
	/*@RequestMapping("/admin_community_board_replemod.do")
	public String admin_community_board_replemod(@ModelAttribute  Community_board_repleVO  pvo) throws Exception {
		admin_FreeboardDAO.modReple(pvo);
		return  "redirect:/admin_community_board_read.do?com_board_no="+pvo.getCom_board_no();
	}*/
	
	@RequestMapping("/admin_community_board_repledel.do")
	public String admin_community_board_repledel(@ModelAttribute  Community_board_repleVO  pvo) throws Exception {
		admin_FreeboardDAO.delReple(pvo);
		return "redirect:/admin_community_board_read.do?com_board_no="+pvo.getCom_board_no();
	}

}
