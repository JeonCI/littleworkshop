package kr.co.littleworkshop.model;

public class ProductOptionDetail {
	private int productOptionDetailCode;
	private int productOptionCode;
	private String productOptionDetailName;
	private int productSoldOut;
	
	public int getProductOptionDetailCode() {
		return productOptionDetailCode;
	}
	
	public void setProductOptionDetailCode(int productOptionDetailCode) {
		this.productOptionDetailCode = productOptionDetailCode;
	}
	
	public int getProductOptionCode() {
		return productOptionCode;
	}
	
	public void setProductOptionCode(int productOptionCode) {
		this.productOptionCode = productOptionCode;
	}
	
	public String getProductOptionDetailName() {
		return productOptionDetailName;
	}
	
	public void setProductOptionDetailName(String productOptionDetailName) {
		this.productOptionDetailName = productOptionDetailName;
	}

	public int getProductSoldOut() {
		return productSoldOut;
	}

	public void setProductSoldOut(int productSoldOut) {
		this.productSoldOut = productSoldOut;
	}
}
