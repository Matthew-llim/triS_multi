package multi.mypage.myinfo.dao;

import java.util.List;

import main.vo.UserVO;

public interface UserDAO {

	public UserVO find_userInfo(String user_id) throws Exception;

}
