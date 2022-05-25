package kr.co.littleworkshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.littleworkshop.dao.NoticeDao;
import kr.co.littleworkshop.model.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	NoticeDao dao;
	
	@Override
	public List<Notice> list() {
		return dao.list();
	}

	@Override
	public List<Notice> noticeCategoryList() {
		return dao.noticeCategoryList();
	}

	@Override
	public void noticeAdd(Notice notice) {
		dao.noticeAdd(notice);
	}

	@Override
	public Notice noticeItem(int noticeCode) {
		Notice item = new Notice();
		
		item.setNoticeCode(noticeCode);
		
		return dao.noticeItem(item);
	}

	@Override
	public void noticeUpdate(Notice notice) {
		dao.noticeUpdate(notice);
	}

	@Override
	public void noticeDelete(int noticeCode) {
		dao.noticeDelete(noticeCode);
	}

}
