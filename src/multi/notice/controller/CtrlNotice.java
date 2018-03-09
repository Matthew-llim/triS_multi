package multi.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.Controller;
import main.ModelAndView;
import main.ModelAttribute;
import main.RequestMapping;
import main.ResponseBody;
import multi.notice.dao.NoticeDAO;
import multi.notice.vo.NoticeVO;

@Controller
public class CtrlNotice {

	@Autowired @Qualifier("noticeDAO")
	private NoticeDAO noticeDAO = null;
	
	//공지사항 목록
	@RequestMapping("/notice_list.do")
	public ModelAndView notice_list() throws Exception {
		List<NoticeVO> rl = noticeDAO.findAll();
		ModelAndView mnv=new ModelAndView("notice_list");
		mnv.addObject("rl",rl);
		
		return mnv;
	}

	//공지사항 내용
	@RequestMapping("/notice_read.do")
	public ModelAndView notice_read(@ModelAttribute NoticeVO pvo) throws Exception {
		NoticeVO vo = noticeDAO.findByPK(pvo);
		ModelAndView mnv=new ModelAndView("notice_read");
		mnv.addObject("vo",vo);

		return mnv;
	}
}
