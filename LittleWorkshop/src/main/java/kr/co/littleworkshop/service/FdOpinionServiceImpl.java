package kr.co.littleworkshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.littleworkshop.dao.FdOpinionDao;
import kr.co.littleworkshop.model.FdOpinion;
import kr.co.littleworkshop.util.FdPager;

@Service
public class FdOpinionServiceImpl implements FdOpinionService {
	
	@Autowired
	FdOpinionDao dao;
	
	@Override
	public List<FdOpinion> fdOpinionList(FdPager pager) {
		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.fdOpinionList(pager);
	}

	@Override
	public void fdOpinionAdd(FdOpinion fdOpinion) {
		dao.fdOpinionAdd(fdOpinion);
	}

	@Override
	public void confirm(FdOpinion fdOpinion) {
		dao.confirm(fdOpinion);
	}

}
