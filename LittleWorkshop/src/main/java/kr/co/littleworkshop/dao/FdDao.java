package kr.co.littleworkshop.dao;

import java.util.List;

import kr.co.littleworkshop.model.Fd;
import kr.co.littleworkshop.model.FdOption;
import kr.co.littleworkshop.model.FdOptionDetail;

public interface FdDao {

	List<Fd> list();

	Fd item(int fdCode);

	List<Fd> categories();

	void add(Fd fd);

	void update(Fd fd);

	void initFdOption(int i);

	void fdOptionAdd(FdOption fdOption);

	void fdOptionDetailAdd(FdOptionDetail fdOptionDetail);

	void delete(int fdCode);

}
