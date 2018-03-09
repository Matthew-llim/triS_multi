package multi.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import multi.notice.vo.NoticeVO;


public class NoticeDAO_ProcImpl implements NoticeDAO {
	
	@Autowired @Qualifier("sqlSession")
	private SqlSession sqlSession = null;
	
	@Override
	public List<NoticeVO> findAll() throws Exception {
		return sqlSession.selectList("notice.p_notice_FindAllTexts");
	}

	@Override
	public NoticeVO findByPK(NoticeVO pvo) throws Exception {
		return sqlSession.selectOne("notice.p_notice_FindText",pvo);
	}
}
