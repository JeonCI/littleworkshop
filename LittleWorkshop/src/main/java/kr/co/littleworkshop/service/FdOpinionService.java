package kr.co.littleworkshop.service;

import java.util.List;

import kr.co.littleworkshop.model.FdOpinion;

public interface FdOpinionService {

	List<FdOpinion> fdOpinionList(int fdCode);

	void fdOpinionAdd(FdOpinion fdOpinion);

}
