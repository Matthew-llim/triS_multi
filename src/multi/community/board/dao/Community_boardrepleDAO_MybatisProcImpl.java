package multi.community.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.Community_board_repleVO;

public class Community_boardrepleDAO_MybatisProcImpl implements  Community_boardrepleDAO{

	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	

	@Override
	public int addReple(Community_board_repleVO pvo) throws Exception {
		
		return sqlSession.insert("community_board.p_comm_boardrepleAdd",pvo);
	}

	@Override
	public int delReple(Community_board_repleVO pvo) throws Exception {
	
		return sqlSession.delete("community_board.p_comm_boardrepleDel",pvo);
	}

	@Override
	public int modReple(Community_board_repleVO pvo) throws Exception {
		return sqlSession.update("community_board.p_comm_boradrepleMod",pvo);
	}

	@Override
	public List<Community_board_repleVO> findAllreple( Community_board_repleVO pvo) throws Exception {
		
		return sqlSession.selectList("community_board.p_comm_boradrepleFindAllTexts",pvo);
	}

}
