package kr.co.littleworkshop.util;

public class ProductPager extends Pager {
	private String condition;
	
	public String getQuery() {
		String query = super.getQuery();
		
		if(condition != null)
			query += "&condition=" + condition;
		
	
		return query;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	
	
	
	
}
