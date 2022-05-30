package kr.co.littleworkshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.littleworkshop.dao.FdOpinionDao;
import kr.co.littleworkshop.model.FdOpinion;

@Service
public class FdOpinionServiceImpl implements FdOpinionService {
	
	@Autowired
	FdOpinionDao dao;
	
	@Override
	public List<FdOpinion> fdOpinionList(int fdCode) {
		return dao.fdOpinionList(fdCode);
	}

	@Override
	public void fdOpinionAdd(FdOpinion fdOpinion) {
		dao.fdOpinionAdd(fdOpinion);
	}

}
