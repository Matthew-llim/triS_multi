package multi.mypage.myinfo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.UserVO;
import main.vo.ZipcodeVO;

public class MyInfoDAO_MybatisProcImpl implements MyInfoDAO{

	@Autowired @Qualifier("sqlSession")
	private SqlSession  sqlSession = null; 
	
	//내정보수정들어갈때 패스워드확인
	@Override
	public int ckpass(UserVO uvo) throws Exception {
		return sqlSession.selectOne("myinfo.p_mypage_ckpass",uvo);
	}

	//내정보 갖고오기
	@Override
	public UserVO find_user(String user_id) throws Exception {
		return sqlSession.selectOne("myinfo.p_mypage_find_user",user_id);
	}

	//내정보수정쿼리
	@Override
	public int mod_user(UserVO uvo) throws Exception {
		return sqlSession.update("myinfo.p_mypage_mod_user",uvo);
	}

	//회원탈퇴
	@Override
	public int del_user(String user_id) throws Exception {
		return sqlSession.delete("myinfo.p_mypage_del_user",user_id);
	}


	@Override
	public ZipcodeVO find_zipcode(String zipcode) throws Exception {
		return sqlSession.selectOne("myinfo.zipcode_find",zipcode);
	}
}
