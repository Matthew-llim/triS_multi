package multi.space.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.HostVO;

public class HostDAO_MybatisProcImpl implements HostDAO{

	@Autowired @Qualifier("sqlSession")
	SqlSession sqlSession = null;
	
	@Override
	public List<HostVO> find_host_by_user_id(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("host_proc.find_host_by_user_id",user_id);
	}

}
