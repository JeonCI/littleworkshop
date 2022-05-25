package kr.co.littleworkshop.dao;

import java.util.List;

import kr.co.littleworkshop.model.Notice;

public interface NoticeDao {

	List<Notice> list();

	List<Notice> noticeCategoryList();

	void noticeAdd(Notice notice);

	Notice noticeItem(Notice item);

	void noticeUpdate(Notice notice);

	void noticeDelete(int noticeCode);
	
}
