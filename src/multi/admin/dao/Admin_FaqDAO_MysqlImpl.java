package multi.admin.dao;
 
import java.util.List; 

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.FaqVO;
import multi.admin.vo.Admin_searchVO;

public class Admin_FaqDAO_MysqlImpl implements Admin_FaqDAO {
	
	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	@Override
	public List<FaqVO> findAll() throws Exception {
		return sqlSession.selectList("admin_faq.p_admin_faq_FindAllTexts");
	}
	
	@Override
	public FaqVO faq_read(FaqVO fvo) throws Exception {
		return sqlSession.selectOne("admin_faq.p_admin_faq_readFaq",fvo);
	}

	@Override
	public int faq_modify(FaqVO fvo) throws Exception {
		return sqlSession.update("admin_faq.p_admin_faq_modifyFaq",fvo);
	}

	@Override
	public int faq_remove(FaqVO fvo) throws Exception {
		return sqlSession.delete("admin_faq.p_admin_faq_delFaq",fvo);
	}
	
	@Override
	public int faq_add(FaqVO fvo) throws Exception {
		return sqlSession.insert("admin_faq.p_admin_faq_addFaq",fvo);
	}

	@Override
	public List<FaqVO> search_All(Admin_searchVO search) throws Exception {
		return sqlSession.selectList("admin_faq.admin_search_All",search);
	}




	


	

}
