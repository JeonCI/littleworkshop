package kr.co.littleworkshop.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.littleworkshop.model.Category;
import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.model.ProductImages;
import kr.co.littleworkshop.model.ProductOption;
import kr.co.littleworkshop.model.ProductOptionDetail;
import kr.co.littleworkshop.util.Pager;
import kr.co.littleworkshop.util.ProductPager;

public interface ProductDao {

	List<Product> list(ProductPager pager);

	Product item(int code);

	List<Product> categories();

	void productAdd(Product product);

	void productOptionAdd(ProductOption productOption);

	void productOptionDetailAdd(ProductOptionDetail productOptionDetail);

	void delete(int productCode);

	void update(Product product);

	void initProductOptions(int productCode);

	void imageUpload(ProductImages image);

	int total(Pager pager);

	List<Integer> getSoldOutList(int productCode);

	int getProductCategoryCode(int productCode);

	void viewCount(int productCode);

	int inquery(HashMap<String, Object> map);

	void addLikeList(HashMap<String, Object> map);

	void deleteLikeList(HashMap<String, Object> map);

	List<Product> likeList(String id);

}
