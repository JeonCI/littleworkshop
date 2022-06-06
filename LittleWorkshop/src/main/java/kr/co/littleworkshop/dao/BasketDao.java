package kr.co.littleworkshop.dao;

import java.util.List;

import kr.co.littleworkshop.model.Basket;
import kr.co.littleworkshop.model.Product;

public interface BasketDao {

	void add(Basket item);

	List<Product> list(String id);

	void delete(int code, String id);

	void update(int code, String id, int amount);

	void partialDeletion(int code, String id);

}
