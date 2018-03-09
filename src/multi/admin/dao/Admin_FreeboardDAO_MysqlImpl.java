package multi.admin.dao;
 
import java.util.List; 
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.Community_boardVO;
import main.vo.Community_board_repleVO;
import multi.admin.vo.Admin_community_searchVO;
import multi.admin.vo.Admin_searchVO;

public class Admin_FreeboardDAO_MysqlImpl implements Admin_FreeboardDAO {
	
	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	@Override
	public List<Community_boardVO> findAll() throws Exception {
		return sqlSession.selectList("admin_free_board.p_admin_comm_boardFindAllTexts");
	}


	@Override
	public Community_boardVO findByPK(Community_boardVO pvo) throws Exception {
		return sqlSession.selectOne("admin_free_board.p_admin_comm_boardFindText",pvo);
	}


	@Override
	public int add(Community_boardVO pvo) throws Exception {
		return sqlSession.insert("admin_free_board.p_admin_comm_boardAdd",pvo);
	}


	@Override
	public int delByPK(Community_boardVO pvo) throws Exception {
		
		return sqlSession.delete("admin_free_board.p_admin_comm_boardDelByPK",pvo);
	}


	@Override
	public int mod(Community_boardVO pvo) throws Exception {
	
		return sqlSession.update("admin_free_board.p_admin_comm_boardMod",pvo);
	}


	@Override
	public int incRecomLogic(Community_boardVO pvo) throws Exception {
		
		return sqlSession.update("admin_free_board.p_admin_comm_boardIncRecomLogic",pvo);
	}


	@Override
	public int incViewLogic(Community_boardVO pvo) throws Exception {
		
		return sqlSession.update("admin_free_board.p_admin_comm_boardIncViewLogic",pvo);
	}
	
	@Override
	public int addReple(Community_board_repleVO pvo) throws Exception {
		
		return sqlSession.insert("admin_free_board.p_admin_comm_boardrepleAdd",pvo);
	}

	@Override
	public int delReple(Community_board_repleVO pvo) throws Exception {
	
		return sqlSession.delete("admin_free_board.p_admin_comm_boardrepleDel",pvo);
	}

	@Override
	public int modReple(Community_board_repleVO pvo) throws Exception {
		return sqlSession.update("admin_free_board.p_admin_comm_boradrepleMod",pvo);
	}

	@Override
	public List<Community_board_repleVO> findAllreple(Community_board_repleVO pvo) throws Exception {
		
		return sqlSession.selectList("admin_free_board.p_admin_comm_boradrepleFindAllTexts",pvo);
	}


	@Override
	public List<Community_boardVO> comm_board_search(Admin_community_searchVO pvo) throws Exception {
		return sqlSession.selectList("admin_free_board.admin_freeboard_search",pvo);
	}


	@Override
	public List<Community_boardVO> searchAll(Admin_searchVO search) throws Exception {
		return sqlSession.selectList("admin_free_board.admin_freeboard_search",search);
	}


}
