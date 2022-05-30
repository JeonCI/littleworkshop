package kr.co.littleworkshop.service;

import java.util.List;

import kr.co.littleworkshop.model.Fd;

public interface FdService {

	List<Fd> list();

	Fd item(int fdCode);

	List<Fd> categories();

	void add(List<String> fdOptionNames, List<String> fdOptionDetailNames, List<Integer> optionCount,
			List<Integer> necessaryOptionValues, Fd fd);

	void update(List<String> fdOptionNames, List<String> fdOptionDetailNames, List<Integer> optionCount,
			List<Integer> necessaryOptionValues, Fd fd);

	void delete(int fdCode);

}
