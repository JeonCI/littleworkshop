package kr.co.littleworkshop.model;

import java.util.List;

public class FdOption {
	private int fdOptionCode;
	private int fdCode;
	private String fdOptionName;
	private int fdNecessaryOption;
	
	private List<FdOptionDetail> fdOptionDeatil;

	public int getFdOptionCode() {
		return fdOptionCode;
	}

	public void setFdOptionCode(int fdOptionCode) {
		this.fdOptionCode = fdOptionCode;
	}

	public int getFdCode() {
		return fdCode;
	}

	public void setFdCode(int fdCode) {
		this.fdCode = fdCode;
	}

	public String getFdOptionName() {
		return fdOptionName;
	}

	public void setFdOptionName(String fdOptionName) {
		this.fdOptionName = fdOptionName;
	}

	public int getFdNecessaryOption() {
		return fdNecessaryOption;
	}

	public void setFdNecessaryOption(int fdNecessaryOption) {
		this.fdNecessaryOption = fdNecessaryOption;
	}

	public List<FdOptionDetail> getFdOptionDeatil() {
		return fdOptionDeatil;
	}

	public void setFdOptionDeatil(List<FdOptionDetail> fdOptionDeatil) {
		this.fdOptionDeatil = fdOptionDeatil;
	}
}
