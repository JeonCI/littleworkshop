package kr.co.littleworkshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.littleworkshop.model.Basket;
import kr.co.littleworkshop.model.Product;

@Repository
public class BasketDaoImpl implements BasketDao {

	@Autowired
	SqlSession sql;

	@Override
	public void add(Basket item) {
		sql.insert("basket.add",item);
	}

	@Override
	public List<Product> list(String id) {
		return sql.selectList("basket.list",id);
	}
	
}
