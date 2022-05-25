package kr.co.littleworkshop.model;

import java.util.Date;

public class Notice {
	private int noticeCode;
	private int noticeCategoryCode;
	private String noticeCategory;
	private String noticeRegistrant;
	private String noticeContents;
	private Date noticeRegDate;
	private int noticeImportant;
	private String noticeSubject;
	
	public int getNoticeCode() {
		return noticeCode;
	}
	
	public void setNoticeCode(int noticeCode) {
		this.noticeCode = noticeCode;
	}
	
	public int getNoticeCategoryCode() {
		return noticeCategoryCode;
	}
	
	public void setNoticeCategoryCode(int noticeCategoryCode) {
		this.noticeCategoryCode = noticeCategoryCode;
	}
	
	public String getNoticeCategory() {
		return noticeCategory;
	}
	
	public void setNoticeCategory(String noticeCategory) {
		this.noticeCategory = noticeCategory;
	}
	
	public String getNoticeRegistrant() {
		return noticeRegistrant;
	}
	
	public void setNoticeRegistrant(String noticeRegistrant) {
		this.noticeRegistrant = noticeRegistrant;
	}
	
	public String getNoticeContents() {
		return noticeContents;
	}
	
	public void setNoticeContents(String noticeContents) {
		this.noticeContents = noticeContents;
	}
	
	public Date getNoticeRegDate() {
		return noticeRegDate;
	}
	
	public void setNoticeRegDate(Date noticeRegDate) {
		this.noticeRegDate = noticeRegDate;
	}
	
	public int getNoticeImportant() {
		return noticeImportant;
	}
	
	public void setNoticeImportant(int noticeImportant) {
		this.noticeImportant = noticeImportant;
	}

	public String getNoticeSubject() {
		return noticeSubject;
	}

	public void setNoticeSubject(String noticeSubject) {
		this.noticeSubject = noticeSubject;
	}
	
}
