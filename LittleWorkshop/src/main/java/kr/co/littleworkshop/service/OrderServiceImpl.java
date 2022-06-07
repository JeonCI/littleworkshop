package kr.co.littleworkshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.littleworkshop.dao.OrderDao;
import kr.co.littleworkshop.model.Product;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDao dao;

	@Override
	public List<Product> paymentList(int[] productCode, String id) {
		return dao.paymentList(productCode, id);
	}
}
