package multi.space.dao;

import java.util.List;

import main.vo.Space_qnaVO;
import main.vo.Space_qna_repleVO;

public interface Space_QnA_RepleDAO {
	public Integer add_space_QnA_Reple_by_space_qna_no(Space_qna_repleVO vo) throws Exception;
	public Space_qna_repleVO find_space_QnA_Reple(Space_qna_repleVO vo) throws Exception;
	public Integer delete_spaceQnA_by_space_qna_no(Space_qnaVO space_QnAVO);
}
