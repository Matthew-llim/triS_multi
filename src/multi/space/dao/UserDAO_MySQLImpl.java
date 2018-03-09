package multi.space.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.UserVO;

public class UserDAO_MySQLImpl implements UserDAO{
	
	@Autowired @Qualifier("sqlSession")
	SqlSession sqlSession = null;
	
	@Override
	public UserVO find_user_by_user_id(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user_proc.find_user_by_user_id",user_id);
	}
	
}
