package kr.co.littleworkshop.dao;

import java.util.List;

import kr.co.littleworkshop.model.Tag;

public interface TagDao {

	List<Tag> nowTagList();

	void addTag(Tag tag);

	void addProductTag(Tag tag);

	void initProductTag(int productCode);

	void initFdTag(int fdCode);

	void addFdTag(Tag fdTag);

}
