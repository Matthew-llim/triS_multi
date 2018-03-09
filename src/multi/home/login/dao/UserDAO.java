package multi.home.login.dao;

import java.util.List;

import main.vo.UserVO;

public interface UserDAO {
	public UserVO find_user(UserVO uvo) throws Exception;
	public UserVO find_userInfo(String user_id) throws Exception;
	public UserVO find_userId(UserVO uvo)throws Exception;
	public UserVO find_userPasswd(UserVO uvo)throws Exception;

}
