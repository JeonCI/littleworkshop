package kr.co.littleworkshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.littleworkshop.dao.FdDao;
import kr.co.littleworkshop.model.Fd;
import kr.co.littleworkshop.model.FdOption;
import kr.co.littleworkshop.model.FdOptionDetail;

@Service
public class FdServiceImpl implements FdService {
	
	@Autowired
	FdDao dao;
	
	private void FdOptionAdd(List<String> fdOptionNames,
							List<String> fdOptionDetailNames, List<Integer> optionCount,
							List<Integer> necessaryOptionValues, List<Integer> fdSoldOutValues, int fdCode) {
		
		for(int i = 0; i < fdOptionNames.size(); i++) {
			FdOption fdOption = new FdOption();
			
			fdOption.setFdOptionName(fdOptionNames.get(i));
			fdOption.setFdCode(fdCode);
			fdOption.setFdNecessaryOption(necessaryOptionValues.get(i));
			
			dao.fdOptionAdd(fdOption);
			
			for(int k = 0; k < optionCount.get(i); k++) {
				FdOptionDetail fdOptionDetail = new FdOptionDetail();
				
				fdOptionDetail.setFdOptionCode(fdOption.getFdOptionCode());
				fdOptionDetail.setFdOptionDetailName(fdOptionDetailNames.get(0));
				fdOptionDetail.setFdSoldOut(fdSoldOutValues.get(0));
				fdOptionDetailNames.remove(0);
				fdSoldOutValues.remove(0);
				
				dao.fdOptionDetailAdd(fdOptionDetail);
			}
		}
	}
	
	@Override
	public List<Fd> list() {
		return dao.list();
	}

	@Override
	public Fd item(int fdCode) {
		return dao.item(fdCode);
	}

	@Override
	public List<Fd> categories() {
		return dao.categories();
	}

	@Override
	public void add(List<String> fdOptionNames, List<String> fdOptionDetailNames, List<Integer> optionCount,
			List<Integer> necessaryOptionValues, List<Integer> fdSoldOutValues, Fd fd) {
		dao.add(fd);
		
		FdOptionAdd(fdOptionNames, fdOptionDetailNames, optionCount, necessaryOptionValues, fdSoldOutValues, fd.getFdCode());
	}

	@Override
	public void update(List<String> fdOptionNames, List<String> fdOptionDetailNames, List<Integer> optionCount,
			List<Integer> necessaryOptionValues, List<Integer> fdSoldOutValues, Fd fd) {
		dao.update(fd);
		
		dao.initFdOption(fd.getFdCode());
		
		FdOptionAdd(fdOptionNames, fdOptionDetailNames, optionCount, necessaryOptionValues, fdSoldOutValues, fd.getFdCode());
	}

	@Override
	public void delete(int fdCode) {
		dao.delete(fdCode);
	}

	@Override
	public void viewCount(int fdCode) {
		Fd fd = new Fd();
		int nowCount = dao.nowCount(fdCode);
		
		fd.setFdCode(fdCode);
		fd.setFdViewCount(nowCount);
		
		dao.viewCount(fd);
	}

	@Override
	public void participateFd(int participationPrice, int fdCode, String id) {
		dao.participateFd(participationPrice, fdCode, id);
	}

}
