package kr.co.littleworkshop.dao;

import java.util.List;

import kr.co.littleworkshop.model.FdOpinion;

public interface FdOpinionDao {

	List<FdOpinion> fdOpinionList(int fdCode);

	void fdOpinionAdd(FdOpinion fdOpinion);

}
