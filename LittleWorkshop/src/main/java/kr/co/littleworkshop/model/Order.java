package kr.co.littleworkshop.model;

public class Order {
	
	private int orderListCode;
	private int id;
	private int addressCode;
	private int orderStatus;
	private int orderDate;
	private int orderPayment;
	
	
	
	
	public int getOrderListCode() {
		return orderListCode;
	}
	public void setOrderListCode(int orderListCode) {
		this.orderListCode = orderListCode;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
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
	public int getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(int orderDate) {
		this.orderDate = orderDate;
	}
	public int getOrderPayment() {
		return orderPayment;
	}
	public void setOrderPayment(int orderPayment) {
		this.orderPayment = orderPayment;
	}
	
	

}
