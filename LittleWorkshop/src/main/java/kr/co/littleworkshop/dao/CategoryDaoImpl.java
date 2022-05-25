package kr.co.littleworkshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.littleworkshop.model.NoticeCategory;
import kr.co.littleworkshop.model.ProductCategory;

@Repository
public class CategoryDaoImpl implements CategoryDao {
	
	@Autowired
	SqlSession sql;
	
	@Override
	public List<ProductCategory> productCategoryList() {
		return sql.selectList("category.productCategoryList");
	}

	@Override
	public void productCategoryAdd(ProductCategory productCategory) {
		sql.insert("category.productCategoryAdd", productCategory);
	}

	@Override
	public ProductCategory productCategoryItem(ProductCategory item) {
		return sql.selectOne("category.productCategoryItem", item);
	}

	@Override
	public void productCateogryUpdate(ProductCategory productCategory) {
		sql.update("category.productCategoryUpdate", productCategory);
	}

	@Override
	public void productCategoryDelete(int productCategoryCode) {
		sql.delete("category.productCategoryDelete", productCategoryCode);
	}

	@Override
	public List<NoticeCategory> noticeCategoryList() {
		return sql.selectList("category.noticeCategoryList");
	}

	@Override
	public void noticeCategoryAdd(NoticeCategory noticeCategory) {
		sql.insert("category.noticeCategoryAdd", noticeCategory);
	}

	@Override
	public NoticeCategory noticeCategoryItem(NoticeCategory item) {
		return sql.selectOne("category.noticeCategoryItem", item);
	}

	@Override
	public void noticeCateogryUpdate(NoticeCategory noticeCategory) {
		sql.update("category.noticeCateogryUpdate", noticeCategory);
	}

	@Override
	public void noticeCategoryDelete(int noticeCategoryCode) {
		sql.delete("category.noticeCategoryDelete", noticeCategoryCode);
	}

}
