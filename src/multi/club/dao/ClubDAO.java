package multi.club.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import main.vo.ClubVO;
import main.vo.MessageVO;
import main.vo.SpaceVO;
import main.vo.UserVO;
import main.vo.User_clubVO;
import multi.club.vo.Club_applyVO;
import multi.club.vo.Club_boardVO;
import multi.club.vo.Club_board_repleVO;
import multi.club.vo.Club_community_listVO;
import multi.club.vo.Club_noticeVO;
import multi.club.vo.Club_notice_repleVO;
import multi.club.vo.Club_searchVO;


public interface ClubDAO {
	public List<ClubVO> club_findAll() throws Exception;
	public int club_add_page_submit(ClubVO pvo) throws Exception;
	public ClubVO club_find_detail(ClubVO pvo) throws Exception;
	public int club_add_apply(Club_applyVO pvo) throws Exception;
	public List<Club_applyVO> club_find_apply(ClubVO pvo) throws Exception;
	public String club_find_master(ClubVO pvo) throws Exception;
	public List<Club_noticeVO> club_findAll_notice(Club_community_listVO pvo) throws Exception;
	public int club_add_community_notice_submit(Club_noticeVO pvo) throws Exception;
	public List<Club_boardVO> club_findAll_board(Club_community_listVO pvo) throws Exception;
	public Club_noticeVO club_find_notice_detail(Club_noticeVO pvo) throws Exception;
	public int club_mod_notice_detail(Club_noticeVO pvo) throws Exception;
	public int club_del_notice_detail(Club_noticeVO pvo) throws Exception;
	public int club_add_notice_reple(Club_notice_repleVO pvo) throws Exception;
	public List<Club_notice_repleVO> club_find_notice_reple(Club_noticeVO pvo) throws Exception;
	public int club_del_notice_reple(Club_notice_repleVO pvo) throws Exception;
	public int club_mod_notice_reple(Club_notice_repleVO pvo) throws Exception;
	public Club_boardVO club_find_board_detail(Club_boardVO pvo) throws Exception;
	public int club_mod_board_detail(Club_boardVO pvo) throws Exception;
	public int club_del_board(Club_boardVO pvo) throws Exception;
	public List<Club_board_repleVO> club_find_board_reple(Club_boardVO pvo) throws Exception;
	public int club_add_board_reple(Club_board_repleVO pvo) throws Exception;
	public int club_del_board_reple(Club_board_repleVO pvo) throws Exception;
	public int club_mod_board_reple(Club_board_repleVO pvo) throws Exception;
	public int club_add_community_board_submit(Club_boardVO pvo) throws Exception;
	public List<SpaceVO> club_find_detail_space(ClubVO pvo)throws Exception;
	public List<UserVO> club_find_community_user(ClubVO pvo) throws Exception;
	public int club_apply_agree(Club_applyVO pvo) throws Exception;
	public int club_apply_disagree(Club_applyVO pvo) throws Exception;
	public int club_add_message(MessageVO pvo) throws Exception;
	public Club_applyVO club_find_apply_detail(Club_applyVO pvo) throws Exception;
	public List<Map<Integer, Object>> club_find_l_category()throws Exception;
	public List<Map<Integer, Object>> club_find_c_category()throws Exception;
	public List<Map<String, Object>> club_search(Club_searchVO pvo)throws Exception;
	public User_clubVO club_find_user_byId(User_clubVO pvo) throws Exception;
	public int club_del_user(User_clubVO pvo) throws Exception;
	public int club_del_club(User_clubVO pvo) throws Exception;
	public int club_user_release(Club_applyVO pvo) throws Exception;
	public List<Map<String, Object>> find_best_club() throws Exception;
	public int club_mod_club_submit(ClubVO pvo) throws Exception;
}
