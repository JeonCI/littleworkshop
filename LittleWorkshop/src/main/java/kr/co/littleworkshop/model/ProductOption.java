package kr.co.littleworkshop.model;

import java.util.List;

public class ProductOption {
	private int productOptionCode;
	private int productCode;
	private String productOptionName;
	private int productNecessaryOption;
	
	private List<ProductOptionDetail> productOptionDetail;

	public int getProductOptionCode() {
		return productOptionCode;
	}

	public void setProductOptionCode(int productOptionCode) {
		this.productOptionCode = productOptionCode;
	}

	public int getProductCode() {
		return productCode;
	}

	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}

	public String getProductOptionName() {
		return productOptionName;
	}

	public void setProductOptionName(String productOptionName) {
		this.productOptionName = productOptionName;
	}

	public int getProductNecessaryOption() {
		return productNecessaryOption;
	}

	public void setProductNecessaryOption(int productNecessaryOption) {
		this.productNecessaryOption = productNecessaryOption;
	}

	public List<ProductOptionDetail> getProductOptionDetail() {
		return productOptionDetail;
	}

	public void setProductOptionDetail(List<ProductOptionDetail> productOptionDetail) {
		this.productOptionDetail = productOptionDetail;
	}
}
