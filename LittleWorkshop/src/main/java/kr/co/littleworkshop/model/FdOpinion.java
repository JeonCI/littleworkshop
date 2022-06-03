package kr.co.littleworkshop.model;

import java.util.Date;

public class FdOpinion {
	private int fdOpinionCode;
	private int fdCode;
	private String fdOpinion;
	private int goodCount;
	private int producerSelection;
	private String writerId;
	private Date fdOpinionRegDate;
	
	private String fdOpinionAnswer;
	
	public int getFdOpinionCode() {
		return fdOpinionCode;
	}
	
	public void setFdOpinionCode(int fdOpinionCode) {
		this.fdOpinionCode = fdOpinionCode;
	}
	
	public int getFdCode() {
		return fdCode;
	}
	
	public void setFdCode(int fdCode) {
		this.fdCode = fdCode;
	}
	
	public String getFdOpinion() {
		return fdOpinion;
	}
	
	public void setFdOpinion(String fdOpinion) {
		this.fdOpinion = fdOpinion;
	}
	
	public int getGoodCount() {
		return goodCount;
	}
	
	public void setGoodCount(int goodCount) {
		this.goodCount = goodCount;
	}
	
	public int getProducerSelection() {
		return producerSelection;
	}
	
	public void setProducerSelection(int producerSelection) {
		this.producerSelection = producerSelection;
	}

	public String getFdOpinionAnswer() {
		return fdOpinionAnswer;
	}

	public void setFdOpinionAnswer(String fdOpinionAnswer) {
		this.fdOpinionAnswer = fdOpinionAnswer;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public Date getFdOpinionRegDate() {
		return fdOpinionRegDate;
	}

	public void setFdOpinionRegDate(Date fdOpinionRegDate) {
		this.fdOpinionRegDate = fdOpinionRegDate;
	}
}
