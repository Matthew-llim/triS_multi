package multi.temp.controller;

import java.util.List;
import static main.Single.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import main.Controller;
import main.ModelAndView;
import main.RequestMapping;
import main.RequestParam;

@Controller
public class CtrlSh {

	@RequestMapping("/hhhh.do")
	public ModelAndView login() throws Exception {
		ModelAndView mnv = new ModelAndView("hhhh");
		//	mnv.addObject("hi", "hi");
		return mnv;
	}
}