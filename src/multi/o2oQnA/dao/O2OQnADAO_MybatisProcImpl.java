package multi.o2oQnA.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.O2OQnAVO;

public class O2OQnADAO_MybatisProcImpl implements O2OQnADAO{

	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	@Override
	public int o2oQnAadd(O2OQnAVO pvo) throws Exception {
		
		return sqlSession.insert("o2oQnA.p_o2oQnA_addo2oQnA",pvo);
	}

}
