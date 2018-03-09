package multi.mypage.myreview.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.ReviewVO;
import multi.mypage.vo.Mypage_searchVO;

public class MPReviewDAO_MybatisProcImpl implements MPReviewDAO{

	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	//후기찾기
	@Override
	public List<ReviewVO> review_findAll(String user_id) throws Exception{
		return sqlSession.selectList("mypage_review.p_MPreview_find",user_id);
	}

	//후기찾기 페이징
	@Override
	public List<ReviewVO> search_reviews(Mypage_searchVO search) throws Exception {
		return sqlSession.selectList("mypage_review.mypage_search_review",search);
	}
}
