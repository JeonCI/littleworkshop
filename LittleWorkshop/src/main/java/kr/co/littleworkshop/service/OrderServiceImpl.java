package kr.co.littleworkshop.service;

import java.util.ArrayList;
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
import kr.co.littleworkshop.util.orderPager;

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
		List<Integer> productCodeList = new ArrayList<Integer>();
		dao.addOrder(order);
		
		for(ProductOrderDetail item : order.getOrderDetailList()) {
			item.setOrderListCode(order.getOrderListCode());
			productCodeList.add(item.getProductCode());
			dao.addOrderDetail(item);
		}

		if(order.getBasketList() != null)
			for(int code : order.getBasketList()) 
				basketDao.delete(code, order.getId());
		
		dao.buyerCount(productCodeList);
	
	}

	@Override
	public List<Order> orderHistory(String id, Pager pager) {
		return dao.orderHistory(id, pager);
	}


	@Override
	public List<Order> orderRequest(String id, orderPager pager) {
		return dao.orderRequest(id, pager);
	}


	@Override
	public void setOrderStatus(int orderCode, List<Integer> productCode) {
		 dao.setOrderStatus(orderCode,productCode);
		
	}


	@Override
	public Order orderStatusInfo(String id) {
		return dao.orderStatusInfo(id);
	}
}
