package multi.mypage.message.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.lang.UsesSunHttpServer;

import main.Controller;
import main.CookieValue;
import main.ModelAndView;
import main.ModelAttribute;
import main.PaginationDTO;
import main.RequestMapping;
import main.RequestParam;
import main.ResponseBody;
import main.vo.MessageVO;
import main.vo.UserVO;
import main.vo.User_clubVO;
import multi.mypage.message.dao.MessageDAO;
import multi.mypage.message.dao.UserDAO;
import multi.mypage.message.dao.User_clubDAO;
import multi.mypage.vo.Mypage_searchVO;

@Controller
public class CtrlMessage {

	@Autowired
	@Qualifier("mypage_message_UserDAO")
	private UserDAO UserDAO = null;

	@Autowired
	@Qualifier("mypage_message_MessageDAO")
	private MessageDAO MessageDAO = null;

	@Autowired
	@Qualifier("mypage_message_User_clubDAO")
	private User_clubDAO User_clubDAO = null;

	
	/* 180115수정
	 * 마이페이지에서 쪽지함 이동.
	 * 쪽지함은 기본으로 받은쪽지함 mypage_receive_message.jsp 가 나옴.
	 */
	@RequestMapping("/mypage_moveMypageReceiveMessagePage.do")
	public ModelAndView moveMypageReceiveMessagePage(@CookieValue("user_id") String user_id,
			@ModelAttribute Mypage_searchVO search,
			@RequestParam("pg") String pg) throws Exception {

		UserVO userInfo = UserDAO.find_userInfo(user_id);
		//List<MessageVO> receiveMessage = MessageDAO.find_receiveMessage(user_id);
		search.setUser_id(user_id);
		
		if (userInfo != null) {
			ModelAndView mnv = new ModelAndView("mypage_receive_message");
			List<MessageVO> receiveMessage = MessageDAO.search_receivemsg(search);
			PaginationDTO pz = new PaginationDTO().init(pg, receiveMessage.size());
			search.setStart_no(pz.getSkip());
			receiveMessage = MessageDAO.search_receivemsg(search);
			
			mnv.addObject("userInfo", userInfo);
			mnv.addObject("receiveMessage", receiveMessage);
			mnv.addObject("pz", pz);
			mnv.addObject("search", search);
			return mnv;
		} else {
			return null;
		}
	}

	/* 180115수정
	 * 받은 쪽지함에서 쪽지 클릭시 mypage_read_receive_message.jsp 에서 
	 * 쪽지 읽을 수 있음.
	 */
	@RequestMapping("/mypage_moveMypageReceiveMessageRead.do")
	public ModelAndView moveMypageReceiveMessageRead(@CookieValue("user_id") String user_id,
			@ModelAttribute MessageVO mvo) throws Exception {

		UserVO userInfo = UserDAO.find_userInfo(user_id);
		MessageVO receiveMessageRead = MessageDAO.read_receiveMessage(mvo);

		if (userInfo != null) {
			ModelAndView mnv = new ModelAndView("mypage_read_receive_message");
			mnv.addObject("userInfo", userInfo);
			mnv.addObject("receiveMessageRead", receiveMessageRead);
			return mnv;
		} else {
			return null;
		}

	}

	/* 180115수정
	 * 마이페이지에서 보낸쪽지함 mypage_send_message.jsp 로 이동
	 * 내가 보낸 쪽지 들이 보임
	 */
	@RequestMapping("/mypage_moveMypageSendMessagePage.do")
	public ModelAndView moveMypageSendMessagePage(@CookieValue("user_id") String user_id,
			@ModelAttribute Mypage_searchVO search,
			@RequestParam("pg") String pg) throws Exception {

		UserVO userInfo = UserDAO.find_userInfo(user_id);
		search.setUser_id(user_id);
		//List<MessageVO> sendMessage = MessageDAO.find_sendMessage(user_id);

		if (userInfo != null) {
			ModelAndView mnv = new ModelAndView("mypage_send_message");
			
			List<MessageVO> sendMessage = MessageDAO.search_sendmsg(search);
			PaginationDTO pz = new PaginationDTO().init(pg, sendMessage.size());
			search.setStart_no(pz.getSkip());
			sendMessage = MessageDAO.search_sendmsg(search);
			
			
			mnv.addObject("userInfo", userInfo);
			mnv.addObject("sendMessage", sendMessage);
			mnv.addObject("pz", pz);
			mnv.addObject("search", search);
			return mnv;
		} else {
			return null;
		}

	}

	/* 180115수정
	 * 보낸 쪽지함에서 쪽지 클릭시 mypage_read_send_message.jsp 에서
	 * 쪽지 읽을 수 있음.
	 */
	@RequestMapping("/mypage_moveMypageSendMessageRead.do")
	public ModelAndView moveMypageSendMessageRead(@CookieValue("user_id") String user_id, @ModelAttribute MessageVO mvo)
			throws Exception {

		UserVO userInfo = UserDAO.find_userInfo(user_id);
		MessageVO sendMessageRead = MessageDAO.read_sendMessage(mvo);

		if (userInfo != null) {
			ModelAndView mnv = new ModelAndView("mypage_read_send_message");
			mnv.addObject("userInfo", userInfo);
			mnv.addObject("sendMessageRead", sendMessageRead);
			return mnv;
		} else {
			return null;
		}

	}

	/* 180115수정
	 * 마이페이지에서 쪽지보내기 mypage_write_send_message.jsp 로 이동.
	 */
	@RequestMapping("/mypage_moveMypageWriteMessagePage.do")
	public ModelAndView moveMypageWriteMessagePage(@CookieValue("user_id") String user_id) throws Exception {

		UserVO userInfo = UserDAO.find_userInfo(user_id);
		List<User_clubVO> user_clubInfo = User_clubDAO.find_user_clubInfo(user_id);
		if (userInfo != null) {
			ModelAndView mnv = new ModelAndView("mypage_write_send_message");
			mnv.addObject("userInfo", userInfo);
			mnv.addObject("user_clubInfo", user_clubInfo);
			return mnv;
		} else {
			return null;
		}

	}

	
	/* 180115수정
	 * mypage_write_send_message.jsp 에서 ajax로 해당 유저가 가입한 클럽 리스트 찾아옴
	 * json으로 List를 보내기 때문에  앞에 {} 과 [] 붙여서 같이 return 함.
	 */
	@RequestMapping("/mypage_moveMypageWriteMessageFindUserClubMemberPage.do")
	@ResponseBody
	public String moveMypageWriteMessageFindUserClubMemberPage(@CookieValue("user_id") String user_id,
			@ModelAttribute User_clubVO ucvo) throws Exception {

		try{
			UserVO userInfo = UserDAO.find_userInfo(user_id);
			List<User_clubVO> user_club_MemberInfo = User_clubDAO.find_user_club_MemberInfo(ucvo);

			
			StringBuffer sb = null;
	
			for (User_clubVO vo : user_club_MemberInfo) {
	
				if (sb == null) {
					sb = new StringBuffer();
					sb.append("{data:[");
				} else {
					sb.append(",");
				}
				sb.append("'").append(vo.getUser_id()).append("'");
	
			}
			sb.append("]}");
			return sb.toString();
		}catch(Exception e){
			return null;
		}
	}

	
	/* 180115수정
	 * 성공적으로 쪽지 보내면 ajax로 성공 코드 리턴함.
	 * mypage_write_send_message.jsp 에서 모달로 띄움.
	 */
	@RequestMapping("/mypage_sendMessage.do")
	@ResponseBody
	public String sendMessage(@CookieValue("user_id") String user_id, HttpServletRequest request) throws Exception {

		String msg_content = request.getParameter("msg_content");
		String receive_user_id = request.getParameter("receive_user_id");
		
		UserVO userInfo = UserDAO.find_userInfo(user_id);
		MessageVO mvo = new MessageVO();

		if (userInfo != null) {
			mvo.setSend_user_id(user_id);
			mvo.setMsg_content(msg_content);
			mvo.setReceive_user_id(receive_user_id);
			
			MessageDAO.send_Message(mvo);
			return "30003";
		} else {
			return "error";
		}

	}
	
	@RequestMapping("/del_msg.do")
	public String del_msg(@RequestParam("msg_no") String msg_no,
			@RequestParam("flag") int flag) throws Exception{
		
		MessageDAO.del_msg(msg_no);
		if(flag==0){
			return "redirect:/mypage_moveMypageSendMessagePage.do";
		} else {
			return "redirect:/mypage_moveMypageReceiveMessagePage.do";
		}
	}
	

}