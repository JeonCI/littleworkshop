package kr.co.littleworkshop.model;

import java.util.Date;
import java.util.List;
import java.util.Map;

public class Basket {
	
	int basketCode;
	String id;
	int productCode;
	int productAmount;
	Date basketRegDate;
	String orderInfo;
	

	public int getBasketCode() {
		return basketCode;
	}
	public String getOrderInfo() {
		return orderInfo;
	}
	public void setOrderInfo(String orderInfo) {
		this.orderInfo = orderInfo;
	}
	public void setBasketCode(int basketCode) {
		this.basketCode = basketCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
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


}
