package kr.co.littleworkshop.model;

public class ProductOrderDetail {
	
	private int orderCode;
	private int orderListCode;
	private int productCode;
	private int orderPrice;
	private String orderInfo;
	private int orderAmount;
	private int detailStatusCode;
	private String detailStatusName;
	
	
	
	public String getDetailStatusName() {
		return detailStatusName;
	}
	public void setDetailStatusName(String detailStatusName) {
		this.detailStatusName = detailStatusName;
	}
	public int getDetailStatusCode() {
		return detailStatusCode;
	}
	public void setDetailStatusCode(int detailStatusCode) {
		this.detailStatusCode = detailStatusCode;
	}
	public int getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}
	public int getOrderListCode() {
		return orderListCode;
	}
	public void setOrderListCode(int orderListCode) {
		this.orderListCode = orderListCode;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public String getOrderInfo() {
		return orderInfo;
	}
	public void setOrderInfo(String orderInfo) {
		this.orderInfo = orderInfo;
	}
	public int getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}
	

	
	
	
	

}
