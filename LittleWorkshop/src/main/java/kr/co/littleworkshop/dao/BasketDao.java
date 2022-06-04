package kr.co.littleworkshop.dao;

import java.util.List;

import kr.co.littleworkshop.model.Basket;

public interface BasketDao {

	void add(Basket item);

	List<Basket> list(String id);

}
