package kr.co.littleworkshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.littleworkshop.model.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	
	@Autowired
	SqlSession sql;
	
	@Override
	public List<Notice> list() {
		return sql.selectList("notice.noticeList");
	}

	@Override
	public List<Notice> noticeCategoryList() {
		return sql.selectList("category.noticeCategoryList");
	}

	@Override
	public void noticeAdd(Notice notice) {
		sql.insert("notice.noticeAdd", notice);
	}

	@Override
	public Notice noticeItem(Notice item) {
		return sql.selectOne("notice.noticeItem", item);
	}

	@Override
	public void noticeUpdate(Notice notice) {
		sql.update("notice.noticeUpdate", notice);
	}

	@Override
	public void noticeDelete(int noticeCode) {
		sql.delete("notice.noticeDelete", noticeCode);
	}

}
