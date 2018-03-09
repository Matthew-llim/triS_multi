package multi.admin.dao;
 
import java.util.List; 

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.HostVO;
import main.vo.SpaceVO;
import multi.admin.vo.Admin_searchVO;

public class Admin_SpaceDAO_MysqlImpl implements Admin_SpaceDAO{
	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	public List<SpaceVO> findHostPlaces( SpaceVO svo ) throws Exception {
		return sqlSession.selectList("admin_space.p_admin_host_space_check",svo);
	}

	@Override
	public List<SpaceVO> host_spaces_search( Admin_searchVO pvo ) {
		return sqlSession.selectList("admin_space.admin_space_search",pvo);
	}

	@Override
	public int removeSpace(SpaceVO svo) throws Exception {
		return sqlSession.delete("admin_space.p_admin_remove_Space", svo);
	}

	@Override
	public HostVO space_crn_check(SpaceVO svo) throws Exception {
		return sqlSession.selectOne("admin_space.p_admin_space_crn_check",svo);
	}

	@Override
	public List<SpaceVO> search_All_specific_host(Admin_searchVO search) throws Exception {
		return sqlSession.selectList("admin_space.admin_search_All_specific_host",search);
	}

}
