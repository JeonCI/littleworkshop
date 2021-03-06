package kr.co.littleworkshop.service;

import java.util.List;

import kr.co.littleworkshop.model.Fd;
import kr.co.littleworkshop.util.FdPager;

public interface FdService {

	List<Fd> list(FdPager pager);

	Fd item(int fdCode);

	List<Fd> categories();

	void add(List<String> fdOptionNames, List<String> fdOptionDetailNames, List<Integer> optionCount,
			List<Integer> necessaryOptionValues, List<Integer> soldOutValues, List<String> tagNameList, Fd fd);

	void update(List<String> fdOptionNames, List<String> fdOptionDetailNames, List<Integer> optionCount,
			List<Integer> necessaryOptionValues, List<Integer> soldOutValues, List<String> tagNameList, Fd fd);

	void delete(int fdCode);

	void viewCount(int fdCode);

	void participateFd(int participationPrice, int fdCode, String id);

}
