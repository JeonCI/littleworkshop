package kr.co.littleworkshop.dao;

public interface KeywordDao {

	void addKeyword(String keyword);

	int getKeywordCode(String keyword);

	void addAttentionKeyword(String id, int searchKeywordCode);

}
