package kr.co.littleworkshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.littleworkshop.model.Tag;

@Repository
public class TagDaoImpl implements TagDao {
	
	@Autowired
	SqlSession sql;
	
	@Override
	public List<Tag> nowTagList() {
		return sql.selectList("tag.nowTagList");
	}

	@Override
	public void addTag(Tag tag) {
		sql.insert("tag.addTag", tag);
	}

	@Override
	public void addProductTag(Tag tag) {
		sql.insert("tag.addProductTag", tag);
	}

	@Override
	public void initProductTag(int productCode) {
		sql.delete("tag.initProductTag", productCode);
	}
	
	@Override
	public void addFdTag(Tag fdTag) {
		sql.insert("tag.addFdTag", fdTag);
	}

	@Override
	public void initFdTag(int fdCode) {
		sql.delete("tag.initFdTag", fdCode);
	}

}
