package multi.mypage.message.dao;

import java.util.List;

import main.vo.MessageVO;
import multi.mypage.vo.Mypage_searchVO;

public interface MessageDAO {

	public List<MessageVO> find_receiveMessage(String user_id);
	public MessageVO read_receiveMessage(MessageVO mvo);
	public List<MessageVO> find_sendMessage(String user_id);
	public MessageVO read_sendMessage(MessageVO mvo);
	public int send_Message(MessageVO pvo);
	
	public List<MessageVO> search_receivemsg(Mypage_searchVO search) throws Exception;
	public List<MessageVO> search_sendmsg(Mypage_searchVO search) throws Exception;
	
	public int del_msg(String msg_no) throws Exception;	
	
}
