package multi.community.board.dao;

import java.util.List;

import main.vo.Community_boardVO;

public interface Community_boardmytextDAO {
	public List<Community_boardVO> findAll( String user_id) throws Exception;

}
