package kr.co.littleworkshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.littleworkshop.dao.BasketDao;
import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.model.Basket;

@Service
public class BasketServiceImpl implements BasketService {

	@Autowired
	BasketDao dao;

	@Override
	public void add(List<Basket> basket, Account account) {
		
		for(Basket item : basket) {
			item.setId(account.getId());
			dao.add(item);
		}

	}
	
}
