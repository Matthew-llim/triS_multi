package multi.community.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.Community_boardVO;

public class Community_boardmytextDAO_MybatisProcImpl implements Community_boardmytextDAO {

	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	@Override
	public List<Community_boardVO> findAll(String user_id) throws Exception {
		return sqlSession.selectList("community_board.p_comm_boardFindMyText",user_id);
	}
}
