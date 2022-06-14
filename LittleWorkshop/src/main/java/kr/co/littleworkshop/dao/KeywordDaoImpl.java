package kr.co.littleworkshop.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class KeywordDaoImpl implements KeywordDao {
	
	@Autowired
	SqlSession sql;
	
	@Override
	public void addKeyword(String keyword) {
		sql.insert("keyword.addKeyword", keyword);
	}

	@Override
	public int getKeywordCode(String keyword) {
		return sql.selectOne("keyword.getKeywordCode", keyword);
	}

	@Override
	public void addAttentionKeyword(String id, int searchKeywordCode) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		map.put("id", id);
		map.put("searchKeywordCode", searchKeywordCode);
		
		sql.insert("keyword.addAttentionKeyword", map);
	}

	@Override
	public void addAttCategory(int code, String id) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("code", code);
		
		sql.insert("keyword.addAttCategory", map);
		
	}

	@Override
	public int attCategoryCheck(int code, String id) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("code", code);
		
		return sql.selectOne("keyword.attCategoryCheck", map);
	}

	@Override
	public void updateAttCategory(int code, String id) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("code", code);
		
		sql.update("keyword.updateAttCategory", map);

	}


}
