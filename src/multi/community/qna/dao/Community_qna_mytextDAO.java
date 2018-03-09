package multi.community.qna.dao;

import java.util.List;

import multi.community.qna.vo.Community_qnaVO;

public interface Community_qna_mytextDAO {
	public List<Community_qnaVO> findAll(String user_id) throws Exception;
}
