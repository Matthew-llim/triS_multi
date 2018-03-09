package multi.mypage.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import main.vo.Space_qnaVO;
import multi.mypage.vo.Mypage_searchVO;



public interface Space_qnaDAO {
	
	public List<Space_qnaVO> find_qnaInfo(String user_id) throws Exception;
	public Space_qnaVO find_qnaByspace_no(String space_qna_no) throws Exception;
	public List<Space_qnaVO> search_QnA(Mypage_searchVO search) throws Exception;
	public int del_space_qna(String space_qna_no) throws Exception;
	
}
