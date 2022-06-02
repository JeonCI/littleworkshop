package kr.co.littleworkshop.model;

import java.util.List;

public class Basket {
	private int basketCode;
	private String id;
	
	private List<BasketDetail> basketDetailList;

	public int getBasketCode() {
		return basketCode;
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

	public List<BasketDetail> getBasketDetailList() {
		return basketDetailList;
	}

	public void setBasketDetailList(List<BasketDetail> basketDetailList) {
		this.basketDetailList = basketDetailList;
	}
	
	
	
}
