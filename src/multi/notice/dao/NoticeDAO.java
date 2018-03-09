package multi.notice.dao;

import java.util.List;

import multi.notice.vo.NoticeVO;

public interface NoticeDAO {
	public List<NoticeVO> findAll() throws Exception;
	public NoticeVO findByPK(NoticeVO pvo) throws Exception;
}
