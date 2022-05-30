package kr.co.littleworkshop.model;

import kr.co.littleworkshop.util.UploadFile;

public class ProductImages implements UploadFile{
	
	int productImageCode;
	int productCode;
	String productImageUuid;
	String productImageName;
	
	public int getProductImageCode() {
		return productImageCode;
	}
	public void setProductImageCode(int productImageCode) {
		this.productImageCode = productImageCode;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public String getProductImageUuid() {
		return productImageUuid;
	}
	public void setProductImageUuid(String productImageUuid) {
		this.productImageUuid = productImageUuid;
	}
	public String getProductImageName() {
		return productImageName;
	}
	public void setProductImageName(String productImageName) {
		this.productImageName = productImageName;
	}
	@Override
	public void setFileNm(String filename) {
		this.productImageName = filename;
	}
	@Override
	public void setFileUuid(String uuid) {
		this.productImageUuid = uuid;
	}
	@Override
	public String getFileNm() {
		return productImageName;
	}
	@Override
	public String getFileUuid() {
		return productImageUuid;
	}
	
	
	
	
	

}
