package kr.co.littleworkshop.model;

import java.util.Date;
import java.util.List;

public class Product {
	private int productCode;
	private String sellerId;
	private int productCategoryCode;
	private String productCategory;
	private String productName;
	private int productPrice;
	private String productDescription;
	private Date productRegDate;
	
	private int productLikeCount;
	private int productSellCount;
	private int productViewCount;
	
	private List<ProductOption> productOptionList;
	private List<ProductImages> productImageList;
	private List<Basket> basketList;
	private List<Tag> tagList;
//	private List<String> orderInfo;
//	
//	
//	
//	
//
//
//	public List<String> getOrderInfo() {
//		return orderInfo;
//	}
//
//	public void setOrderInfo(List<String> orderInfo) {
//		this.orderInfo = orderInfo;
//	}

	public List<Basket> getBasketList() {
		return basketList;
	}

	public void setBasketList(List<Basket> basketList) {
		this.basketList = basketList;
	}

	public List<ProductImages> getProductImageList() {
		return productImageList;
	}

	public void setProductImageList(List<ProductImages> productImageList) {
		this.productImageList = productImageList;
	}

	public int getProductCategoryCode() {
		return productCategoryCode;
	}

	public void setProductCategoryCode(int productCategoryCode) {
		this.productCategoryCode = productCategoryCode;
	}

	public List<ProductOption> getProductOptionList() {
		return productOptionList;
	}

	public void setProductOptionList(List<ProductOption> productOptionList) {
		this.productOptionList = productOptionList;
	}

	public int getProductCode() {
		return productCode;
	}
	
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	

	public String getSellerId() {
		return sellerId;
	}
	
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	
	public String getProductName() {
		return productName;
	}
	
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public int getProductPrice() {
		return productPrice;
	}
	
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	
	public String getProductDescription() {
		return productDescription;
	}
	
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	
	public Date getProductRegDate() {
		return productRegDate;
	}
	
	public void setProductRegDate(Date productRegDate) {
		this.productRegDate = productRegDate;
	}
	
	public int getProductLikeCount() {
		return productLikeCount;
	}
	
	public void setProductLikeCount(int productLikeCount) {
		this.productLikeCount = productLikeCount;
	}
	
	

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public int getProductSellCount() {
		return productSellCount;
	}

	public void setProductSellCount(int productSellCount) {
		this.productSellCount = productSellCount;
	}

	public List<Tag> getTagList() {
		return tagList;
	}

	public void setTagList(List<Tag> tagList) {
		this.tagList = tagList;
	}

	public int getProductViewCount() {
		return productViewCount;
	}

	public void setProductViewCount(int productViewCount) {
		this.productViewCount = productViewCount;
	}
}
