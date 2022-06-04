package kr.co.littleworkshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.littleworkshop.model.Basket;

@Repository
public class BasketDaoImpl implements BasketDao {

	@Autowired
	SqlSession sql;

	@Override
	public void add(Basket item) {
		sql.insert("basket.add",item);
	}

	@Override
	public List<Basket> list(String id) {
		return sql.selectList("basket.list",id);
	}
	
}
