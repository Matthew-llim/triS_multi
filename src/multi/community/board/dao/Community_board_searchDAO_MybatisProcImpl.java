package multi.community.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.Community_boardVO;
import multi.community.board.vo.Community_board_searchVO;

public class Community_board_searchDAO_MybatisProcImpl implements Community_board_searchDAO {
	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	@Override
	public List<Community_boardVO> comm_board_search(Community_board_searchVO pvo) throws Exception {
		
		return sqlSession.selectList("community_board.comm_boradSearch",pvo);
	}

}
