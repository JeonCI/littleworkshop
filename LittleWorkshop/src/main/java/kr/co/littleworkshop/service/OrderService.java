package kr.co.littleworkshop.service;

import java.util.List;

import kr.co.littleworkshop.model.Basket;
import kr.co.littleworkshop.model.Order;
import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.model.Review;
import kr.co.littleworkshop.util.Pager;
import kr.co.littleworkshop.util.orderPager;

public interface OrderService {

	List<Product> basketPaymentList(int[] productCode, String id);

	Product productPaymentList(int code);

	void add(Order order);

	List<Order> orderHistory(String id, Pager pager);

	List<Order> orderRequest(String id, orderPager pager);

	void setOrderStatus(int orderCode, List<Integer> productCode);

	Order orderStatusInfo(String id);

	void setReviewStatus(Review review);

}
