package kr.co.littleworkshop.model;

public class FdOptionDetail {
	private int fdOptionDetailCode;
	private int fdOptionCode;
	private String fdOptionDetailName;
	private int fdSoldOut;
	
	public int getFdOptionDetailCode() {
		return fdOptionDetailCode;
	}
	
	public void setFdOptionDetailCode(int fdOptionDetailCode) {
		this.fdOptionDetailCode = fdOptionDetailCode;
	}
	
	public int getFdOptionCode() {
		return fdOptionCode;
	}
	
	public void setFdOptionCode(int fdOptionCode) {
		this.fdOptionCode = fdOptionCode;
	}
	
	public String getFdOptionDetailName() {
		return fdOptionDetailName;
	}
	
	public void setFdOptionDetailName(String fdOptionDetailName) {
		this.fdOptionDetailName = fdOptionDetailName;
	}
	
	public int getFdSoldOut() {
		return fdSoldOut;
	}
	
	public void setFdSoldOut(int fdSoldOut) {
		this.fdSoldOut = fdSoldOut;
	}
}
