package multi.admin.controller;
 
import static main.Single.i; 

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.ModelAndView;
import main.ModelAttribute;
import main.PaginationDTO;
import main.RequestMapping;
import main.RequestParam;
import main.vo.O2OQnAVO;
import multi.admin.dao.Admin_o2oQnADAO;
import multi.admin.mail.EmailUtility;
/* 
1:1 관리

1:1 관리 문의 보내기 페이지
문의 보낼 시 전송. 리다이렉트 1:1 관리 문의 보내기 페이지
1:1 문의 리스트 확인 페이지.
1:1 문의 운영자 메일 답장 완료시 확인 페이지
1:1 문의 미답장 및 답장 페이지에서 자세한 문의 정보를 읽어들일 때 쓰는 페이지
비회원의 1:1 문의를 이메일로 전송하는 페이지
이메일로 1:1 문의가 정상적으로 처리되었는지 확인 하는 페이지
 */
import multi.admin.vo.Admin_searchVO;

@Controller
public class Ctrl_Admin_o2oQnA {
	@Autowired @Qualifier("admin_o2oQnADAO")
	private Admin_o2oQnADAO admin_o2oQnADAO = null;
	
	// 1:1 관리 문의 보내기 페이지
	@RequestMapping("/admin_o2oQnA.do")
	public ModelAndView admin_o2oQnA() throws Exception {
		ModelAndView mnv = new ModelAndView("admin_o2oQnA");
		return mnv;
	}
	// 문의 보낼 시 전송. 리다이렉트 1:1 관리 문의 보내기 페이지
	@RequestMapping("/admin_o2oQnA_add.do")
	public ModelAndView admin_o2oQnA_add( @ModelAttribute O2OQnAVO ovo ) throws Exception {
		ModelAndView mnv = new ModelAndView();
		admin_o2oQnADAO.addAsking(ovo);
		//mnv.setViewName("redirect:/admin_o2oQnA.do");
		mnv.setViewName("redirect:/faq_list.do");
		return mnv;
	}
	// 1:1 문의 리스트 확인 페이지.
	@RequestMapping("/admin_o2oQnA_list.do")
	public ModelAndView admin_o2oQnA_list(@ModelAttribute Admin_searchVO search, @RequestParam("pg") String pg) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_o2oQnA_list");
		/*List<O2OQnAVO> ls = admin_o2oQnADAO.findAllAskWithNoRe();
		mnv.addObject("ls", ls);*/
		List<O2OQnAVO> ls = admin_o2oQnADAO.search_All(search);
		PaginationDTO pz = new PaginationDTO().init(pg, ls.size()) ;
		search.setStart_no(pz.getSkip());
		ls = admin_o2oQnADAO.search_All(search);
		mnv.addObject("ls", ls);
		mnv.addObject("pz", pz);
		mnv.addObject("search", search);
		return mnv;
	}
	// 1:1 문의 운영자 메일 답장 완료시 확인 페이지
	@RequestMapping("/admin_o2oQnA_list_reply.do")
	public ModelAndView admin_o2oQnA_list_reply(@ModelAttribute Admin_searchVO search, @RequestParam("pg") String pg) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_o2oQnA_list_reply");
		/*List<O2OQnAVO> ls = admin_o2oQnADAO.findAllAskWithRe();
		mnv.addObject("ls", ls);*/
		
		List<O2OQnAVO> ls = admin_o2oQnADAO.search_All2(search);
		PaginationDTO pz = new PaginationDTO().init(pg, ls.size()) ;
		search.setStart_no(pz.getSkip());
		ls = admin_o2oQnADAO.search_All2(search);
		mnv.addObject("ls", ls);
		mnv.addObject("pz", pz);
		mnv.addObject("search", search);
		return mnv;
	}
	// 1:1 문의 미답장 및 답장 페이지에서 자세한 문의 정보를 읽어들일 때 쓰는 페이지
	@RequestMapping("/admin_o2oQnA_read.do")
	public ModelAndView admin_o2oQnA_read( @ModelAttribute O2OQnAVO ovo ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_o2oQnA_read");
		O2OQnAVO vo = admin_o2oQnADAO.check_oneAsking(ovo);
		mnv.addObject("vo", vo);
		return mnv;
	}
	// 비회원의 1:1 문의를 이메일로 전송하는 페이지
	@RequestMapping("/admin_o2oQnA_Email.do")
	public ModelAndView admin_o2oQnA_Email( @ModelAttribute O2OQnAVO ovo ) throws Exception {
		ModelAndView mnv = new ModelAndView();
        String host = "smtp.gmail.com";
        String port = "587";
        String mailFrom = "multipro2018@gmail.com";
        String password = "rmfnpdlxm2";
       
        String created_time = ovo.getThe_time();
        String customer_email = ovo.getO2o_email();
        String customer_content = ovo.getO2o_content();
        String admin_reply = ovo.getRe_o2o_content();
        
        String subject = "안녕하세요 멀티 스페이스입니다. 고객님이 가지고 계신 "+ ovo.getO2o_type() +" 사항에 대한 문제의 문의 사항에 대한 답변입니다.";
        String message = "고객님의 문의 사항은 "+created_time+ " 에 작성해주신 \""+customer_content+"\" 였습니다.\n\n"
        				+ admin_reply +"\n\n\n\n 항상 멀티 스페이스를 이용해 주셔서 감사합니다.\n"
        				+ "\n본메일은 발신 전용입니다."
        				+ "\n문의사항이 있을 시 멀티스페이스의 1:1 문의로 문의 부탁드립니다."
        				+ "\n\n감사합니다.";
        
        String result_message = null;
        try {
        	
            EmailUtility.sendEmail(host, port, mailFrom, password, customer_email, subject,
            		message);
            result_message = "The e-mail was sent successfully";
            ovo.setRe_o2o_content(message);
            admin_o2oQnADAO.writeConsult(ovo);
        } catch (Exception e) {
            e.printStackTrace();
            result_message = "There were an error: " + e.getMessage();
        }
        
        mnv.setViewName("redirect:/admin_o2oQnA_list_reply_status.do?message="+result_message);
		return mnv;
	}
	// 이메일로 1:1 문의가 정상적으로 처리되었는지 확인 하는 페이지
	@RequestMapping("/admin_o2oQnA_list_reply_status.do")
	public ModelAndView admin_o2oQnA_list_reply_status( @RequestParam("message")String message  ) throws Exception {
		ModelAndView mnv = new ModelAndView("admin_o2oQnA_list_reply_status");
		mnv.addObject("message", message);
		return mnv;
	}
	
}