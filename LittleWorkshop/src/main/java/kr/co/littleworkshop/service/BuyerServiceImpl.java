package kr.co.littleworkshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.littleworkshop.dao.BuyerDao;
import kr.co.littleworkshop.model.Account;

@Service
public class BuyerServiceImpl implements BuyerService {
	@Autowired
	BuyerDao dao;
}
