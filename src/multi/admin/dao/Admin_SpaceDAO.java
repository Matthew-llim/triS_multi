package multi.admin.dao;
 
import java.util.List; 

import main.vo.HostVO;
import main.vo.SpaceVO;
import multi.admin.vo.Admin_searchVO;

public interface Admin_SpaceDAO {
	public List<SpaceVO> findHostPlaces( SpaceVO svo ) throws Exception;
	public List<SpaceVO> host_spaces_search(Admin_searchVO pvo) throws Exception;
	public int removeSpace(SpaceVO svo) throws Exception;
	public HostVO space_crn_check(SpaceVO svo) throws Exception;
	public List<SpaceVO> search_All_specific_host(Admin_searchVO search) throws Exception;
}
