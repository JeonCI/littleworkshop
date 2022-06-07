package kr.co.littleworkshop.service;

import java.util.List;

import kr.co.littleworkshop.model.Product;

public interface OrderService {

	List<Product> paymentList(int[] productCode, String id);

}
