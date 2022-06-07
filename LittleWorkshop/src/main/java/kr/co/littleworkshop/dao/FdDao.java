package kr.co.littleworkshop.dao;

import java.util.List;

import kr.co.littleworkshop.model.Fd;
import kr.co.littleworkshop.model.FdOption;
import kr.co.littleworkshop.model.FdOptionDetail;
import kr.co.littleworkshop.util.FdPager;

public interface FdDao {

	List<Fd> list(FdPager pager);

	Fd item(int fdCode);

	List<Fd> categories();

	void add(Fd fd);

	void update(Fd fd);

	void initFdOption(int i);

	void fdOptionAdd(FdOption fdOption);

	void fdOptionDetailAdd(FdOptionDetail fdOptionDetail);

	void delete(int fdCode);

	int nowCount(int fdCode);

	void viewCount(Fd fd);

	void participateFd(int participationPrice, int fdCode, String id);

}
