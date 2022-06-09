package kr.co.littleworkshop.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.littleworkshop.model.Order;
import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.model.ProductOrderDetail;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Autowired
	SqlSession sql;

	@Override
	public List<Product> basketPaymentList(int[] productCode, String id) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("productCode", productCode);
		return sql.selectList("order.basketPaymentList",map);
	}

	@Override
	public Product productPaymentList(int code) {
		return sql.selectOne("order.productPaymentList",code);
	}

	@Override
	public void addOrder(Order order) {
		sql.insert("order.addOrder", order);
		
	}

	@Override
	public void addOrderDetail(ProductOrderDetail item) {
		sql.insert("order.addOrderDetail", item);
		
	}
}
