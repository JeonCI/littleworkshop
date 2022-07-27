package kr.co.littleworkshop.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.model.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Product> reviewList(String id) {
		return sql.selectList("review.reviewList",id);
	}

	@Override
	public void add(Review review) {
		sql.insert("review.add",review);
		
	}

	@Override
	public List<Product> myReview(String id) {
		return sql.selectList("review.myReview",id);
	}

	@Override
	public void update(Review review) {
		sql.update("review.update",review);
		
	}

	@Override
	public void delete(int code, String id) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("id", id);
		
		sql.delete("review.delete",map);
		
	}

}
