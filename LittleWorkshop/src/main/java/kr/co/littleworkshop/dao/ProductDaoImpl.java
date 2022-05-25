package kr.co.littleworkshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.littleworkshop.model.Category;
import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.model.ProductOption;
import kr.co.littleworkshop.model.ProductOptionDetail;
import kr.co.littleworkshop.util.Pager;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Product> list() {
		return sql.selectList("product.list");
	}

	@Override
	public Product item(int code) {
		return sql.selectOne("product.item", code);
	}

	@Override
	public List<Category> categories() {
		return sql.selectList("product.categories");
	}

	@Override
	public void productAdd(Product product) {
		sql.insert("product.productAdd", product);
	}

	@Override
	public void productOptionAdd(ProductOption productOption) {
		sql.insert("product.productOptionAdd", productOption);
	}

	@Override
	public void productOptionDetailAdd(ProductOptionDetail productOptionDetail) {
		sql.insert("product.productOptionDetailAdd", productOptionDetail);
	}

	@Override
	public void delete(int productCode) {
		sql.delete("product.productDelete", productCode);
	}

	@Override
	public void update(Product product) {
		sql.update("product.productUpdate", product);
	}

	@Override
	public void initProductOptions(int productCode) {
		sql.delete("product.initProductOptions", productCode);
	}

}
