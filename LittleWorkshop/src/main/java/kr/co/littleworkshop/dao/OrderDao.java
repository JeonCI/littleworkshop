package kr.co.littleworkshop.dao;

import java.util.List;

import kr.co.littleworkshop.model.Order;
import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.model.ProductOrderDetail;

public interface OrderDao {

	List<Product> basketPaymentList(int[] productCode, String id);

	Product productPaymentList(int code);

	void addOrder(Order order);

	void addOrderDetail(ProductOrderDetail item);

}
