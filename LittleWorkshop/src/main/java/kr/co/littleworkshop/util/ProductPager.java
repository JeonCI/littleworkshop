package kr.co.littleworkshop.util;

public class ProductPager extends Pager {
	private String condition;
	private String sellerId;
	private String id;
	private int minPrice;
	private int maxPrice;
	
	
	
	public int getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}

	public int getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}

	public String getQuery() {
		String query = super.getQuery();
		
		if(condition != null)
			query += "&condition=" + condition;

		return query;
	}

	public String getType() {
		String type = "";
		
		if(condition != null)
			type += "&condition=" + condition;

		return type;
	}
	

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
	
	
	
}
