package multi.o2oQnA.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.vo.O2OQnAVO;
import multi.o2oQnA.dao.O2OQnADAO;

@Controller
public class CtrlO2OQnA {

	 @Autowired  @Qualifier("o2oQnADAO") 
	 private O2OQnADAO o2oQnADAO = null;

	@RequestMapping("/o2oQnA_add.do") 
	 public ModelAndView o2oQnAadd(@ModelAttribute O2OQnAVO pvo) throws Exception{
	 ModelAndView mnv = new ModelAndView("o2oQnA_add2"); 
	 return mnv; 
	 }
	
	 @RequestMapping("/o2oQnA_add2.do") 
	 public String o2oQnAadd2(@ModelAttribute O2OQnAVO pvo) throws Exception{
		 o2oQnADAO.o2oQnAadd(pvo);
	 return "redirect:/faq_list.do"; 
	 }
	 
}
