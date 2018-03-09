package multi.space.dao;

import main.vo.UserVO;

public interface UserDAO {
	public UserVO find_user_by_user_id(String user_id) throws Exception;
}
