package kr.co.littleworkshop.dao;

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

}
