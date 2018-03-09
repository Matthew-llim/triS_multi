package multi.community.qna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.mysql.jdbc.jdbc2.optional.SuspendableXAConnection;

import main.BeanUtil;
import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.PaginationDTO;
import main.RequestMapping;
import main.RequestParam;
import main.ResponseBody;
import main.vo.Community_board_repleVO;
import multi.community.qna.dao.Community_qnaDAO;
import multi.community.qna.dao.Community_qna_mytextDAO;
import multi.community.qna.dao.Community_qna_repleDAO;
import multi.community.qna.dao.Community_qna_searchDAO;
import multi.community.qna.vo.Community_qnaVO;
import multi.community.qna.vo.Community_qna_repleVO;
import multi.community.qna.vo.Community_qna_searchVO;

@Controller
public class CtrlQna {
	@Autowired @Qualifier("community_qnaDAO")
	private Community_qnaDAO community_qnaDAO=null;
	
	@Autowired @Qualifier("community_qna_repleDAO")
	private Community_qna_repleDAO community_qna_repleDAO=null;
	
	@Autowired @Qualifier("community_qna_mytextDAO")
	private Community_qna_mytextDAO community_qna_mytextDAO =null;
	
	@Autowired @Qualifier("community_qna_searchDAO")
	private Community_qna_searchDAO community_qna_searchDAO =null;
	
	//QnA 게시판 리스트
	@RequestMapping("/community_qna_list.do")
	public ModelAndView community_qna(@CookieValue("user_id") String user_id,
			@ModelAttribute Community_qna_searchVO pvo, @RequestParam("cur_page") String cur_page) throws Exception{
		ModelAndView mnv = new ModelAndView("community_qna_list");
		pvo.setStart(null);
		List<Community_qnaVO> qna_list = community_qna_searchDAO.comm_qna_search(pvo);
	    // 페이지 나누기 관련 처리(페이지 레코드 계산)
	    PaginationDTO board_pz = new PaginationDTO().init(cur_page, qna_list.size());
	    pvo.setStart(board_pz.getSkip());
	    qna_list = community_qna_searchDAO.comm_qna_search(pvo);		
	    mnv.addObject("qna_list", qna_list);
		mnv.addObject("user_id", user_id);
		mnv.addObject("board_pz", board_pz);
		return mnv;
	}
	
	//QNA 게시판 읽기
	@RequestMapping("/community_qna_read.do")
	public ModelAndView community_qna_read(@ModelAttribute Community_qnaVO pvo,
			@ModelAttribute Community_qna_repleVO rpl, 
			@CookieValue("user_id") String user_id) throws Exception{
			
			pvo.setUser_id(user_id);
			community_qnaDAO.modView(pvo);
			Community_qnaVO vo=community_qnaDAO.findByPK(pvo);
			List<Community_qna_repleVO> rp=community_qna_repleDAO.findAllReple(rpl);
			
			ModelAndView mnv = new ModelAndView("community_qna_read");
			mnv.addObject("vo", vo);
			mnv.addObject("rp", rp);
			mnv.addObject("user_id", user_id);
			return mnv;
	}
	//QNA 게시판 글쓰기
	@RequestMapping("/community_qna_add.do")
	public ModelAndView community_qna_add(@CookieValue("user_id") String user_id) throws Exception{
			ModelAndView mnv = new ModelAndView("community_qna_add");
			mnv.addObject("user_id", user_id);
			return mnv;
	}
	//QNA 게시판 글쓴내용 전송 후 리스트 복귀
	@RequestMapping("/community_qna_add2.do")
	public String community_qna_add2(@ModelAttribute Community_qnaVO pvo) throws Exception{
			community_qnaDAO.add(pvo);
			return "redirect:/community_qna_list.do";
	}
	
	//QNA 내용 수정
	@RequestMapping("/community_qna_mod.do")
	public ModelAndView community_qna_mod(@ModelAttribute Community_qnaVO pvo) throws Exception{
			ModelAndView mnv = new ModelAndView("community_qna_mod");
			mnv.addObject("vo",pvo);
			return mnv;
	}
	//QNA 내용 수정후 해당 QNA 보이기
	@RequestMapping("/community_qna_mod2.do")
	public String community_qna_mod2(@ModelAttribute Community_qnaVO pvo) throws Exception{
			community_qnaDAO.mod(pvo);
			return "redirect:/community_qna_read.do?com_qna_no="+pvo.getCom_qna_no();
	}
	//QNA 내용 삭제
	@RequestMapping("/community_qna_del.do")
	public String community_qna_del(@ModelAttribute Community_qnaVO pvo) throws Exception{
			community_qnaDAO.delByPK(pvo);
			return "redirect:/community_qna_list.do";
	}
	
	// 아래부터는 리플
	
	//QNA 리플 쓰기
	@RequestMapping("/community_qna_reple_add.do")
	@ResponseBody
	public String community_qna_reple_add(@CookieValue("user_id") String user_id, HttpServletRequest request) throws Exception{
		try{
			Community_qna_repleVO pvo = new Community_qna_repleVO();
			pvo.setCom_qna_no(BeanUtil.pInt(request.getParameter("com_qna_no")));
			pvo.setCom_qna_reple_content(request.getParameter("com_qna_reple_content"));
			pvo.setUser_id(user_id);
			community_qna_repleDAO.addReple(pvo);
			return "ok";
		}catch(Exception e){
			return "no";
		}
			
	}
	//QNA 리플 삭제
	@RequestMapping("/community_qna_reple_del.do")
	@ResponseBody
	public String community_qna_reple_del(@ModelAttribute Community_qna_repleVO pvo) throws Exception
	{
		try{
			community_qna_repleDAO.delReple(pvo);
			return "ok";
		}catch(Exception e){
			return "no";
		}
	}
	//QNA 리플 수정
	@RequestMapping("/community_qna_reple_mod.do")
	@ResponseBody
	public String community_board_replemod(HttpServletRequest request) throws Exception {
		try{
			Community_qna_repleVO pvo = new Community_qna_repleVO();
			pvo.setCom_qna_reple_no(BeanUtil.pInt(request.getParameter("com_qna_reple_no")));
			pvo.setCom_qna_reple_content(request.getParameter("com_qna_reple_content"));
			community_qna_repleDAO.modReple(pvo);
			return  "ok";
		}catch(Exception e){
			return "no";
		}
	}
	 /* 리플 조회 */
	 @RequestMapping("/community_qna_read_reple.do")
	 @ResponseBody
	 public String community_qna_read_reple(@ModelAttribute Community_qna_repleVO pvo) throws Exception{
			List<Community_qna_repleVO> rl = community_qna_repleDAO.findAllReple(pvo);
			StringBuffer sb = null;
			try{
				for (Community_qna_repleVO vo : rl) {
					System.out.println(vo.getCom_qna_reple_no());
					if (sb == null) {
						sb = new StringBuffer();
						sb.append("{data:[");
					} else {
						sb.append(",");
					}
					sb.append("{'com_qna_reple_no' :'").append(vo.getCom_qna_reple_no()).append("', 'com_qna_reple_content' : '").append(vo.getCom_qna_reple_content())
					.append("', 'user_id' : '").append(vo.getUser_id()).append("', 'com_qna_no' : '").append(vo.getCom_qna_no()).append("', 'the_time' : '").append(vo.getThe_time())
					.append("', 'recom_count' : '").append(vo.getRecom_count()).append("'}");
					
				}
				sb.append("]}");
				return sb.toString();
			}catch(Exception e){
				return null;
			}
	 }
	
	//QNA 리플 추천
	@RequestMapping("/community_qna_reple_recom.do")
	@ResponseBody
	public String community_board_recom(@ModelAttribute Community_qna_repleVO pvo)throws Exception {
		community_qna_repleDAO.incRecom(pvo);
		//return "redirect:/community_qna_read.do?com_qna_no="+pvo.getCom_qna_no();
		return pvo.getRecom_count().toString();
    }

	// QNA 내가쓴글보기
	 @RequestMapping("/community_qna_mytext.do")
	   public ModelAndView community_board_mytext(@CookieValue("user_id") String user_id) throws Exception{
		 ModelAndView mnv = new ModelAndView("community_qna_mytext");
		
		 List<Community_qnaVO> mrl = community_qna_mytextDAO.findAll(user_id);
		
		 mrl=community_qna_mytextDAO.findAll(user_id);
	     mnv.addObject("user_id", user_id);
	     mnv.addObject("mrl", mrl);
	     return mnv;
	 }
	 // QNA 글 찾기
	 @RequestMapping("/community_qna_serch.do")
		public  ModelAndView  community_board_serch(@ModelAttribute Community_qna_searchVO pvo) throws Exception{
			ModelAndView mnv = new ModelAndView("community_qna_serch");
			 List<Community_qnaVO> srl = community_qna_searchDAO.comm_qna_search(pvo);
		      mnv.addObject("srl", srl);
		      return mnv;
			
		}
	 
	
}


