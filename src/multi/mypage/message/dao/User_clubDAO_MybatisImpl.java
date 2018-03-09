package multi.mypage.message.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.User_clubVO;

public class User_clubDAO_MybatisImpl implements User_clubDAO{
	
	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	@Override
	public List<User_clubVO> find_user_clubInfo(String user_id) {
		return sqlSession.selectList("mypage_message.mypage_message_findUserClub",user_id);
	}

	@Override
	public List<User_clubVO> find_user_club_MemberInfo(User_clubVO ucvo) {
		return sqlSession.selectList("mypage_message.mypage_message_findUserClubMember",ucvo);
	}

}
