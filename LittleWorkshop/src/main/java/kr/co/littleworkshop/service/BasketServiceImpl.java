package kr.co.littleworkshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.littleworkshop.dao.BasketDao;

@Service
public class BasketServiceImpl implements BasketService {

	@Autowired
	BasketDao dao;
	
}
