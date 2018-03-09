package multi.community.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import multi.community.qna.vo.Community_qnaVO;



public class Community_qna_mytextDAO_ProcImpl implements Community_qna_mytextDAO{
	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	@Override
	public List<Community_qnaVO> findAll(String user_id) throws Exception {
		
		return sqlSession.selectList("community.p_comm_qna_findmytext",user_id);
	}

}
