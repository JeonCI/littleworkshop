package kr.co.littleworkshop.service;

import java.util.List;

import kr.co.littleworkshop.model.Notice;

public interface NoticeService {

	List<Notice> list();

	List<Notice> noticeCategoryList();

	void noticeAdd(Notice notice);

	Notice noticeItem(int noticeCode);

	void noticeUpdate(Notice notice);

	void noticeDelete(int noticeCode);

}
