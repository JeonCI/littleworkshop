package kr.co.littleworkshop.model;

import java.util.Date;
import java.util.List;

public class Order {
	
	private int orderListCode;
	private String id;
	private int addressCode;
	private Date orderDate;
	private String orderPayment;
	private int paymentPrice;
	private String orderStatusName;
	private int orderStatus;
	private int reviewStatues;
	private List<Integer> basketList;
	private List<ProductOrderDetail> orderDetailList;
	private List<Product> productList;
	
	private int preparation;
	private int delivery;
	private int refund;
	private int completed;
	



	public int getReviewStatues() {
		return reviewStatues;
	}
	public void setReviewStatues(int reviewStatues) {
		this.reviewStatues = reviewStatues;
	}
	public int getCompleted() {
		return completed;
	}
	public void setCompleted(int completed) {
		this.completed = completed;
	}
	public int getPreparation() {
		return preparation;
	}
	public void setPreparation(int preparation) {
		this.preparation = preparation;
	}

	public int getDelivery() {
		return delivery;
	}
	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}
	public int getRefund() {
		return refund;
	}
	public void setRefund(int refund) {
		this.refund = refund;
	}
	public int getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getOrderStatusName() {
		return orderStatusName;
	}
	public void setOrderStatusName(String orderStatusName) {
		this.orderStatusName = orderStatusName;
	}
	public List<Product> getProductList() {
		return productList;
	}
	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}
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
