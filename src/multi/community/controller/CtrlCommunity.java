package multi.community.controller;

import static main.Single.*;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import main.Controller;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import multi.community.board.dao.Community_boardDAO;


@Controller
public class CtrlCommunity {
   
	@RequestMapping("/community_list.do")
	   public ModelAndView community_list() throws Exception{
	         ModelAndView mnv = new ModelAndView("community_list");
	         return mnv;
	   }
}

