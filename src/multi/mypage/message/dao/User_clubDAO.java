package multi.mypage.message.dao;

import java.util.List;

import main.vo.User_clubVO;

public interface User_clubDAO {

	public List<User_clubVO> find_user_clubInfo(String user_id);

	public List<User_clubVO> find_user_club_MemberInfo(User_clubVO ucvo);

}
