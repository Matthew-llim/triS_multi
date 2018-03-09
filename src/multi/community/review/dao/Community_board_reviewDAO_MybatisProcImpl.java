package multi.community.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.ReviewVO;

public class Community_board_reviewDAO_MybatisProcImpl implements Community_board_reviewDAO {

	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	@Override
	public List<ReviewVO> review_findAll(Map<String, Integer> map) throws Exception {
		
		return sqlSession.selectList("community_review.p_comm_boardreviewFindAllTexts",map);
	}

}
