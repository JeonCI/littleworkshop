package kr.co.littleworkshop.service;

import java.util.List;

import kr.co.littleworkshop.model.NoticeCategory;
import kr.co.littleworkshop.model.ProductCategory;

public interface CategoryService {

	List<ProductCategory> productCategoryList();

	void productCategoryAdd(ProductCategory productCategory);

	ProductCategory productCategoryItem(int productCategoryCode);

	void productCateogryUpdate(ProductCategory productCategory);

	void productCategoryDelete(int productCategoryCode);

	List<NoticeCategory> noticeCategoryList();

	void noticeCategoryAdd(NoticeCategory noticeCategory);

	NoticeCategory noticeCategoryItem(int noticeCategoryCode);

	void noticeCateogryUpdate(NoticeCategory noticeCategory);

	void noticeCategoryDelete(int noticeCategoryCode);

}
