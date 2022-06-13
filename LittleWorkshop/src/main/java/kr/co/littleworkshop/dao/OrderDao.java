package kr.co.littleworkshop.dao;

import java.util.List;

import kr.co.littleworkshop.model.Order;
import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.model.ProductOrderDetail;
import kr.co.littleworkshop.util.Pager;
import kr.co.littleworkshop.util.orderPager;

public interface OrderDao {

	List<Product> basketPaymentList(int[] productCode, String id);

	Product productPaymentList(int code);

	void addOrder(Order order);

	void addOrderDetail(ProductOrderDetail item);

	List<Order> orderHistory(String id, Pager pager);

	List<Order> orderRequest(String id, orderPager pager);

	void setOrderStatus(int orderCode);

	void buyerCount(List<Integer> productCodeList);

}
