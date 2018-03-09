package multi.admin.dao;
 
import java.util.List; 

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.HostApplyVO;
import main.vo.HostVO;
import main.vo.UserVO;
import multi.admin.vo.Admin_Host_DowngradeVO;
import multi.admin.vo.Admin_searchVO;

public class Admin_HostDAO_MysqlImpl implements Admin_HostDAO {
	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	@Override
	public List<HostVO> host_findAll() throws Exception {
		return sqlSession.selectList("admin_host.p_admin_host_findAll");
	}
	
	@Override
	public List<HostApplyVO> host_request_findAll() throws Exception {
		return sqlSession.selectList("admin_host.p_admin_host_request_findAll");
	}

	@Override
	public HostApplyVO host_check( HostApplyVO hvo) throws Exception {
		return sqlSession.selectOne("admin_host.p_admin_host_one_person_check", hvo);
	}
	
	@Override
	public int host_user_accept( HostApplyVO hvo) throws Exception {
		return sqlSession.update("admin_host.p_admin_host_user_accept",hvo);
	}
	
	@Override
	public int host_user_refuse( HostApplyVO hvo) throws Exception {
		return sqlSession.delete("admin_host.p_admin_host_user_refuse",hvo);
	}
	
	@Override
	public int host_user_remove_request( HostApplyVO hvo) throws Exception {
		return sqlSession.delete("admin_host.p_admin_host_user_remove_request",hvo);
	}

	@Override
	public UserVO host_user_check( HostVO hvo) throws Exception {
		return sqlSession.selectOne("admin_host.p_admin_host_user_findUserInfo",hvo);
	}

	@Override
	public int host_user_downgrade( Admin_Host_DowngradeVO hvo) throws Exception {
		return sqlSession.update("admin_host.p_admin_host_user_downgrade",hvo);
	}

	@Override
	public int host_user_remove( HostVO hvo) throws Exception {
		return sqlSession.delete("admin_host.p_admin_host_user_remove",hvo);
	}

	@Override
	public List<HostVO> search_hosts(Admin_searchVO search) throws Exception {
		return sqlSession.selectList("admin_host.admin_search_host_user",search);
	}

	@Override
	public List<HostApplyVO> search_host_requests(Admin_searchVO search) throws Exception {
		return sqlSession.selectList("admin_host.admin_search_host_request_user",search);
	}

	
	



}
