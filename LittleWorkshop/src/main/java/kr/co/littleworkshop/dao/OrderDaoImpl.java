package kr.co.littleworkshop.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.littleworkshop.model.Product;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Autowired
	SqlSession sql;

	@Override
	public List<Product> paymentList(int[] productCode, String id) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("productCode", productCode);
		return sql.selectList("order.paymentList",map);
	}
}
