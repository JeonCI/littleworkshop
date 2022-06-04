package kr.co.littleworkshop.service;

import java.util.List;

import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.model.Basket;

public interface BasketService {

	void add(List<Basket> basket, Account account);

	List<Basket> list(String id);

}
