package multi.community.qna.dao;

import java.util.List;

import multi.community.qna.vo.Community_qna_repleVO;

public interface Community_qna_repleDAO {
	public List<Community_qna_repleVO> findAllReple(Community_qna_repleVO rpl) throws Exception;
	public int addReple(Community_qna_repleVO pvo) throws Exception;
	public int delReple(Community_qna_repleVO pvo) throws Exception;
	public int modReple(Community_qna_repleVO pvo) throws Exception;
	public int incRecom(Community_qna_repleVO pvo) throws Exception;
	
}
