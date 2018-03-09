package multi.mypage.myclub.dao;

import java.util.List;

import main.vo.ClubVO;
import multi.mypage.vo.Mypage_searchVO;

public interface MyclubDAO {
	public List<ClubVO> find_myClub(String user_id) throws Exception;
	public List<ClubVO> search_clubs(Mypage_searchVO search) throws Exception;
}
