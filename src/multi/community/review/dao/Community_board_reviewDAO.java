package multi.community.review.dao;

import java.util.List;
import java.util.Map;

import main.vo.ReviewVO;

public interface Community_board_reviewDAO {
	public List<ReviewVO> review_findAll(Map<String, Integer> map) throws Exception;

}
