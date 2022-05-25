package kr.co.littleworkshop.model;

public class AccountInquery {
	private int accountInqueryCode;
	private String accountId;
	private String accountInqueryContent;
	private String accountInquerySubject;
	
	private int accountInqueryAnswerCode;
	private String accountInqueryAnswer;
	
	private int accountInqueryCategoryCode;
	private String accountInqueryCategory;
	
	public int getAccountInqueryCategoryCode() {
		return accountInqueryCategoryCode;
	}

	public void setAccountInqueryCategoryCode(int accountInqueryCategoryCode) {
		this.accountInqueryCategoryCode = accountInqueryCategoryCode;
	}

	public String getAccountInqueryCategory() {
		return accountInqueryCategory;
	}

	public void setAccountInqueryCategory(String accountInqueryCategory) {
		this.accountInqueryCategory = accountInqueryCategory;
	}

	public int getAccountInqueryCode() {
		return accountInqueryCode;
	}
	
	public void setAccountInqueryCode(int accountInqueryCode) {
		this.accountInqueryCode = accountInqueryCode;
	}
	
	public String getAccountId() {
		return accountId;
	}
	
	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	
	public String getAccountInqueryContent() {
		return accountInqueryContent;
	}
	
	public void setAccountInqueryContent(String accountInqueryContent) {
		this.accountInqueryContent = accountInqueryContent;
	}
	
	public int getAccountInqueryAnswerCode() {
		return accountInqueryAnswerCode;
	}
	
	public void setAccountInqueryAnswerCode(int accountInqueryAnswerCode) {
		this.accountInqueryAnswerCode = accountInqueryAnswerCode;
	}
	
	public String getAccountInqueryAnswer() {
		return accountInqueryAnswer;
	}
	
	public void setAccountInqueryAnswer(String accountInqueryAnswer) {
		this.accountInqueryAnswer = accountInqueryAnswer;
	}

	public String getAccountInquerySubject() {
		return accountInquerySubject;
	}

	public void setAccountInquerySubject(String accountInquerySubject) {
		this.accountInquerySubject = accountInquerySubject;
	}
}
