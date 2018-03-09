package multi.community.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import multi.community.qna.vo.Community_qnaVO;
import multi.community.qna.vo.Community_qna_searchVO;

public class Community_qna_searchDAO_ProcImpl implements Community_qna_searchDAO{
	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	@Override
	public List<Community_qnaVO> comm_qna_search(Community_qna_searchVO pvo) throws Exception {
		
		return sqlSession.selectList("community.comm_qna_search",pvo);
	}

}
