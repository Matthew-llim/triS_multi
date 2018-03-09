package multi.event.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.EventVO;
import multi.event.vo.Event_searchVO;



public class EventDAO_MysqlImpl implements EventDAO {

	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;

	@Override
	public List<EventVO> findAll() throws Exception {
		return sqlSession.selectList("event.p_event_findAll");
	}

	@Override
	public int add(EventVO pvo) throws Exception {
		return sqlSession.insert("event.p_event_add", pvo );
	}
	
	@Override
	public int delByPK(EventVO pvo) throws Exception{
		return sqlSession.delete("event.p_event_delByPK", pvo);
	}
	@Override
	public EventVO getByPK(int pk) throws Exception {
		return sqlSession.selectOne("event.p_event_getByPK", pk );
	} 
	
	@Override
	public int mod(EventVO pvo) throws Exception {
		return sqlSession.update("event.p_event_mod", pvo );
	}

	@Override
	public List<EventVO> search(Event_searchVO svo) throws Exception {
		
		return sqlSession.selectList("search_event", svo);	
	} 
}


