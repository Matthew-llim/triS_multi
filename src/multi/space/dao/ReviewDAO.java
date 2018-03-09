package multi.space.dao;

import java.util.List;

import main.vo.ReviewVO;
import multi.space.vo.Review_searchVO;


public interface ReviewDAO {
	public Integer add_review(ReviewVO vo) throws Exception;
	public List<ReviewVO> find_review_by_space_no(Review_searchVO vo) throws Exception;
	public Integer del_review(ReviewVO reviewVO) throws Exception;
	public ReviewVO find_review_by_review_no(ReviewVO vo) throws Exception;
}
