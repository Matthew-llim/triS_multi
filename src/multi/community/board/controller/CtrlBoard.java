package multi.community.board.controller;

import java.util.List;
import java.util.Map;

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
import main.vo.Community_boardVO;
import main.vo.Community_board_repleVO;
import multi.club.vo.Club_board_repleVO;
import multi.community.board.dao.Community_boardDAO;
import multi.community.board.dao.Community_board_searchDAO;
import multi.community.board.dao.Community_boardmytextDAO;
import multi.community.board.dao.Community_boardrepleDAO;
import multi.community.board.vo.Community_board_searchVO;
import multi.community.qna.vo.Community_qna_searchVO;

@Controller
public class CtrlBoard {
	
	@Autowired @Qualifier("community_boardDAO")
	private Community_boardDAO community_boardDAO = null;
	
	@Autowired @Qualifier("community_boardrepleDAO")
	private Community_boardrepleDAO community_boardrepleDAO = null;
	
	@Autowired @Qualifier("community_boardmytextDAO")
	private Community_boardmytextDAO community_boardmytextDAO =null;
	
	@Autowired @Qualifier("community_board_searchDAO")
	private Community_board_searchDAO community_board_searchDAO =null;
	
	
	//커뮤니티 보드 
	 @RequestMapping("/community_board_list.do")
	   public ModelAndView community_board(@CookieValue("user_id") String user_id,
			   @ModelAttribute Community_board_searchVO pvo, @RequestParam("cur_board_page") String cur_board_page) throws Exception{
	      ModelAndView mnv = new ModelAndView("community_board_list");
	      pvo.setStart(null);
		  List<Community_boardVO> board_list = community_board_searchDAO.comm_board_search(pvo);
	      // 페이지 나누기 관련 처리(페이지 레코드 계산)
	      PaginationDTO board_pz = new PaginationDTO().init(cur_board_page, board_list.size());
	      pvo.setStart(board_pz.getSkip());
	      board_list = community_board_searchDAO.comm_board_search(pvo);

	      mnv.addObject("board_list",board_list);
	      mnv.addObject("board_pz",board_pz);
	      mnv.addObject("user_id", user_id);

	      return mnv;
	   }
	 
	 @RequestMapping("/community_board_mytext.do")
	   public ModelAndView community_board_mytext(@CookieValue("user_id") String user_id) throws Exception{
		 ModelAndView mnv = new ModelAndView("community_board_mytext");
		
		 List<Community_boardVO> mrl = community_boardmytextDAO.findAll(user_id);
		
	      mrl = community_boardmytextDAO.findAll(user_id);
	      mnv.addObject("user_id", user_id);
	      mnv.addObject("mrl", mrl);
	   
	      return mnv;
	 }
	 
	 
	 @RequestMapping("/community_board_add.do")
	 public ModelAndView community_board_add(@CookieValue("user_id") String user_id , @ModelAttribute Community_boardVO pvo ) throws Exception{
		 ModelAndView mnv = new ModelAndView("community_board_add2");
		 return mnv;
		 
	 }
	 
	 @RequestMapping("/community_board_add2.do")
	 public String community_board_add2(@CookieValue("user_id") String user_id,@ModelAttribute Community_boardVO pvo)throws Exception {
		 pvo.setUser_id(user_id);
		 community_boardDAO.add(pvo);
		 return "redirect:/community_board_list.do";
	 }
	 
	 
	 @RequestMapping("/community_board_read.do")
	 public ModelAndView community_board_read(@CookieValue("user_id") String user_id, @ModelAttribute Community_boardVO pvo, @ModelAttribute Community_board_repleVO rvo) throws Exception{
		 community_boardDAO.incViewLogic(pvo);
		 Community_boardVO bvo = community_boardDAO.findByPK(pvo);
		 ModelAndView mnv = new ModelAndView("community_board_read");
		 mnv.addObject("vo", bvo);
		 
		
		 pvo.setUser_id(user_id);
		 List<Community_board_repleVO> rl = community_boardrepleDAO.findAllreple(rvo);
	     mnv.addObject("user_id", user_id);
		 mnv.addObject("rl",rl);
		 
		 return mnv;
	 }
	 /* 리플 조회 */
	 @RequestMapping("/community_board_read_reple.do")
	 @ResponseBody
	 public String community_board_read_reple(@ModelAttribute Community_board_repleVO pvo) throws Exception{
		 List<Community_board_repleVO> rl = community_boardrepleDAO.findAllreple(pvo);
			
			StringBuffer sb = null;
			try{
				for (Community_board_repleVO vo : rl) {
					if (sb == null) {
						sb = new StringBuffer();
						sb.append("{data:[");
					} else {
						sb.append(",");
					}
					sb.append("{'com_board_reple_no' :'").append(vo.getCom_board_reple_no()).append("', 'com_board_reple_content' : '").append(vo.getCom_board_reple_content())
					.append("', 'user_id' : '").append(vo.getUser_id()).append("', 'com_board_no' : '").append(vo.getCom_board_no()).append("', 'the_time' : '").append(vo.getThe_time()).append("'}");
					
				}
				sb.append("]}");
				return sb.toString();
			}catch(Exception e){
				return null;
			}
	 }
	 
	 
	 @RequestMapping("/community_board_mod.do")
	 public ModelAndView community_board_mod (@ModelAttribute Community_boardVO pvo)throws Exception {
		ModelAndView mnv= new ModelAndView("community_board_mod2");
		mnv.addObject("mvo", pvo);
		return mnv;
		 
	 } 
	 
	 @RequestMapping("/community_board_mod2.do")
	 public String community_board_mod2(@ModelAttribute Community_boardVO pvo)throws Exception {
		 community_boardDAO.mod(pvo);
		 return "redirect:/community_board_read.do?com_board_no="+pvo.getCom_board_no();
		 
	 }
	 
	 
	 @RequestMapping("/community_board_del.do")
	 
	 public String community_board_del(@ModelAttribute Community_boardVO pvo)throws Exception {
		 	community_boardDAO.delByPK(pvo);
			return "redirect:/community_board_list.do";
	 }
	 
	 
	@RequestMapping("/community_board_recom.do")
	@ResponseBody
	 public String community_board_recom(@ModelAttribute Community_boardVO pvo)throws Exception {

		 community_boardDAO.incRecomLogic(pvo);
		 return pvo.getRecom_count().toString();
	 
	 }
	
	@RequestMapping("/community_board_serch.do")
	public  ModelAndView  community_board_serch(@ModelAttribute Community_board_searchVO pvo) throws Exception{
		ModelAndView mnv = new ModelAndView("community_board_serch");
		 List<Community_boardVO> srl = community_board_searchDAO.comm_board_search(pvo);
	      mnv.addObject("srl", srl);
	      return mnv;
		
	}
	
	 
	
	//커뮤니티 보드 글 리플
	@RequestMapping("/community_board_addreple.do")
	@ResponseBody
	public String community_board_addreple(@CookieValue("user_id") String user_id, HttpServletRequest request) throws Exception {
		Community_board_repleVO pvo = new Community_board_repleVO();
		pvo.setCom_board_no(request.getParameter("com_board_no"));
		pvo.setCom_board_reple_content(request.getParameter("com_board_reple_content"));
		pvo.setUser_id(user_id);
		
		try{
			pvo.setUser_id(user_id);
			community_boardrepleDAO.addReple(pvo);
			return "ok";
		}catch(Exception e){
			return "no";
		}
	}
	
	@RequestMapping("/community_board_replemod.do")
	@ResponseBody
	public String community_board_replemod(HttpServletRequest request) throws Exception {
		Community_board_repleVO pvo = new Community_board_repleVO();
		pvo.setCom_board_reple_no(request.getParameter("com_board_reple_no"));
		pvo.setCom_board_reple_content(request.getParameter("com_board_reple_content"));
		try{
			community_boardrepleDAO.modReple(pvo);
			return "ok";
		}catch(Exception e){
			return "no";
		}
	}
	
	@RequestMapping("/community_board_repledel.do")
	@ResponseBody
	public String community_board_repledel(@ModelAttribute  Community_board_repleVO  pvo) throws Exception {
		try{
			community_boardrepleDAO.delReple(pvo);
			return "ok";
		}catch(Exception e){
			return "no";
		}
	}
	
	//main.html에 best_club
	@RequestMapping("/best_community.do")
	@ResponseBody
	public String best_community() throws Exception{
		List<Map<String, Object>> list = community_boardDAO.find_best_community();
		
		StringBuffer sb = new StringBuffer();
		try{
			sb.append("{ 'data' :[ ");
			int flag=0;
			for(Map<String, Object> vo : list){
				flag++;
				sb.append("{");
				sb.append("'com_board_no'");
				sb.append(":");
				sb.append("'"+vo.get("com_board_no")+"',");
				sb.append("'com_board_title'");
				sb.append(":");
				sb.append("'"+vo.get("com_board_title")+"',");
				sb.append("'view_count'");
				sb.append(":");
				sb.append("'"+vo.get("view_count")+"',");
				sb.append("'recom_count'");
				sb.append(":");
				sb.append("'"+vo.get("recom_count")+"',");
				sb.append("'user_name'");
				sb.append(":");
				sb.append("'"+vo.get("user_name")+"'");
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
