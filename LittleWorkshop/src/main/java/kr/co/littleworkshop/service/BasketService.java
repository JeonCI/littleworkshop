package kr.co.littleworkshop.service;

import java.util.List;

import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.model.Basket;
import kr.co.littleworkshop.model.Product;

public interface BasketService {

	void add(List<Basket> basket, Account account);

	List<Product> list(String id);

	void delete(int code, String id);

	void update(int code, String id, int amount);

	void partialDeletion(List<Integer> deleteList, String id);
}
