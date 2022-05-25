package kr.co.littleworkshop.model;

public class AccountAddress {
	private int addressCode;
	private String id;
	private int postcode;
	private String address;
	private String recipient;
	private int receiveWay;
	private String addressName;
	
	public int getAddressCode() {
		return addressCode;
	}
	
	public void setAddressCode(int addressCode) {
		this.addressCode = addressCode;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public int getPostcode() {
		return postcode;
	}
	
	public void setPostcode(int postcode) {
		this.postcode = postcode;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getRecipient() {
		return recipient;
	}
	
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	
	public int getReceiveWay() {
		return receiveWay;
	}
	
	public void setReceiveWay(int receiveWay) {
		this.receiveWay = receiveWay;
	}
	
	public String getAddressName() {
		return addressName;
	}
	
	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}
}
