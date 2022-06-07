package kr.co.littleworkshop.service;

import java.util.List;

import kr.co.littleworkshop.model.FdOpinion;
import kr.co.littleworkshop.util.FdPager;
import kr.co.littleworkshop.util.Pager;

public interface FdOpinionService {

	List<FdOpinion> fdOpinionList(FdPager pager);

	void fdOpinionAdd(FdOpinion fdOpinion);

}
