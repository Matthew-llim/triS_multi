package multi.space.dao;

import java.util.List;

import main.vo.Space_qnaVO;
import multi.space.vo.Space_qna_searchVO;

public interface Space_QnADAO {
	public Integer add_spaceQnA(Space_qnaVO vo) throws Exception;
	public List<Space_qnaVO> find_space_QnA_by_space_no(Space_qna_searchVO vo) throws Exception;
	public Integer delete_spaceQnA_by_spane_qna_no(Space_qnaVO vo) throws Exception;
	public Space_qnaVO find_space_QnA_by_space_qna_no(Space_qnaVO vo) throws Exception;
	public Integer mod_spaceQnA_by_spane_qna_no(Space_qnaVO vo) throws Exception;
}
