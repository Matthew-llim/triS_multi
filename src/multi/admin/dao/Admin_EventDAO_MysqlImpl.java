package multi.admin.dao;
 
import java.util.List; 
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.EventVO;
import multi.admin.vo.Admin_searchVO;

public class Admin_EventDAO_MysqlImpl implements Admin_EventDAO {

	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;

	@Override
	public List<EventVO> findAll() throws Exception {
		return sqlSession.selectList("admin_event.p_admin_event_findAll");
	}

	@Override
	public int add(EventVO pvo) throws Exception {
		return sqlSession.insert("admin_event.p_admin_event_add", pvo );
	}
	
	@Override
	public int delByPK(EventVO pvo) throws Exception{
		return sqlSession.delete("admin_event.p_admin_event_delByPK", pvo);
	}
	@Override
	public EventVO getByPK(int pk) throws Exception {
		return sqlSession.selectOne("admin_event.p_admin_event_getByPK", pk );
	} 
	
	@Override
	public int mod(EventVO pvo) throws Exception {
		return sqlSession.update("admin_event.p_admin_event_mod", pvo );
	}

	@Override
	public List<EventVO> search_All(Admin_searchVO search) throws Exception {
		return sqlSession.selectList("admin_event.admin_search_All",search);
	} 
}


