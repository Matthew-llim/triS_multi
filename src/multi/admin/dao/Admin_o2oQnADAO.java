package multi.admin.dao;
 
import java.util.List; 

import main.vo.O2OQnAVO;
import multi.admin.vo.Admin_searchVO;

public interface Admin_o2oQnADAO {
	public List<O2OQnAVO> findAllAskWithNoRe() throws Exception;
	public List<O2OQnAVO> findAllAskWithRe() throws Exception;
	public int addAsking ( O2OQnAVO ovo ) throws Exception;
	public O2OQnAVO check_oneAsking ( O2OQnAVO ovo ) throws Exception;
	public int writeConsult ( O2OQnAVO ovo ) throws Exception;
	public List<O2OQnAVO> search_All(Admin_searchVO search) throws Exception;
	public List<O2OQnAVO> search_All2(Admin_searchVO search) throws Exception;
}
