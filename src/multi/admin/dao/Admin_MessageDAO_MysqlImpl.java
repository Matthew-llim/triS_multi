package multi.admin.dao;
 
import java.util.List; 

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.MessageVO;
import multi.admin.vo.Admin_searchVO;

public class Admin_MessageDAO_MysqlImpl implements Admin_MessageDAO{
	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	@Override
	public int writing_message(MessageVO mvo) throws Exception {
		return sqlSession.insert("admin_message.p_admin_message_write",mvo);
	}
	@Override
	public List<MessageVO> findAllGetMessages() throws Exception {
		return sqlSession.selectList("admin_message.p_admin_get_Allmessage");
	}
	@Override
	public List<MessageVO> findToGetMessages() throws Exception {
		return sqlSession.selectList("admin_message.p_admin_to_Allmessage");
	}
	@Override
	public List<MessageVO> search_All(Admin_searchVO search) throws Exception {
		return sqlSession.selectList("admin_message.admin_search_All",search);
	}
	
}
