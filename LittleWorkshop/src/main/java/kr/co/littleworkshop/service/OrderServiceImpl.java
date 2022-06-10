package kr.co.littleworkshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.littleworkshop.dao.BasketDao;
import kr.co.littleworkshop.dao.OrderDao;
import kr.co.littleworkshop.model.Basket;
import kr.co.littleworkshop.model.Order;
import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.model.ProductOrderDetail;
import kr.co.littleworkshop.util.Pager;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDao dao;
	
	@Autowired
	BasketDao basketDao;

	@Override
	public List<Product> basketPaymentList(int[] productCode, String id) {
		return dao.basketPaymentList(productCode, id);
	}


	@Override
	public Product productPaymentList(int code) {
		return dao.productPaymentList(code);
	}


	@Transactional
	@Override
	public void add(Order order) {
		dao.addOrder(order);
		
		for(ProductOrderDetail item : order.getOrderDetailList()) {
			item.setOrderListCode(order.getOrderListCode());
			dao.addOrderDetail(item);
		}
		
		if(order.getBasketList() != null)
			for(int code : order.getBasketList()) 
				basketDao.delete(code, order.getId());
	
	}

	@Override
	public List<Order> orderList(String id, Pager pager) {
		return dao.orderList(id, pager);
	}
}
