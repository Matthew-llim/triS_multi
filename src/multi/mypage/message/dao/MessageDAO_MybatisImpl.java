package multi.mypage.message.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.MessageVO;
import multi.mypage.vo.Mypage_searchVO;

public class MessageDAO_MybatisImpl implements MessageDAO{

	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	@Override
	public List<MessageVO> find_receiveMessage(String user_id) {
		return sqlSession.selectList("mypage_message.mypage_message_findReceiveMessage",user_id);
	}

	@Override
	public MessageVO read_receiveMessage(MessageVO mvo) {
		return sqlSession.selectOne("mypage_message.mypage_message_readReceiveMessage",mvo);
	}

	@Override
	public List<MessageVO> find_sendMessage(String user_id) {
		return sqlSession.selectList("mypage_message.mypage_message_findSendMessage",user_id);
	}

	@Override
	public MessageVO read_sendMessage(MessageVO mvo) {
		return sqlSession.selectOne("mypage_message.mypage_message_readSendMessage",mvo);
	}

	@Override
	public int send_Message(MessageVO pvo) {
		return sqlSession.insert("mypage_message.mypage_message_SendMessage",pvo);
	}

	@Override
	public List<MessageVO> search_receivemsg(Mypage_searchVO search) throws Exception {
		return sqlSession.selectList("mypage_message.mypage_search_receive_msg",search);
	}

	@Override
	public List<MessageVO> search_sendmsg(Mypage_searchVO search) throws Exception {
		return sqlSession.selectList("mypage_message.mypage_search_send_msg",search);
	}

	@Override
	public int del_msg(String msg_no) throws Exception {
		return sqlSession.delete("mypage_message.mypage_del_msg",msg_no);
	}
	

	

}
