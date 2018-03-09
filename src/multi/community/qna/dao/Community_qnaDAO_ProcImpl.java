package multi.community.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import multi.community.qna.vo.Community_qnaVO;

public class Community_qnaDAO_ProcImpl implements Community_qnaDAO {
	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	@Override
	public List<Community_qnaVO> findAll(String user_id) throws Exception {
		
		return sqlSession.selectList("community.p_comm_qnaFindAllTexts");
	}

	@Override
	public Community_qnaVO findByPK(Community_qnaVO pvo) throws Exception {
		
		return sqlSession.selectOne("community.p_comm_qnaFindText",pvo);
	}

	@Override
	public int add(Community_qnaVO pvo) throws Exception {
	
		return sqlSession.insert("community.p_comm_qnaAddText",pvo);
	}

	@Override
	public int mod(Community_qnaVO pvo) throws Exception {
		
		return sqlSession.update("community.p_comm_modQna",pvo);
	}

	@Override
	public int delByPK(Community_qnaVO pvo) throws Exception {
		
		return sqlSession.delete("community.p_comm_DelQna",pvo);
	}

	@Override
	public int modView(Community_qnaVO pvo) throws Exception {
		
		return sqlSession.update("community.p_comm_modView",pvo);
	}

}
