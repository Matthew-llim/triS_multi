package multi.admin.dao;
 
import java.util.List; 

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.ClubVO;
import main.vo.UserVO;
import main.vo.User_clubVO;
import multi.admin.vo.Admin_searchVO;


public class Admin_ClubDAO_MysqlImpl implements Admin_ClubDAO {
	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	@Override
	public List<ClubVO> findAllClub() throws Exception {
		return sqlSession.selectList("admin_club.p_admin_club_FindAllClubs");
	}

	@Override
	public int removeClub(ClubVO cvo) throws Exception {
		return sqlSession.delete("admin_club.p_admin_club_Remove",cvo);
	}

	@Override
	public ClubVO check_specific_Club(ClubVO cvo) throws Exception {
		return sqlSession.selectOne("admin_club.p_admin_club_FindSpecificClub", cvo);
	}

	@Override
	public List<User_clubVO> check_joined_Users(ClubVO cvo) {
		return sqlSession.selectList("admin_club.p_admin_club_FindjoinedUsers",cvo);
	}

	@Override
	public List<ClubVO> club_search(Admin_searchVO pvo) throws Exception {
		return sqlSession.selectList("admin_club.admin_clubs_search",pvo);
	}


}
