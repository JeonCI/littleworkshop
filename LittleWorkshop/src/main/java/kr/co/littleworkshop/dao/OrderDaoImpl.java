package kr.co.littleworkshop.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.littleworkshop.model.Order;
import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.model.ProductOrderDetail;
import kr.co.littleworkshop.util.Pager;
import kr.co.littleworkshop.util.orderPager;

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

	@Override
	public List<Order> orderHistory(String id, Pager pager) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("pager", pager);
		
		return sql.selectList("order.orderHistory", map);
	}

	@Override
	public List<Order> orderRequest(String id, orderPager pager) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("pager", pager);
		return sql.selectList("order.orderRequest", map);
	}

	@Override
	public void setOrderStatus(int code, List<Integer> productCode) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("code", code);
		map.put("productList", productCode);
		sql.update("order.setOrderStatus",map);
		
	}

	@Override
	public void buyerCount(List<Integer> productCodeList) {
		sql.update("order.buyerCount",productCodeList);
		
	}

	@Override
	public Order orderStatusInfo(String id) {
		return sql.selectOne("order.orderStatusInfo",id);
	}
}
