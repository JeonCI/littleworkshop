package kr.co.littleworkshop.dao;

import java.util.List;

import kr.co.littleworkshop.model.Product;

public interface OrderDao {

	List<Product> paymentList(int[] productCode, String id);

}
