package multi.community.board.dao;

import java.util.List;

import main.vo.Community_board_repleVO;

public interface Community_boardrepleDAO {
	
	public List<Community_board_repleVO> findAllreple (  Community_board_repleVO pvo ) throws Exception;
	public int addReple(Community_board_repleVO pvo) throws Exception;
	public int delReple(Community_board_repleVO pvo) throws Exception;
	public int modReple(Community_board_repleVO pvo) throws Exception;

	

}
