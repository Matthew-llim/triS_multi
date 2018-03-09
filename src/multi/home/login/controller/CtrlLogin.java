package multi.home.login.controller;

import java.net.URLEncoder;
import java.util.List;
import static main.Single.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.RequestParam;
import main.ResponseBody;
import multi.home.login.dao.UserDAO;
import main.vo.UserVO;

@Controller
public class CtrlLogin {

	@Autowired	@Qualifier("home_login_UserDAO")
	private UserDAO UserDAO = null;


	/* 180115수정
	 * 모든 페이지에서 top-nav의 ajaxGet으로 인해 chk_login.do 실행됨.
	 * chk_login.do 통해서 로그인 여부 판별
	 * 로그인 했을 시 user_name 리턴!
	 */
	@RequestMapping("/chk_login.do")
	@ResponseBody
	public String chk_login(@CookieValue("user_id") String user_id) throws Exception {

		UserVO userInfo = UserDAO.find_userInfo(user_id);
		if( userInfo == null ){ //로그인을 안했으면
			return "10002";
		}
		else{ // 로그인을 했으면
			String user_name = userInfo.getUser_name();
			return user_name;
		}
		
	}
	
	/* 180115수정
	 * ※ 페이지 이동 순서 
	 *  1) main.html -> login 페이지 -> 로그인 시 main.do로 인해 main.jsp로 이동.
	 *  개발 순서상 main.html에 ajax붙이는 작업을 뒤에서 하게 되어서 main.jsp와 main.html이 
	 *  나눠지게 되었음. 나중에 main 페이지 하나로 만드는 작업 추가할 예정(아마..)
	 */
	@RequestMapping("/main.do")
	public Object main(@CookieValue("user_id") String user_id) throws Exception {

		UserVO userInfo = UserDAO.find_userInfo(user_id);
		int ckAdmin = userInfo.getGrade();
		if (user_id != null) {
			ModelAndView mnv = new ModelAndView("main");
			mnv.addObject("userInfo", userInfo);
			mnv.addObject("user_name", userInfo.getUser_name());
			mnv.addObject("top_nav_code", "20000");
			mnv.addObject("ckAdmin", ckAdmin);
			return mnv;
		}else {
			return "redirect:/main.html";
		}
	}

	/* 180115수정
	 * top_nav 에서 로그인 클릭시 로그인페이지로 이동
	 * 이때, 로그인 버튼 클릭시 cookie로 code값 받아옴.
	 * code값 비교해서, 로그인 실패시 로그인실패 모달 띄우기 위해  chkcode addObject 함.
	 * addObject 후 code값에 "" 넣어줌.
	 */
	@RequestMapping("/home_moveLoginPage.do")
	public ModelAndView moveLoginPage(@CookieValue("code") String code,HttpServletResponse response) throws Exception {
		

		if (code == null||code == "") {
			ModelAndView mnv = new ModelAndView("home_login");
			return mnv;
		} else if (code.equals("10001")) {
			ModelAndView mnv = new ModelAndView("home_login");
			mnv.addObject("chkcode","10001");
			Cookie ck = new Cookie("code","");
			response.addCookie(ck);
			return mnv;
		} else {
			return null;
		}

	}

	
	/* 180115수정
	 * home_login.jsp 에서 로그인 버튼 누를시 실행
	 * user_id 와 passwd 받아와서 로그인함.
	 * 로그인 성공시 main.do 실행 ( main.jsp로 이동 )
	 */
	@RequestMapping("/home_login.do")
	public Object login(@ModelAttribute UserVO uvo, HttpServletResponse response) throws Exception {

		UserVO userInfo = UserDAO.find_user(uvo);

		if (userInfo != null && uvo.getUser_id().equals(userInfo.getUser_id())
				&& uvo.getPasswd().equals(userInfo.getPasswd())) {
			Cookie ck = new Cookie("user_id", userInfo.getUser_id());
			response.addCookie(ck);

			return "redirect:/main.do";
			//user_id 와 passwd가 제대로 맞으면 로그인 성공 -> cookie에 code가 없다.
			
		} else {
			//user_id 와 passwd가 제대로 맞지 않으면 로그인 실패 -> code 값이 10001
			Cookie ck = new Cookie("code", "10001");
			response.addCookie(ck);
			return "redirect:/home_moveLoginPage.do";
		}

	}
	
	/* 180115수정
	 * Id찾기 페이지 (home_findId.jsp) 로 이동
	 */
	@RequestMapping("/home_moveFindIdPage.do")
	public ModelAndView moveFindIdPage() throws Exception {
		ModelAndView mnv = new ModelAndView("home_findId");
		return mnv;

	}
	
	
	/* 180115수정
	 * home_findId.jsp 에서 이름,ssn1,ssn2 입력하고 아이디 찾기 버튼 누를시
	 * ajax를 통해서 user_id값 리턴.
	 * 따라서, 입력한 값들은 getParameter로 받아옴.
	 * userInfo 있을시에만 returnd 으로 user_id값 반환
	 * 예외처리 위해 try ~ catch 씌워줌 
	 */
	@RequestMapping("/home_findId.do")
	@ResponseBody
	public String findId(HttpServletRequest request) throws Exception {
		
		String user_name = request.getParameter("user_name");
		String ssn1 = request.getParameter("ssn1");
		String ssn2 = request.getParameter("ssn2");
		
		UserVO uvo = new UserVO();
		uvo.setUser_name(user_name);
		uvo.setSsn1(ssn1);
		uvo.setSsn2(ssn2);

		UserVO userInfo = UserDAO.find_userId(uvo);
		
		try{
			if(userInfo!=null){
				return userInfo.getUser_id();				
			}
			else{
				return "error";
			}
		} catch (Exception e) {
			return "error";
		}
	}
	
	
	/* 180115수정
	 * Passwd찾기 페이지 (home_findPasswd.jsp) 로 이동
	 */
	@RequestMapping("/home_moveFindPasswdPage.do")
	public ModelAndView moveFindPasswdPage() throws Exception {

		ModelAndView mnv = new ModelAndView("home_findPasswd");
		return mnv;

	}
	
	
	/* 180115수정
	 * home_findPasswd.jsp 에서 이름,user_id,ssn1,ssn2 입력하고 아이디 찾기 버튼 누를시
	 * ajax를 통해서 passwd값 리턴.
	 * 따라서, 입력한 값들은 getParameter로 받아옴.
	 * userInfo 있을시에만 returnd 으로 passwd값 반환
	 * 예외처리 위해 try ~ catch 씌워줌 
	 */
	@RequestMapping("/home_findPassswd.do")
	@ResponseBody
	public String findPasswd(HttpServletRequest request) throws Exception {	
		
		UserVO uvo = new UserVO();
		
		String user_id = request.getParameter("user_id");
		String user_name = request.getParameter("user_name");
		String ssn1 = request.getParameter("ssn1");
		String ssn2 = request.getParameter("ssn2");
		
		uvo.setUser_id(user_id);
		uvo.setUser_name(user_name);
		uvo.setSsn1(ssn1);
		uvo.setSsn2(ssn2);
		
		UserVO userInfo = UserDAO.find_userPasswd(uvo);
		
		
		try{
			if(userInfo!=null){
				return userInfo.getPasswd();				
			}
			else{
				return "error";
			}
		} catch (Exception e) {
			return null;
		}
	}
	
	
	/* 180115수정
	 * 로그아웃기능.
	 * 로그아웃 시, user_id에 ""값을 넣어 쿠키에 추가한다.
	 */
	 @RequestMapping("/home_logout.do")
	   public String logout( HttpServletResponse response) throws Exception{
		 		 
	      Cookie ck = new Cookie("user_id","");
	      response.addCookie(ck);
	      
	      return "redirect:/main.html";
	   }
	   
	   
	

}