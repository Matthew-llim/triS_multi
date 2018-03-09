package multi.admin.dao;
 
import java.util.List; 

import main.vo.Community_boardVO;
import main.vo.Community_board_repleVO;
import multi.admin.vo.Admin_community_searchVO;
import multi.admin.vo.Admin_searchVO;

public interface Admin_FreeboardDAO {
	
	public List<Community_boardVO> findAll() throws Exception;
	public Community_boardVO findByPK(Community_boardVO pvo) throws Exception;
	public int add(Community_boardVO pvo) throws Exception;
	public int delByPK(Community_boardVO pvo) throws Exception;
	public int mod(Community_boardVO pvo)throws Exception;
	public int incRecomLogic( Community_boardVO pvo ) throws Exception;
	public int incViewLogic(Community_boardVO pvo) throws Exception;
	public List<Community_board_repleVO> findAllreple (Community_board_repleVO pvo ) throws Exception;
	public int addReple(Community_board_repleVO pvo) throws Exception;
	public int delReple(Community_board_repleVO pvo) throws Exception;
	public int modReple(Community_board_repleVO pvo) throws Exception;
	public List<Community_boardVO> comm_board_search( Admin_community_searchVO pvo ) throws Exception;
	public List<Community_boardVO> searchAll(Admin_searchVO search) throws Exception;

}


