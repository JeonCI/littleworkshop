package kr.co.littleworkshop.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.model.ProductImages;
import kr.co.littleworkshop.model.ProductOption;
import kr.co.littleworkshop.model.ProductOptionDetail;
import kr.co.littleworkshop.util.Pager;
import kr.co.littleworkshop.util.ProductPager;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Product> list(ProductPager pager) {
		return sql.selectList("product.list", pager);
	}

	@Override
	public Product item(int code) {
		return sql.selectOne("product.item", code);
	}

	@Override
	public List<Product> categories() {
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

	@Override
	public void imageUpload(ProductImages image) {
		sql.insert("product.imageUpload", image);
	}

	@Override
	public int total(Pager pager) {
		return sql.selectOne("product.total", pager);
	}

	@Override
	public List<Integer> getSoldOutList(int productCode) {
		return sql.selectList("product.getSoldOutList", productCode);
	}

	@Override
	public int getProductCategoryCode(int productCode) {
		return sql.selectOne("product.getProductCategoryCode", productCode);
	}

	@Override
	public void viewCount(int productCode) {
		sql.update("product.viewCount", productCode);
	}

	@Override
	public int inquery(HashMap<String, Object> map) {
		return sql.selectOne("product.inquery", map);
	}

	@Override
	public void addLikeList(HashMap<String, Object> map) {
		sql.insert("product.addLikeList", map);
	}

	@Override
	public void deleteLikeList(HashMap<String, Object> map) {
		sql.delete("product.deleteLikeList", map);
	}

}
