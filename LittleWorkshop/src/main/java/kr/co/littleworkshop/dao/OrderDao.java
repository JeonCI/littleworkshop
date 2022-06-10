package kr.co.littleworkshop.dao;

import java.util.List;

import kr.co.littleworkshop.model.Order;
import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.model.ProductOrderDetail;
import kr.co.littleworkshop.util.Pager;

public interface OrderDao {

	List<Product> basketPaymentList(int[] productCode, String id);

	Product productPaymentList(int code);

	void addOrder(Order order);

	void addOrderDetail(ProductOrderDetail item);

	List<Order> orderList(String id, Pager pager);

}
