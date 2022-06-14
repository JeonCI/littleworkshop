package kr.co.littleworkshop.dao;

public interface KeywordDao {

	void addKeyword(String keyword);

	int getKeywordCode(String keyword);

	void addAttentionKeyword(String id, int searchKeywordCode);

	void addAttCategory(int code, String id);

	int attCategoryCheck(int code, String id);

	void updateAttCategory(int code, String id);

}
