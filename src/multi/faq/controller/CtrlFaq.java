package multi.faq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.ModelAndView;
import main.RequestMapping;
import main.vo.FaqVO;
import multi.faq.dao.FaqDAO;

@Controller
public class CtrlFaq {

	@Autowired
	@Qualifier("faqDAO")
	private FaqDAO faqDAO = null;

	@RequestMapping("/faq_list.do")
	public ModelAndView faqList() throws Exception {
		List<FaqVO> rl = faqDAO.findAll();
		ModelAndView mnv = new ModelAndView("faq_list");
		mnv.addObject("rl", rl);
		return mnv;
	}


}
