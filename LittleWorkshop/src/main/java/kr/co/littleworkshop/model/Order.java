package kr.co.littleworkshop.model;

import java.util.Date;
import java.util.List;

public class Order {
	
	private int orderListCode;
	private String id;
	private int addressCode;
	private int orderStatus;
	private Date orderDate;
	private String orderPayment;
	private int paymentPrice;
	
	private List<Integer> basketList;
	
	private List<ProductOrderDetail> orderDetailList;
	
	
	


	public List<Integer> getBasketList() {
		return basketList;
	}
	public void setBasketList(List<Integer> basketList) {
		this.basketList = basketList;
	}
	public List<ProductOrderDetail> getOrderDetailList() {
		return orderDetailList;
	}
	public void setOrderDetailList(List<ProductOrderDetail> orderDetailList) {
		this.orderDetailList = orderDetailList;
	}
	public int getOrderListCode() {
		return orderListCode;
	}
	public void setOrderListCode(int orderListCode) {
		this.orderListCode = orderListCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getAddressCode() {
		return addressCode;
	}
	public void setAddressCode(int addressCode) {
		this.addressCode = addressCode;
	}
	public int getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderPayment() {
		return orderPayment;
	}
	public void setOrderPayment(String orderPayment) {
		this.orderPayment = orderPayment;
	}
	public int getPaymentPrice() {
		return paymentPrice;
	}
	public void setPaymentPrice(int paymentPrice) {
		this.paymentPrice = paymentPrice;
	}
	
	

}
