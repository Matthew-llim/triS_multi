package multi.mypage.qna.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.Space_qnaVO;
import main.vo.Space_qna_repleVO;

public class Space_qna_repleDAO_MybatisImpl implements Space_qna_repleDAO{
	
	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;

	@Override
	public Space_qna_repleVO find_qna_repleInfo(String space_qna_no) throws Exception {
		return sqlSession.selectOne("mypage_qna.mypage_qna_qna_repleInfo",space_qna_no);
	}

}
