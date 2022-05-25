package kr.co.littleworkshop.dao;

import java.util.List;

import kr.co.littleworkshop.model.NoticeCategory;
import kr.co.littleworkshop.model.ProductCategory;

public interface CategoryDao {

	List<ProductCategory> productCategoryList();

	void productCategoryAdd(ProductCategory productCategory);

	ProductCategory productCategoryItem(ProductCategory item);

	void productCateogryUpdate(ProductCategory productCategory);

	void productCategoryDelete(int productCategoryCode);

	List<NoticeCategory> noticeCategoryList();

	void noticeCategoryAdd(NoticeCategory noticeCategory);

	NoticeCategory noticeCategoryItem(NoticeCategory item);

	void noticeCateogryUpdate(NoticeCategory noticeCategory);

	void noticeCategoryDelete(int noticeCategoryCode);

}
