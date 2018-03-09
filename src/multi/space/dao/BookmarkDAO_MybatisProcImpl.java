package multi.space.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import main.vo.BookmarkVO;

public class BookmarkDAO_MybatisProcImpl implements BookmarkDAO{

	@Autowired @Qualifier("sqlSession")
	SqlSession sqlSession = null;
	
	@Override
	public Integer add_bookmark(BookmarkVO bookmark) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("bookmark_proc.add_bookmark",bookmark);
	}

	@Override
	public BookmarkVO find_bookmark(BookmarkVO bookmark) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bookmark_proc.find_bookmark",bookmark);
	}

	@Override
	public Integer del_bookmark(BookmarkVO bookmark) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete("bookmark_proc.del_bookmark",bookmark);
	}

}
