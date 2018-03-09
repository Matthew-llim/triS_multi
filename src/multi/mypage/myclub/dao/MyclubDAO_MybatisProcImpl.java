package multi.mypage.myclub.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.ClubVO;
import multi.mypage.vo.Mypage_searchVO;

public class MyclubDAO_MybatisProcImpl implements MyclubDAO{

	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null; 
	
	//내클럽찾기 
	@Override
	public List<ClubVO> find_myClub(String user_id) throws Exception{
		return sqlSession.selectList("myclub.p_myclub_find",user_id);
	}

	//내클럽찾기 페이징
	@Override
	public List<ClubVO> search_clubs(Mypage_searchVO search) throws Exception {
		return sqlSession.selectList("myclub.mypage_search_club",search);
	}
}
