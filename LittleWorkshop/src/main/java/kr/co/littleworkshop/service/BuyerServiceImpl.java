package kr.co.littleworkshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.littleworkshop.dao.BuyerDao;

@Service
public class BuyerServiceImpl implements BuyerService {
	@Autowired
	BuyerDao dao;
}
