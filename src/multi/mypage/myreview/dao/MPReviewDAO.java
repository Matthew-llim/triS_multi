package multi.mypage.myreview.dao;

import java.util.List;

import main.vo.ReviewVO;
import multi.mypage.vo.Mypage_searchVO;

public interface MPReviewDAO {
	public List<ReviewVO> review_findAll(String user_id) throws Exception;
	public List<ReviewVO> search_reviews(Mypage_searchVO search) throws Exception;
}
