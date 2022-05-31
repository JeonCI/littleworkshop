package kr.co.littleworkshop.service;

import java.util.List;

import kr.co.littleworkshop.model.Category;
import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.util.Pager;

public interface ProductService {

	List<Product> list(Pager pager);

	Product item(int code);

	List<Product> categories();

	void add(List<String> productOptionNames, List<String> productOptionDetailNames, List<Integer> optionCount,
			List<Integer> necessaryOptionValues, List<Integer> soldOutValues, Product product);

	void update(List<String> productOptionNames, List<String> productOptionDetailNames, List<Integer> optionCount, List<Integer> necessaryOptionValues, List<Integer> soldOutValues, Product product);

	void delete(int productCode);

	void imageUpload(Product product);

}
