package multi.space.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.Space_qnaVO;
import multi.space.vo.Space_qna_searchVO;

public class Space_QnADAO_MybatisProcImpl implements Space_QnADAO{
	
	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession;
	
	@Override
	public Integer add_spaceQnA(Space_qnaVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("space_qna_proc.add_spaceQnA",vo);
	}

	@Override
	public List<Space_qnaVO> find_space_QnA_by_space_no(Space_qna_searchVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("space_qna_proc.find_spaceQnA_by_space_no",vo);
	}

	@Override
	public Integer delete_spaceQnA_by_spane_qna_no(Space_qnaVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete("space_qna_proc.delete_spaceQnA_by_space_qna_no",vo);
	}

	@Override
	public Space_qnaVO find_space_QnA_by_space_qna_no(Space_qnaVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("space_qna_proc.find_spaceQnA_by_space_qna_no",vo);
	}

	@Override
	public Integer mod_spaceQnA_by_spane_qna_no(Space_qnaVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("space_qna_proc.mod_spaceQnA_by_space_qna_no",vo);
	}
	
}
