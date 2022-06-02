package kr.co.littleworkshop.service;

import java.util.List;

import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.util.Pager;

public interface ProductService {

	List<Product> list(Pager pager);

	Product item(int code);

	List<Product> categories();

	void update(List<String> productOptionNames, List<String> productOptionDetailNames, List<Integer> optionCount, List<Integer> necessaryOptionValues, List<Integer> soldOutValues, List<String> tagNameList, Product product);

	void delete(int productCode);

	void imageUpload(Product product);

	List<Integer> getSoldOutList(int productCode);

	int getProductCategoryCode(int productCode);

	void add(List<String> productOptionNames, List<String> productOptionDetailNames, List<Integer> optionCount,
			List<Integer> necessaryOptionValues, List<Integer> soldOutValues, List<String> tagNameList,
			Product product);

}
