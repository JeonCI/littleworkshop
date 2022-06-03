package kr.co.littleworkshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.littleworkshop.dao.KeywordDao;

@Service
public class KeywordServiceImpl implements KeywordService {
	
	@Autowired
	KeywordDao dao;
	
	@Override
	public void addKeyword(String keyword) {
		dao.addKeyword(keyword);
	}

	@Override
	public void addAttentionKeyword(String id, String keyword) {
		int searchKeywordCode = dao.getKeywordCode(keyword);
		
		dao.addAttentionKeyword(id, searchKeywordCode);
	}

}
