package multi.space.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.ReviewVO;
import multi.space.vo.Review_searchVO;

public class ReviewDAO_MySQLImpl implements ReviewDAO{
	
	@Autowired @Qualifier("sqlSession")
	SqlSession sqlSession = null;

	@Override
	public Integer add_review(ReviewVO vo) throws Exception {
		return sqlSession.insert("review.add_review",vo);
	}

	@Override
	public List<ReviewVO> find_review_by_space_no(Review_searchVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("review.find_review_by_space_no",vo);
	}

	@Override
	public Integer del_review(ReviewVO reviewVO) throws Exception {
		return sqlSession.delete("review.del_review_by_review_no",reviewVO);
		
	}

	@Override
	public ReviewVO find_review_by_review_no(ReviewVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("review.find_review_by_review_no",vo);
	}
}
