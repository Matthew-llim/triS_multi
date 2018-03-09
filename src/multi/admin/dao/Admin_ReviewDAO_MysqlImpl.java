package multi.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.ReviewVO;
import multi.admin.vo.Admin_searchVO;

public class Admin_ReviewDAO_MysqlImpl implements Admin_ReviewDAO {

	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	@Override
	public List<ReviewVO> review_findAll() throws Exception {
		
		return sqlSession.selectList("admin_community_review.p_admin_comm_boardreviewFindAllTexts");
	}

	@Override
	public int remove_review(ReviewVO rvo) throws Exception {
		return sqlSession.delete("admin_community_review.p_admin_remove_Review",rvo);
	}

	@Override
	public List<ReviewVO> search_All(Admin_searchVO search) throws Exception {
		return sqlSession.selectList("admin_community_review.admin_search_All",search);
	}

}
