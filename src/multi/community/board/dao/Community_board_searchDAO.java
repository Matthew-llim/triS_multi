package multi.community.board.dao;

import java.util.List;

import main.vo.Community_boardVO;
import multi.community.board.vo.Community_board_searchVO;

public interface Community_board_searchDAO {
	
	public List<Community_boardVO> comm_board_search(Community_board_searchVO pvo) throws Exception;

}
