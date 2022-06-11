package kr.co.littleworkshop.util;

public class orderPager extends Pager {
	private int status = 1;
	
	public String getQuery() {
		String query = super.getQuery();
		
		if(status != 0)
			query += "&status=" + status;

		
		return query;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	

	
	
	
	
}
