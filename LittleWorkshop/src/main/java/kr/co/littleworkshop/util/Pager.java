package kr.co.littleworkshop.util;

import java.util.ArrayList;
import java.util.List;

public class Pager {
	private int page = 1;
	private int perPage = 20;
	private float total;
	private int perGroup = 10;
	
	private String keyword;
	private int search = 0;
	
	
	
	public String getQuery() {
		String query = "";

		if (search != 0)
			query += "&search=" + search;

		if (keyword != null)
			query += "&keyword=" + keyword;

		return query;
	}
	
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getSearch() {
		return search;
	}

	public void setSearch(int search) {
		this.search = search;
	}

	public List<Integer> getList() {
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		int startPage = (page - 1) / perGroup * perGroup + 1;
		
		for(int index = startPage; index < (startPage + perGroup) && index <= getLast(); index++) {
			list.add(index);
		}
		
		if(list.isEmpty())
			list.add(1);
		
		return list;
	}
	
	public int getPrev() {
		return page <= perGroup ? 1 : (((page - 1) / perGroup) - 1) * perGroup + 1;
	}
	
	public int getNext() {
		int next = (((page - 1) / perGroup) + 1) * perGroup + 1;
		int last = getLast();
		
		return next < last ? next : last;
	}

	public int getLast() {
		return (int) Math.ceil(total / perPage);
	}
	
	public int getPerGroup() {
		return perGroup;
	}

	public void setPerGroup(int perGroup) {
		this.perGroup = perGroup;
	}
	
	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		this.page = page;
	}
	
	public int getPerPage() {
		return perPage;
	}
	
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

}
