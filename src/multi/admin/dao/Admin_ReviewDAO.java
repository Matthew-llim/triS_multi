package multi.admin.dao;

import java.util.List;

import main.vo.ReviewVO;
import multi.admin.vo.Admin_searchVO;

public interface Admin_ReviewDAO {
	public List<ReviewVO> review_findAll() throws Exception;
	public int remove_review(ReviewVO rvo) throws Exception;
	public List<ReviewVO> search_All(Admin_searchVO search) throws Exception;

}
