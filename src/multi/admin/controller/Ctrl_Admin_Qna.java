package multi.admin.controller;
 
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.PaginationDTO;
import main.RequestMapping;
import main.RequestParam;
import main.ResponseBody;
import main.vo.Community_qnaVO;
import main.vo.Community_qna_repleVO;
import multi.admin.dao.Admin_QnaDAO;
import multi.admin.vo.Admin_community_searchVO;
import multi.admin.vo.Admin_searchVO;

@Controller
public class Ctrl_Admin_Qna {
	@Autowired @Qualifier("admin_QnaDAO_MysqlImpl")
	private Admin_QnaDAO admin_QnaDAO_MysqlImpl=null;
	
	//QnA 게시판
	@RequestMapping("/admin_community_qna_list.do")
	public ModelAndView admin_community_qna_list(@ModelAttribute Admin_searchVO search, 
			@RequestParam("pg") String pg) throws Exception{
		ModelAndView mnv = new ModelAndView("admin_community_qna_list");
		//List<Community_qnaVO> rl= admin_QnaDAO_MysqlImpl.findAll();
		
		List<Community_qnaVO> rl = admin_QnaDAO_MysqlImpl.search_All(search);
		PaginationDTO pz = new PaginationDTO().init(pg, rl.size()) ;
		search.setStart_no(pz.getSkip());
		rl = admin_QnaDAO_MysqlImpl.search_All(search);
		mnv.addObject("rl", rl);
		mnv.addObject("pz", pz);
		mnv.addObject("search", search);
		
		return mnv;
	}
	
	@RequestMapping("/admin_community_qna_read.do")
	public ModelAndView admin_community_qna_read(@ModelAttribute Community_qnaVO pvo,
			@ModelAttribute Community_qna_repleVO rpl, 
			@CookieValue("user_id") String user_id ) throws Exception{
		pvo.setUser_id(user_id);
		admin_QnaDAO_MysqlImpl.modView(pvo);
		Community_qnaVO vo=admin_QnaDAO_MysqlImpl.findByPK(pvo);
		List<Community_qna_repleVO> rp=admin_QnaDAO_MysqlImpl.findAllReple(rpl);
			
		ModelAndView mnv = new ModelAndView("admin_community_qna_read");
		mnv.addObject("vo", vo);
		mnv.addObject("rp", rp);
		mnv.addObject("user_id", user_id);
		return mnv;
	}
	
	@RequestMapping("/admin_community_qna_add.do")
	public ModelAndView admin_community_qna_add( @CookieValue("user_id") String user_id ) throws Exception{
			ModelAndView mnv = new ModelAndView("admin_community_qna_add");
			mnv.addObject("user_id", user_id);
			return mnv;
	}
	
	@RequestMapping("/admin_community_qna_add2.do")
	public String admin_community_qna_add2(@ModelAttribute Community_qnaVO pvo) throws Exception{
			admin_QnaDAO_MysqlImpl.add(pvo);
			return "redirect:/admin_community_qna_list.do";
	}
	
	@RequestMapping("/admin_community_qna_mod.do")
	public ModelAndView admin_community_qna_mod(@ModelAttribute Community_qnaVO pvo) throws Exception{
			ModelAndView mnv = new ModelAndView("admin_community_qna_mod");
			mnv.addObject("vo",pvo);
			return mnv;
	}
	
	@RequestMapping("/admin_community_qna_mod2.do")
	public String admin_community_qna_mod2(@ModelAttribute Community_qnaVO pvo) throws Exception{
			admin_QnaDAO_MysqlImpl.mod(pvo);
			return "redirect:/admin_community_qna_read.do?com_qna_no="+pvo.getCom_qna_no();
	}
	
	@RequestMapping("/admin_community_qna_del.do")
	public String admin_community_qna_del(@ModelAttribute Community_qnaVO pvo) throws Exception{
			admin_QnaDAO_MysqlImpl.delByPK(pvo);
			return "redirect:/admin_community_qna_list.do";
	}
	
	// 아래부터는 리플
	
	@RequestMapping("/admin_community_qna_reple_add.do")
	public String admin_community_qna_reple_add( @CookieValue("user_id") String user_id, @ModelAttribute Community_qna_repleVO pvo) throws Exception{
		pvo.setUser_id(user_id);
		admin_QnaDAO_MysqlImpl.addReple(pvo);
		return "redirect:/admin_community_qna_read.do?com_qna_no="+pvo.getCom_qna_no();
	}
	
	@RequestMapping("/admin_community_qna_reple_del.do")
	public String admin_community_qna_reple_del(@ModelAttribute Community_qna_repleVO pvo) throws Exception{
			admin_QnaDAO_MysqlImpl.delReple(pvo);
			return "redirect:/admin_community_qna_read.do?com_qna_no="+pvo.getCom_qna_no();
	}
	
	@RequestMapping("/admin_community_qna_reple_mod.do")
	@ResponseBody
	public String community_board_replemod(HttpServletRequest request) throws Exception {
		Community_qna_repleVO pvo = new Community_qna_repleVO();
		
		pvo.setCom_qna_reple_no( Integer.parseInt(request.getParameter("com_qna_reple_no")) );
		pvo.setCom_qna_reple_content( request.getParameter("com_qna_reple_content") );
		
		admin_QnaDAO_MysqlImpl.modReple(pvo);
		return null;
	}
/*	@RequestMapping("/admin_community_qna_reple_mod.do")
	public String community_board_replemod(@ModelAttribute  Community_qna_repleVO  pvo) throws Exception {
			admin_QnaDAO_MysqlImpl.modReple(pvo);
		return  "redirect:/admin_community_qna_read.do?com_qna_no="+pvo.getCom_qna_no();
	}*/
	@RequestMapping("/admin_community_qna_reple_recom.do")
	public String community_board_recom(@ModelAttribute Community_qna_repleVO pvo)throws Exception {
		admin_QnaDAO_MysqlImpl.incRecom(pvo);
		
		return "redirect:/admin_community_qna_read.do?com_qna_no="+pvo.getCom_qna_no();
    }
}


