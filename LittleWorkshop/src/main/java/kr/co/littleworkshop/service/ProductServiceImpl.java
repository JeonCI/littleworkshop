package kr.co.littleworkshop.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.littleworkshop.dao.KeywordDao;
import kr.co.littleworkshop.dao.ProductDao;
import kr.co.littleworkshop.dao.TagDao;
import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.model.ProductImages;
import kr.co.littleworkshop.model.ProductOption;
import kr.co.littleworkshop.model.ProductOptionDetail;
import kr.co.littleworkshop.model.Tag;
import kr.co.littleworkshop.util.DeleteFile;
import kr.co.littleworkshop.util.Pager;
import kr.co.littleworkshop.util.ProductPager;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao dao;
	
	@Autowired
	TagDao tagDao;

	@Autowired
	KeywordDao keywordDao;
	
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
	
	private void productTagAdd(int productCode, List<String> tagNameList) {
		List<Tag> nowTagList = tagDao.nowTagList();
		List<Tag> productTagList = new ArrayList<Tag>();
		
		int index = 0;
		
		for(int i = 0; i < tagNameList.size(); i++) {
			for(int k = 0; k < nowTagList.size(); k++) {
				if(tagNameList.get(index).equals(nowTagList.get(k).getTagName())) {
					productTagList.add(nowTagList.get(k));
					System.out.println(tagNameList.get(index));
					tagNameList.remove(index);
					break;
				}
				
				if(k == nowTagList.size()-1) {
					index++;
					i++;
				}
			}
		}
		
		if(tagNameList.size() != 0) {
			for(String tagName : tagNameList) {
				Tag tag = new Tag();
				
				tag.setTagName(tagName);
				
				tagDao.addTag(tag);
				
				productTagList.add(tag);
			}
		}
		
		for(Tag productTag : productTagList) {
			productTag.setTargetCode(productCode);
			
			tagDao.addProductTag(productTag);
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
	public List<Product> list(ProductPager pager) {
		int total = dao.total(pager);
		pager.setTotal(total);
		
		return dao.list(pager);
	}



	@Override
	public List<Product> categories() {
		return dao.categories();
	}

	@Override
	@Transactional
	public void add(List<String> productOptionNames, List<String> productOptionDetailNames, List<Integer> optionCount,
			List<Integer> necessaryOptionValues, List<Integer> soldOutValues, List<String> tagNameList, Product product) {

		dao.productAdd(product);
		
		productTagAdd(product.getProductCode(), tagNameList);
		
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
			List<Integer> optionCount, List<Integer> necessaryOptionValues, List<Integer> soldOutValues, List<String> tagNameList, Product product) {
		dao.update(product);

		dao.initProductOptions(product.getProductCode());
		
		tagDao.initProductTag(product.getProductCode());
		
		productTagAdd(product.getProductCode(), tagNameList);

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


	@Override
	public void heartPushAction(int productCode, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("productCode", productCode);
		map.put("id", id);
		
		int inquery = dao.inquery(map);
		
		if(inquery != 1) {
			dao.addLikeList(map);
		} else {
			dao.deleteLikeList(map);
		}
	}


	@Override
	public Product item(int code) {

		return dao.item(code);
	}

	@Override
	public Product item(int code, String id) {
		dao.viewCount(code);
		Product item = dao.item(code);
		if(keywordDao.attCategoryCheck(item.getProductCategoryCode(), id) > 0) {
			keywordDao.updateAttCategory(item.getProductCategoryCode(), id);
		}else {
			keywordDao.addAttCategory(item.getProductCategoryCode(), id);
		}
		
		return item;
	}

	@Override
	public List<Product> likeList(String id) {
		return dao.likeList(id);
	}
}
