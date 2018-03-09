package multi.mypage.myhost.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.HostVO;
import main.vo.SpaceVO;
import multi.mypage.vo.Mypage_searchVO;

public class MyHostDAO_MybatisProcImpl implements MyHostDAO {

	@Autowired @Qualifier("sqlSession")
	private SqlSession  sqlSession = null; 
	
	//판매자 여부확인
	@Override
	public int ckhost(String user_id) throws Exception {
		return sqlSession.selectOne("myhost.p_ckhost",user_id);
	}

	//판매자추가
	@Override
	public int addhost(HostVO hvo) throws Exception {
		return sqlSession.insert("myhost.p_addhost",hvo);
	}

	//판매자가 갖고있는 공간 찾기
	@Override
	public List<SpaceVO> findMySpace(String user_id) throws Exception {
		return sqlSession.selectList("myhost.p_findspaceBycrn",user_id);
	}

	//판매자가 갖고있는 공간 페이징
	@Override
	public List<SpaceVO> searchSpace(Mypage_searchVO search) throws Exception {
		return sqlSession.selectList("myhost.mypage_search_host",search);
	}

	@Override
	public int ckcrn(String crn) throws Exception {
		return sqlSession.selectOne("myhost.p_crn_overlap",crn);
	}

}
