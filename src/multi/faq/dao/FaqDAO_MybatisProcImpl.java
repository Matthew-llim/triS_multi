package multi.faq.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.FaqVO;

public class FaqDAO_MybatisProcImpl implements FaqDAO {
	
	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	
	@Override
	public List<FaqVO> findAll() throws Exception {
		return sqlSession.selectList("faq.p_faq_FindAllTexts");
	}


	


	

}
