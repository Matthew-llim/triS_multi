package multi.admin.dao;
 
import java.util.List; 

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.O2OQnAVO;
import multi.admin.vo.Admin_searchVO;


public class Admin_o2oQnADAO_MysqlImpl implements Admin_o2oQnADAO{
	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	@Override
	public List<O2OQnAVO> findAllAskWithNoRe() throws Exception {
		return sqlSession.selectList("admin_o2oQnA.p_admin_o2oQnA_findAll_noRe");
	}

	@Override
	public List<O2OQnAVO> findAllAskWithRe() throws Exception {
		return sqlSession.selectList("admin_o2oQnA.p_admin_o2oQnA_findAll_Re");
	}
	
	@Override
	public int addAsking( O2OQnAVO ovo ) throws Exception {
		return sqlSession.insert("admin_o2oQnA.p_admin_o2oQnA_add", ovo );
	}

	@Override
	public O2OQnAVO check_oneAsking(O2OQnAVO ovo) throws Exception {
		return sqlSession.selectOne("admin_o2oQnA.p_admin_o2oQnA_checkOne",ovo);
	}

	@Override
	public int writeConsult(O2OQnAVO ovo) throws Exception {
		return sqlSession.update("admin_o2oQnA.p_admin_writeConsult",ovo);
	}

	@Override
	public List<O2OQnAVO> search_All(Admin_searchVO search) throws Exception {
		return sqlSession.selectList("admin_o2oQnA.admin_search_All",search);
	}

	@Override
	public List<O2OQnAVO> search_All2(Admin_searchVO search) throws Exception {
		return sqlSession.selectList("admin_o2oQnA.admin_search_All2",search);
	}



}
