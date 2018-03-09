package multi.space.dao;

import java.util.List;

import main.vo.HostVO;

public interface HostDAO {
	public List<HostVO> find_host_by_user_id(String user_id) throws Exception;
}
