package kr.co.littleworkshop.util;

public class FdPager extends Pager {
	private String condition;
	private int fdCode;
	
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

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public int getFdCode() {
		return fdCode;
	}

	public void setFdCode(int fdCode) {
		this.fdCode = fdCode;
	}
}
