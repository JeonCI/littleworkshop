package kr.co.littleworkshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.littleworkshop.dao.CategoryDao;
import kr.co.littleworkshop.model.NoticeCategory;
import kr.co.littleworkshop.model.ProductCategory;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	CategoryDao dao;
	
	@Override
	public List<ProductCategory> productCategoryList() {
		return dao.productCategoryList();
	}

	@Override
	public void productCategoryAdd(ProductCategory productCategory) {
		dao.productCategoryAdd(productCategory);
	}

	@Override
	public ProductCategory productCategoryItem(int productCategoryCode) {
		ProductCategory item = new ProductCategory();
		
		item.setProductCategoryCode(productCategoryCode);
		
		return dao.productCategoryItem(item);
	}

	@Override
	public void productCateogryUpdate(ProductCategory productCategory) {
		dao.productCateogryUpdate(productCategory);
	}

	@Override
	public void productCategoryDelete(int productCategoryCode) {
		dao.productCategoryDelete(productCategoryCode);
	}

	@Override
	public List<NoticeCategory> noticeCategoryList() {
		return dao.noticeCategoryList();
	}

	@Override
	public void noticeCategoryAdd(NoticeCategory noticeCategory) {
		dao.noticeCategoryAdd(noticeCategory);
	}

	@Override
	public NoticeCategory noticeCategoryItem(int noticeCategoryCode) {
		NoticeCategory item = new NoticeCategory();
		
		item.setNoticeCategoryCode(noticeCategoryCode);
		
		return dao.noticeCategoryItem(item);
	}

	@Override
	public void noticeCateogryUpdate(NoticeCategory noticeCategory) {
		dao.noticeCateogryUpdate(noticeCategory);
	}

	@Override
	public void noticeCategoryDelete(int noticeCategoryCode) {
		dao.noticeCategoryDelete(noticeCategoryCode);
	}

}
