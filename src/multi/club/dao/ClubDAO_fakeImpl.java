package multi.club.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

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

public class ClubDAO_fakeImpl implements ClubDAO{

	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	//모임 전체 리스트 출력
	@Override
	public List<ClubVO> club_findAll() throws Exception {
		return sqlSession.selectList("club.club_findAll");
	}

	//모임 등록하기
	@Override
	public int club_add_page_submit(ClubVO pvo) throws Exception {
		return sqlSession.update("club.club_add_page_submit",pvo);
	}

	//모임 상세 조회
	@Override
	public ClubVO club_find_detail(ClubVO pvo) throws Exception {
		ClubVO vo = sqlSession.selectOne("club.club_find_detail",pvo); 
		vo.setUser_count(pvo.getUser_count());
		return vo;
	}
	
	//모임 상세 조회_관련 장소 조회
	@Override
	public List<SpaceVO> club_find_detail_space(ClubVO pvo) throws Exception {
		return sqlSession.selectList("club.club_find_detail_space",pvo);
	}

	//모임 신청
	@Override
	public int club_add_apply(Club_applyVO pvo) throws Exception {
		return sqlSession.update("club.club_add_apply",pvo);
	}

	//모임장 select
	@Override
	public String club_find_master(ClubVO pvo) throws Exception {
		return sqlSession.selectOne("club.club_find_master",pvo);
	}
	
	//모임 커뮤니티에 보여줄 회원 리스트 조회
	@Override
	public List<UserVO> club_find_community_user(ClubVO pvo) throws Exception {
		return sqlSession.selectList("club.club_find_user",pvo);
	}

	//모임 신청자 리스트 조회
	@Override
	public List<Club_applyVO> club_find_apply(ClubVO pvo) throws Exception {
		return sqlSession.selectList("club.club_find_apply",pvo);
	}
		
	//모임 공지사항 조회
	@Override
	public List<Club_noticeVO> club_findAll_notice(Club_community_listVO pvo) throws Exception {
		return sqlSession.selectList("club_notice.club_findAll_notice",pvo);
	}

	//모임 공지사항 등록
	@Override
	public int club_add_community_notice_submit(Club_noticeVO pvo) throws Exception {
		return sqlSession.update("club_notice.club_add_community_notice_submit",pvo);
	}

	//모임 커뮤니티 글 조회
	@Override
	public List<Club_boardVO> club_findAll_board(Club_community_listVO pvo) throws Exception {
		return sqlSession.selectList("club_board.club_findAll_board",pvo);
	}

	//모임 공지사항 디테일 조회
	@Override
	public Club_noticeVO club_find_notice_detail(Club_noticeVO pvo) throws Exception {
		return sqlSession.selectOne("club_notice.club_find_notice_detail",pvo);
	}

	//모임 공지사항 글 수정
	@Override
	public int club_mod_notice_detail(Club_noticeVO pvo) throws Exception {
		return sqlSession.update("club_notice.club_mod_notice_detail",pvo);
	}

	//모임 공지사항 삭제
	@Override
	public int club_del_notice_detail(Club_noticeVO pvo) throws Exception {
		return sqlSession.update("club_notice.club_del_notice_detail",pvo);
	}

	//모임 공지사항의 리플 등록
	@Override
	public int club_add_notice_reple(Club_notice_repleVO pvo) throws Exception {
		return sqlSession.update("club_notice.club_add_notice_reple",pvo);
	}

	//모임 공지사항의 리플 리스트 조회
	@Override
	public List<Club_notice_repleVO> club_find_notice_reple(Club_noticeVO pvo) throws Exception {
		return sqlSession.selectList("club_notice.club_find_notice_reple",pvo);
	}

	//모임 공지사항의 리플 삭제
	@Override
	public int club_del_notice_reple(Club_notice_repleVO pvo) throws Exception {
		return sqlSession.update("club_notice.club_del_notice_reple",pvo);
	}

	//모임 공지사항의 리플 수정
	@Override
	public int club_mod_notice_reple(Club_notice_repleVO pvo) throws Exception {
		return sqlSession.update("club_notice.club_mod_notice_reple",pvo);
	}

	//모임 커뮤니티 게시판 디테일 조회
	@Override
	public Club_boardVO club_find_board_detail(Club_boardVO pvo) throws Exception {
		return sqlSession.selectOne("club_board.club_find_board",pvo);
	}

	//모임 커뮤니티 게시판 수정
	@Override
	public int club_mod_board_detail(Club_boardVO pvo) throws Exception {
		return sqlSession.update("club_board.club_mod_board_detail",pvo);
	}

	//모임 커뮤니티 게시판 글 삭제
	@Override
	public int club_del_board(Club_boardVO pvo) throws Exception {
		return sqlSession.delete("club_board.club_del_board_detail",pvo);
	}

	//모임 커뮤니티의 리플 조회
	@Override
	public List<Club_board_repleVO> club_find_board_reple(Club_boardVO pvo) throws Exception {
		return sqlSession.selectList("club_board.club_board_reple",pvo);
	}

	//모임 커뮤니티의 댓글 등록
	@Override
	public int club_add_board_reple(Club_board_repleVO pvo) throws Exception {
		return sqlSession.update("club_board.club_add_board_reple",pvo);
	}

	//모임 커뮤니티의 댓글 삭제
	@Override
	public int club_del_board_reple(Club_board_repleVO pvo) throws Exception {
		return sqlSession.update("club_board.club_del_board_reple",pvo);
	}

	//모임 커뮤니티의 댓글 수정
	@Override
	public int club_mod_board_reple(Club_board_repleVO pvo) throws Exception {
		return sqlSession.update("club_board.club_mod_board_reple",pvo);
	}

	//모임 커뮤니티에 글 작성
	@Override
	public int club_add_community_board_submit(Club_boardVO pvo) throws Exception {
		return sqlSession.update("club_board.club_add_community_board",pvo);
	}

	//모임 신청자 수락
	@Override
	public int club_apply_agree(Club_applyVO pvo) throws Exception {
		return sqlSession.update("club.club_apply_agree",pvo);
	}

	//모임 신청자 거절
	@Override
	public int club_apply_disagree(Club_applyVO pvo) throws Exception {
		return sqlSession.update("club.club_apply_disagree",pvo);
	}

	//쪽지 보내기
	@Override
	public int club_add_message(MessageVO pvo) throws Exception {
		return sqlSession.update("club.club_add_message",pvo);
	}

	//신청자 신청 내역 조회
	@Override
	public Club_applyVO club_find_apply_detail(Club_applyVO pvo) throws Exception {
		return sqlSession.selectOne("club.club_find_apply_detail",pvo);
	}

	//지역 카테고리 검색
	@Override
	public List<Map<Integer, Object>> club_find_l_category() throws Exception {
		return sqlSession.selectList("club.club_find_lcategory");
	}

	//분야별 카테고리 검색
	@Override
	public List<Map<Integer, Object>> club_find_c_category() throws Exception {
		return sqlSession.selectList("club.club_find_ccategory");
	}

	//검색 기능
	@Override
	public List<Map<String, Object>> club_search(Club_searchVO pvo) throws Exception {
		return sqlSession.selectList("club.club_search",pvo);
	}

	// 현재의 모임으로 들어가 있는지 조회.
	@Override
	public User_clubVO club_find_user_byId(User_clubVO pvo) throws Exception {
		return sqlSession.selectOne("club.club_find_user_byId",pvo);
	}

	// 모임의 유저가 탈퇴를 할 때
	@Override
	public int club_del_user(User_clubVO pvo) throws Exception {
		return sqlSession.update("club.club_del_user",pvo);
	}

	// 모임을 해체시킬때
	@Override
	public int club_del_club(User_clubVO pvo) throws Exception {
		return sqlSession.update("club.club_del_club",pvo);
	}

	// 모임 회원 방출
	@Override
	public int club_user_release(Club_applyVO pvo) throws Exception {
		return sqlSession.update("club.club_user_release",pvo);
	}

	// 클럽 베스트 조회
	@Override
	public List<Map<String, Object>> find_best_club() throws Exception {
		return sqlSession.selectList("club.find_best_club");
	}

	@Override
	public int club_mod_club_submit(ClubVO pvo) throws Exception {
		return sqlSession.update("club.club_mod_club",pvo);
	}

}
