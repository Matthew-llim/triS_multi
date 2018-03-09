package multi.home.userjoin.dao;

import java.util.List;

import main.vo.UserVO;
import main.vo.ZipcodeVO;

public interface UserJoinDAO {
	public int addUser(UserVO uvo) throws Exception;
	public int ckId(UserVO uvo) throws Exception;
	public List<ZipcodeVO> findZipcode(ZipcodeVO zvo) throws Exception;
	
}
