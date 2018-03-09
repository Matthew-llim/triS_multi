package multi.admin.dao;
 
import java.util.List; 

import main.vo.ClubVO;
import main.vo.User_clubVO;
import multi.admin.vo.Admin_searchVO;


public interface Admin_ClubDAO {
	public List<ClubVO> findAllClub() throws Exception;
	public int removeClub( ClubVO cvo ) throws Exception;
	public ClubVO check_specific_Club( ClubVO cvo ) throws Exception;
	public List<User_clubVO> check_joined_Users(ClubVO cvo) throws Exception;
	public List<ClubVO> club_search(Admin_searchVO pvo) throws Exception;
}
