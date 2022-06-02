package kr.co.littleworkshop.model;

import java.util.Date;

public class BasketDetail {
	
	int basketDetailCode;
	int productCode;
	int basketCode;
	int productAmount;
	Date basketRegDate;
	String orderInfo;
	public int getBasketDetailCode() {
		return basketDetailCode;
	}
	public void setBasketDetailCode(int basketDetailCode) {
		this.basketDetailCode = basketDetailCode;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public int getBasketCode() {
		return basketCode;
	}
	public void setBasketCode(int basketCode) {
		this.basketCode = basketCode;
	}
	public int getProductAmount() {
		return productAmount;
	}
	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}
	public Date getBasketRegDate() {
		return basketRegDate;
	}
	public void setBasketRegDate(Date basketRegDate) {
		this.basketRegDate = basketRegDate;
	}
	public String getOrderInfo() {
		return orderInfo;
	}
	public void setOrderInfo(String orderInfo) {
		this.orderInfo = orderInfo;
	}
	
	
	

}
