package kr.co.littleworkshop.model;

import java.util.Date;
import java.util.List;

public class Fd {
	private int fdCode;
	private String fdSellerId;
	private int productCategoryCode;
	private String productCategory;
	private String fdName;
	private int fdPrice;
	private String fdDescription;
	private Date fdRegDate;
	private int fdViewCount;
	private int fdProgressState;
	private int fdMinimumUser;
	private Date fdRecruitmentPeriod;
	
	private List<FdOption> fdOptionList;
	private List<FdImages> fdImagesList;
	private List<Tag> tagList;
	
	public String getFdState() {
		if(fdProgressState == 0) {
			return "모집중";
		} else if(fdProgressState == 1) {
			return "진행중";
		} else if(fdProgressState == 2) {
			return "결제중";
		} else if(fdProgressState == 3) {
			return "제작 및 순차배송중";
		} else if(fdProgressState == 4) {
			return "완료";
		} else
			return "?";
	}
	
	public int getFdCode() {
		return fdCode;
	}

	public void setFdCode(int fdCode) {
		this.fdCode = fdCode;
	}

	public String getFdSellerId() {
		return fdSellerId;
	}

	public void setFdSellerId(String fdSellerId) {
		this.fdSellerId = fdSellerId;
	}

	public int getProductCategoryCode() {
		return productCategoryCode;
	}

	public void setProductCategoryCode(int productCategoryCode) {
		this.productCategoryCode = productCategoryCode;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String getFdName() {
		return fdName;
	}

	public void setFdName(String fdName) {
		this.fdName = fdName;
	}

	public int getFdPrice() {
		return fdPrice;
	}

	public void setFdPrice(int fdPrice) {
		this.fdPrice = fdPrice;
	}

	public String getFdDescription() {
		return fdDescription;
	}

	public void setFdDescription(String fdDescription) {
		this.fdDescription = fdDescription;
	}

	public Date getFdRegDate() {
		return fdRegDate;
	}

	public void setFdRegDate(Date fdRegDate) {
		this.fdRegDate = fdRegDate;
	}

	public int getFdViewCount() {
		return fdViewCount;
	}

	public void setFdViewCount(int fdViewCount) {
		this.fdViewCount = fdViewCount;
	}

	public int getFdProgressState() {
		return fdProgressState;
	}

	public void setFdProgressState(int fdProgressState) {
		this.fdProgressState = fdProgressState;
	}

	public int getFdMinimumUser() {
		return fdMinimumUser;
	}

	public void setFdMinimumUser(int fdMinimumUser) {
		this.fdMinimumUser = fdMinimumUser;
	}

	public List<FdOption> getFdOptionList() {
		return fdOptionList;
	}

	public void setFdOptionList(List<FdOption> fdOptionList) {
		this.fdOptionList = fdOptionList;
	}

	public List<FdImages> getFdImagesList() {
		return fdImagesList;
	}

	public void setFdImagesList(List<FdImages> fdImagesList) {
		this.fdImagesList = fdImagesList;
	}

	public Date getFdRecruitmentPeriod() {
		return fdRecruitmentPeriod;
	}

	public void setFdRecruitmentPeriod(Date fdRecruitmentPeriod) {
		this.fdRecruitmentPeriod = fdRecruitmentPeriod;
	}

	public List<Tag> getTagList() {
		return tagList;
	}

	public void setTagList(List<Tag> tagList) {
		this.tagList = tagList;
	}
}
