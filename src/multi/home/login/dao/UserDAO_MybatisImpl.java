package multi.home.login.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.UserVO;

public class UserDAO_MybatisImpl implements UserDAO{

	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;

	@Override
	public UserVO find_user(UserVO uvo) throws Exception {
		return sqlSession.selectOne("home_login.home_login",uvo);
	}
	@Override
	public UserVO find_userInfo(String user_id) throws Exception {
		return sqlSession.selectOne("home_login.home_loginFindUserInfo",user_id);
	}
	@Override
	public UserVO find_userId(UserVO uvo) throws Exception {
		return sqlSession.selectOne("home_login.home_loginFind_userId",uvo);
	}
	@Override
	public UserVO find_userPasswd(UserVO uvo) throws Exception {
		return sqlSession.selectOne("home_login.home_loginFind_userPasswd",uvo);
	}

}
