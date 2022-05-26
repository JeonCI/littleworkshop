package kr.co.littleworkshop.model;

import java.util.Date;
import java.util.List;

public class Account {
	private String id;
	private String passwd;
	private String accountName;
	private String nickName;
	private String phone;
	private String email;
	private int classify;
	private Date accountRegDate;
	private String accountSaltCode;
	
	private List<AccountAddress> address;
	
	public String getClassifyStr() {
		if(classify == 1) {
			return "일반회원";
		} else if(classify == 2) {
			return "판매자";
		} else if(classify == 3) {
			return "관리자";
		} else
			return "false";
	}
	
	public List<AccountAddress> getAddress() {
		return address;
	}

	public void setAddress(List<AccountAddress> address) {
		this.address = address;
	}

	private String saltCode;
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPasswd() {
		return passwd;
	}
	
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	public String getNickName() {
		return nickName;
	}
	
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getClassify() {
		return classify;
	}
	
	public void setClassify(int classify) {
		this.classify = classify;
	}
	
	public Date getAccountRegDate() {
		return accountRegDate;
	}
	
	public void setAccountRegDate(Date accountRegDate) {
		this.accountRegDate = accountRegDate;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getSaltCode() {
		return saltCode;
	}

	public void setSaltCode(String saltCode) {
		this.saltCode = saltCode;
	}

	public String getAccountSaltCode() {
		return accountSaltCode;
	}

	public void setAccountSaltCode(String accountSaltCode) {
		this.accountSaltCode = accountSaltCode;
	}
	
}
