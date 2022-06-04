package kr.co.littleworkshop.dao;

import java.util.HashMap;
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

	@Override
	public void delete(int code, String id) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("code", code);
		sql.delete("basket.delete",map);
		
	}

	@Override
	public void update(int code, String id, int amount) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("code", code);
		map.put("amount", amount);
		
		sql.update("basket.update",map);
		
	}

	
}
