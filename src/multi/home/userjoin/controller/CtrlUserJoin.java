package multi.home.userjoin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.RequestParam;
import main.ResponseBody;
import main.vo.UserVO;
import main.vo.ZipcodeVO;
import multi.home.userjoin.dao.UserJoinDAO;

/**
 * @author sb 회원가입
 */
@Controller
public class CtrlUserJoin {

	@Autowired
	@Qualifier("userJoinDAO")
	private UserJoinDAO userJoinDAO = null;

	////////////////////// 약관동의 시작///////////////////////
	@RequestMapping("/home_terms.do")
	public ModelAndView terms() throws Exception {

		ModelAndView mnv = new ModelAndView("home_terms");

		return mnv;
	}

	////////////////////// 약관동의 끝///////////////////////

	///////////////////// 회원가입 시작//////////////////////
	@RequestMapping("/home_user_join.do")
	public ModelAndView joinUser(@ModelAttribute UserVO uvo) throws Exception {

		ModelAndView mnv = new ModelAndView("home_user_join");

		return mnv;
	}

	// 회원가입 DAO실행하는 부분
	@RequestMapping("/home_user_join2.do")
	public String joinUser2(@ModelAttribute UserVO uvo, @RequestParam(value = "home") String r,
			@RequestParam(value = "num") String num, @RequestParam(value = "phone_cen") String phone_cen,
			@RequestParam(value = "phone_end") String phone_end) throws Exception {

		String e = uvo.getEmail() + "@" + r;
		uvo.setEmail(e);
		String phone = num + phone_cen + phone_end;
		uvo.setPhone(phone);
		
		userJoinDAO.addUser(uvo);
		return "redirect:/home_complete.do?user_id=" + uvo.getUser_id();
	}

	// 회원가입 완료 페이지
	@RequestMapping("/home_complete.do")
	public ModelAndView join_complete(@RequestParam("user_id") String user_id) throws Exception {

		ModelAndView mnv = new ModelAndView("home_complete");
		mnv.addObject("user_id", user_id);
		return mnv;
	}

	// 회원아이디 중복검사
	@RequestMapping("/overlap.do")
	@ResponseBody
	public String overlap(@ModelAttribute UserVO uvo) throws Exception {

		Integer r = userJoinDAO.ckId(uvo);
		return r.toString();
	}
	///////////////////// 회원가입 끝//////////////////////
	
	@RequestMapping("/findzipcode.do")
	@ResponseBody
	public String findzipcode(@ModelAttribute ZipcodeVO zvo) throws Exception{
		List<ZipcodeVO> rl = userJoinDAO.findZipcode(zvo);
		StringBuffer sb = new StringBuffer();
		sb.append("{ 'data' :[ ");
		int flag = 0;
		for(ZipcodeVO vo : rl){
			flag++;
			sb.append("{");
			sb.append("'zipcode'");
			sb.append(":");
			sb.append("'"+vo.getZipcode()+"',");
			sb.append("'sido'");
			sb.append(":");
			sb.append("'"+vo.getSido()+"',");
			sb.append("'gugun'");
			sb.append(":");
			sb.append("'"+vo.getGugun()+"',");
			sb.append("'dong'");
			sb.append(":");
			sb.append("'"+vo.getDong()+"',");
			sb.append("'bunji'");
			sb.append(":");
			sb.append("'"+vo.getBunji()+"'");
			sb.append("}");
			
			if(flag==rl.size()){
				
			} else{
				sb.append(",");
			}
		}
		sb.append("]}");
		return sb.toString();
	}
}
