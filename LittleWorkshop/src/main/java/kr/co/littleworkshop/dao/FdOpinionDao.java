package kr.co.littleworkshop.dao;

import java.util.List;

import kr.co.littleworkshop.model.FdOpinion;
import kr.co.littleworkshop.util.FdPager;

public interface FdOpinionDao {

	List<FdOpinion> fdOpinionList(FdPager pager);

	void fdOpinionAdd(FdOpinion fdOpinion);

	int total(FdPager pager);

	void confirm(FdOpinion fdOpinion);

	void removeConfirm(FdOpinion fdOpinion);

	void updateProducerAnswer(FdOpinion fdOpinion);

}
