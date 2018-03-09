package multi.community.qna.dao;

import java.util.List;

import multi.community.qna.vo.Community_qnaVO;
import multi.community.qna.vo.Community_qna_searchVO;



public interface Community_qna_searchDAO {
	public List<Community_qnaVO> comm_qna_search(Community_qna_searchVO pvo) throws Exception;
}
