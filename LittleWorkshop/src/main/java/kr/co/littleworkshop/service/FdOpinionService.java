package kr.co.littleworkshop.service;

import java.util.List;

import kr.co.littleworkshop.model.FdOpinion;

public interface FdOpinionService {

	List<FdOpinion> fdOpinionList();

	void fdOpinionAdd(FdOpinion fdOpinion);

}
