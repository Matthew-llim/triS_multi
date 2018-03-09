package multi.admin.dao;
 
import java.util.List; 

import main.vo.Community_qnaVO;
import main.vo.Community_qna_repleVO;
import multi.admin.vo.Admin_community_searchVO;
import multi.admin.vo.Admin_searchVO;

public interface Admin_QnaDAO {
	public List<Community_qnaVO> findAll() throws Exception;
	public Community_qnaVO findByPK(Community_qnaVO pvo) throws Exception;
	public int add(Community_qnaVO pvo) throws Exception;
	public int mod(Community_qnaVO pvo) throws Exception;
	public int delByPK(Community_qnaVO pvo) throws Exception;
	public int modView(Community_qnaVO pvo) throws Exception;
	public List<Community_qna_repleVO> findAllReple(Community_qna_repleVO rpl) throws Exception;
	public int addReple(Community_qna_repleVO pvo) throws Exception;
	public int delReple(Community_qna_repleVO pvo) throws Exception;
	public int modReple(Community_qna_repleVO pvo) throws Exception;
	public int incRecom(Community_qna_repleVO pvo) throws Exception;
	public List<Community_qnaVO> comm_qna_search( Admin_community_searchVO pvo ) throws Exception;
	public List<Community_qnaVO> search_All(Admin_searchVO search) throws Exception;
}
