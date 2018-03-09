package multi.admin.dao;
 
import java.util.List; 

import main.vo.MessageVO;
import multi.admin.vo.Admin_searchVO;

public interface Admin_MessageDAO {
	public int writing_message ( MessageVO mvo ) throws Exception;
	public List<MessageVO> findAllGetMessages () throws Exception;
	public List<MessageVO> findToGetMessages () throws Exception;
	public List<MessageVO> search_All(Admin_searchVO search) throws Exception;
}
