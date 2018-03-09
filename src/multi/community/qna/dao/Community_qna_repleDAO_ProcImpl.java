package multi.community.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import multi.community.qna.vo.Community_qna_repleVO;

public class Community_qna_repleDAO_ProcImpl implements Community_qna_repleDAO {
	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	@Override
	public List<Community_qna_repleVO> findAllReple(Community_qna_repleVO rpl) throws Exception {
		
		return sqlSession.selectList("community.p_comm_qnaFindAllReple",rpl);
	}
	
	@Override
	public int addReple(Community_qna_repleVO pvo) throws Exception {
		
		return sqlSession.insert("community.p_comm_qnaAddReple",pvo);
	}

	@Override
	public int delReple(Community_qna_repleVO pvo) throws Exception {
		
		return sqlSession.delete("community.p_comm_qnaDelReple",pvo);
	}

	@Override
	public int modReple(Community_qna_repleVO pvo) throws Exception {
		
		return sqlSession.update("community.p_comm_modQnaReple",pvo);
	}

	@Override
	public int incRecom(Community_qna_repleVO pvo) throws Exception {

		return sqlSession.update("community.p_comm_qnaincRecom",pvo);
	}

	
}
