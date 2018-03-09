package multi.mypage.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.UserVO;


public class UserDAO_MybatisProcImpl implements UserDAO{

	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;


	@Override
	public UserVO find_userInfo(String user_id) throws Exception {
		return sqlSession.selectOne("mypage_qna_proc.mypage_qnaFindUserInfo",user_id);
	}

}
