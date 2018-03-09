package multi.community.qna.dao;

import java.util.List;

import multi.community.qna.vo.Community_qnaVO;



public interface Community_qnaDAO {
	public List<Community_qnaVO> findAll(String user_id) throws Exception;
	public Community_qnaVO findByPK(Community_qnaVO pvo) throws Exception;
	public int add(Community_qnaVO pvo) throws Exception;
	public int mod(Community_qnaVO pvo) throws Exception;
	public int delByPK(Community_qnaVO pvo) throws Exception;
	public int modView(Community_qnaVO pvo) throws Exception;
}
