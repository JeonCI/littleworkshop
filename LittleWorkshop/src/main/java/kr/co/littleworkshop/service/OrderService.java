package kr.co.littleworkshop.service;

import java.util.List;

import kr.co.littleworkshop.model.Basket;
import kr.co.littleworkshop.model.Order;
import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.util.Pager;

public interface OrderService {

	List<Product> basketPaymentList(int[] productCode, String id);

	Product productPaymentList(int code);

	void add(Order order);

	List<Order> orderList(String id, Pager pager);

}
