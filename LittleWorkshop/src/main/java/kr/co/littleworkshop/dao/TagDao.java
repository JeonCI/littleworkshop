package kr.co.littleworkshop.dao;

import java.util.List;

import kr.co.littleworkshop.model.Tag;

public interface TagDao {

	List<Tag> nowTagList();

	void addTag(Tag tag);

	void addProductTag(Tag tag);

	void initProductTag(int productCode);

}
