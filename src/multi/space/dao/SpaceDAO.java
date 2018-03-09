package multi.space.dao;

import java.util.List;
import java.util.Map;

import main.vo.ClubVO;
import main.vo.HostVO;
import main.vo.SpaceVO;
import main.vo.ZipcodeVO;
import multi.space.vo.ImageVO;
import multi.space.vo.Space2VO;
import multi.space.vo.Space_searchVO;

public interface SpaceDAO {
	
	//테스트용
	public String sysdate() throws Exception;
	
	//공간 전체 리스트 불러오기
	public List<SpaceVO> find_space_all() throws Exception; 
	
	//공간 추가
	public Integer add_space(SpaceVO vo) throws Exception;
	
	//마지막 번호 추출
	public Integer find_space_no() throws Exception;
	
	//공간 이미지 추가
	public Integer add_space_image(ImageVO image) throws Exception;
	
	//공간 삭제
	public Integer del_space_by_space_no(SpaceVO vo) throws Exception;
	
	//공간 하나 불러오기
	public SpaceVO find_space_by_pk(SpaceVO vo) throws Exception;
	
	//공간 이미지 불러오기
	public ImageVO find_image_by_space_no(ImageVO image) throws Exception;
	
	//유저 검색하고 유저가 가진 클럽 불러오기
	public List<ClubVO> find_user_club(String user_id) throws Exception;
	
	//공간 판매자 정보 불러오기
	public HostVO find_host_by_space_no(SpaceVO vo) throws Exception;
	
	//L_CATEGORY 전체 불러오기
	public List<Map<Integer,String>> find_l_category() throws Exception;
	
	//S_CATEGORY 전체 불러오기
	public List<Map<Integer,String>> find_s_category() throws Exception;
	
	//하나의 SPACE에서 S_CATEOGRY 불러오기
	public String find_s_category_by_space_no(SpaceVO vo) throws Exception;
	
	//하나의 SPACE에서 L_CATEGORY 불러오기
	public String find_l_category_by_space_no(SpaceVO vo) throws Exception;
	
	//공간 search
	public List<SpaceVO> search_space(Space_searchVO vo) throws Exception;
	
	//공간 수정
	public Integer mod_space(SpaceVO space) throws Exception;
	
	//베스트 공간 3개 뽑아오기(서울)
	public List<Space2VO> find_best_space() throws Exception;
	
	//파티룸
	public List<Space2VO> find_best_space2() throws Exception;
	
	//주소값 뽑아오기
	public ZipcodeVO find_space_addr(String zipcode) throws Exception;
}

