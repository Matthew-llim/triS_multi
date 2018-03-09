package multi.admin.dao;
 
import java.util.List; 

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.Community_qnaVO;
import main.vo.Community_qna_repleVO;
import multi.admin.vo.Admin_community_searchVO;
import multi.admin.vo.Admin_searchVO;

public class Admin_QnaDAO_MysqlImpl implements Admin_QnaDAO{

	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	@Override
	public List<Community_qnaVO> findAll() throws Exception {
		
		return sqlSession.selectList("admin_qna.p_admin_comm_qnaFindAllTexts");
	}

	@Override
	public Community_qnaVO findByPK(Community_qnaVO pvo) throws Exception {
		
		return sqlSession.selectOne("admin_qna.p_admin_comm_qnaFindText",pvo);
	}

	@Override
	public int add(Community_qnaVO pvo) throws Exception {
	
		return sqlSession.insert("admin_qna.p_admin_comm_qnaAddText",pvo);
	}

	@Override
	public int mod(Community_qnaVO pvo) throws Exception {
		
		return sqlSession.update("admin_qna.p_admin_comm_modQna",pvo);
	}

	@Override
	public int delByPK(Community_qnaVO pvo) throws Exception {
		
		return sqlSession.delete("admin_qna.p_admin_comm_DelQna",pvo);
	}

	@Override
	public int modView(Community_qnaVO pvo) throws Exception {
		
		return sqlSession.update("admin_qna.p_admin_comm_modView",pvo);
	}
	@Override
	public List<Community_qna_repleVO> findAllReple(Community_qna_repleVO rpl) throws Exception {
		
		return sqlSession.selectList("admin_qna.p_admin_comm_qnaFindAllReple",rpl);
	}
	
	@Override
	public int addReple(Community_qna_repleVO pvo) throws Exception {
		
		return sqlSession.insert("admin_qna.p_admin_comm_qnaAddReple",pvo);
	}

	@Override
	public int delReple(Community_qna_repleVO pvo) throws Exception {
		
		return sqlSession.delete("admin_qna.p_admin_comm_qnaDelReple",pvo);
	}

	@Override
	public int modReple(Community_qna_repleVO pvo) throws Exception {
		
		return sqlSession.update("admin_qna.p_admin_comm_modQnaReple",pvo);
	}

	@Override
	public int incRecom(Community_qna_repleVO pvo) throws Exception {

		return sqlSession.update("admin_qna.p_admin_comm_qnaincRecom",pvo);
	}

	@Override
	public List<Community_qnaVO> comm_qna_search(Admin_community_searchVO pvo) throws Exception {
		return sqlSession.selectList( "admin_qna.admin_qna_search", pvo );
	}

	@Override
	public List<Community_qnaVO> search_All(Admin_searchVO search) throws Exception {
		return sqlSession.selectList( "admin_qna.admin_search_All", search);
	}

	
}
