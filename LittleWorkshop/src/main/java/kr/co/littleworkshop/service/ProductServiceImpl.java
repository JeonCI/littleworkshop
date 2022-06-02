package kr.co.littleworkshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.littleworkshop.dao.ProductDao;
import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.model.ProductImages;
import kr.co.littleworkshop.model.ProductOption;
import kr.co.littleworkshop.model.ProductOptionDetail;
import kr.co.littleworkshop.util.DeleteFile;
import kr.co.littleworkshop.util.Pager;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao dao;

	private void productOptionAdd(List<String> productOptionNames, List<String> productOptionDetailNames,
			List<Integer> optionCount, List<Integer> necessaryOptionValues, List<Integer> soldOutValues, int productCode) {

		for (int i = 0; i < productOptionNames.size(); i++) {
			ProductOption productOption = new ProductOption();

			productOption.setProductOptionName(productOptionNames.get(i));
			productOption.setProductCode(productCode);
			productOption.setProductNecessaryOption(necessaryOptionValues.get(i));

			dao.productOptionAdd(productOption);

			for (int k = 0; k < optionCount.get(i); k++) {
				ProductOptionDetail productOptionDetail = new ProductOptionDetail();

				productOptionDetail.setProductOptionCode(productOption.getProductOptionCode());
				productOptionDetail.setProductOptionDetailName(productOptionDetailNames.get(0));
				productOptionDetail.setProductSoldOut(soldOutValues.get(0));
				productOptionDetailNames.remove(0);
				soldOutValues.remove(0);

				dao.productOptionDetailAdd(productOptionDetail);
			}
		}
	}
	
	@Override
	public void imageUpload(Product product){

		for (ProductImages image : product.getProductImageList()) {
			image.setProductCode(product.getProductCode());
			dao.imageUpload(image);
		}
		
	}
	
	@Override
	public List<Product> list(Pager pager) {
		int total = dao.total(pager);
		pager.setTotal(total);
		
		return dao.list(pager);
	}

	@Override
	public Product item(int code) {
		return dao.item(code);
	}

	@Override
	public List<Product> categories() {
		return dao.categories();
	}

	@Override
	@Transactional
	public void add(List<String> productOptionNames, List<String> productOptionDetailNames, List<Integer> optionCount,
			List<Integer> necessaryOptionValues, List<Integer> soldOutValues, Product product) {

		dao.productAdd(product);

		productOptionAdd(productOptionNames, productOptionDetailNames, optionCount, necessaryOptionValues, soldOutValues, product.getProductCode());
	}

	@Override
	public void delete(int productCode) {
		Product item = dao.item(productCode);
		if (item == null) {
			dao.delete(productCode);
		}else {
			String root = "productimage/" + item.getSellerId() + "/" + item.getProductCode() + "_"+ item.getProductName();
			DeleteFile<ProductImages> delete = new DeleteFile<ProductImages>();
			delete.deleteImage(root);
			dao.delete(productCode);
		}

	}

	@Override
	@Transactional
	public void update(List<String> productOptionNames, List<String> productOptionDetailNames,
			List<Integer> optionCount, List<Integer> necessaryOptionValues, List<Integer> soldOutValues, Product product) {
		dao.update(product);

		dao.initProductOptions(product.getProductCode());

		productOptionAdd(productOptionNames, productOptionDetailNames, optionCount, necessaryOptionValues, soldOutValues, product.getProductCode());
	}

	@Override
	public List<Integer> getSoldOutList(int productCode) {
		return dao.getSoldOutList(productCode);
	}

	@Override
	public int getProductCategoryCode(int productCode) {
		return dao.getProductCategoryCode(productCode);
	}

}
