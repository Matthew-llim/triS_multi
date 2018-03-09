package multi.event.dao;

import java.util.List;

import main.vo.EventVO;
import multi.event.vo.Event_searchVO;


/*	DAO 는 인터페이스로 구현한다.
 	SELECT 는 find , INSERT 는 add, DELETE 는 del, 
 	By 이후에는 WHERE 조건을 명시한다.
 	throws Exception 또는 throws RuntimeException 으로 구현
 	
 	수정은 mod 접두어를 붙인다 ( 개인적으로는 + 1 증가는 inc 좋아함 )
*/

public interface EventDAO {
	public List<EventVO> findAll() throws Exception;
	public int add( EventVO pvo ) throws Exception;
	public int delByPK(EventVO pvo) throws Exception;
	
	public EventVO getByPK( int pk) throws Exception;
	
	public int mod(EventVO pvo) throws Exception;
	
	public List<EventVO> search(Event_searchVO svo) throws Exception;
}






	