package kr.co.littleworkshop.util;

public class ProductPager extends Pager {
	private String condition;
	private String sellerId;
	private String id;
	
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
