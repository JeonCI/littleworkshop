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
	private int productBuyersCount;
	private int likeState;
	private double salesRate;
	
	private String orderInfo;
	private int orderAmount;
	private int orderCode;
	
	private int reviewCode;
	private String reviewContents;
	private Date reviewDate;
	private int reviewScore;
	
	private List<ProductOption> productOptionList;
	private List<ProductImages> productImageList;
	private List<Basket> basketList;
	private List<Tag> tagList;


	
	
	
	public int getReviewCode() {
		return reviewCode;
	}

	public void setReviewCode(int reviewCode) {
		this.reviewCode = reviewCode;
	}

	public String getReviewContents() {
		return reviewContents;
	}

	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public int getReviewScore() {
		return reviewScore;
	}

	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}

	public int getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
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

	public double getSalesRate() {
		return salesRate;
	}

	public void setSalesRate(double salesRate) {
		this.salesRate = salesRate;
	}

	public int getProductBuyersCount() {
		return productBuyersCount;
	}

	public void setProductBuyersCount(int productBuyersCount) {
		this.productBuyersCount = productBuyersCount;
	}

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

	public int getLikeState() {
		return likeState;
	}

	public void setLikeState(int likeState) {
		this.likeState = likeState;
	}
}
