package kr.co.littleworkshop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.model.ProductCategory;
import kr.co.littleworkshop.model.ProductImages;
import kr.co.littleworkshop.model.ProductOption;
import kr.co.littleworkshop.model.ProductOptionDetail;
import kr.co.littleworkshop.service.CategoryService;
import kr.co.littleworkshop.service.KeywordService;
import kr.co.littleworkshop.service.ProductService;
import kr.co.littleworkshop.util.ProductPager;
import kr.co.littleworkshop.util.Uploader;

@Controller
@RequestMapping("/product")
public class ProductController {
	final String path = "product/";

	@Autowired
	ProductService service;

	@Autowired
	CategoryService categoryService;
	
	@Autowired
	KeywordService keywordService;
	
	@RequestMapping({"/list", "/search"})
	public String list(Model model, @ModelAttribute("pager") ProductPager pager, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		
		if(pager.getKeyword() != null) {
			keywordService.addKeyword(pager.getKeyword());
			
			if(account != null) {
				String id = account.getId();
				String keyword = pager.getKeyword();
				
				keywordService.addAttentionKeyword(id, keyword);
			}
		}
		
		System.out.println(pager.getSearch());
		
		List<Product> list = service.list(pager);
		List<ProductCategory> categoryList = categoryService.productCategoryList();
		
		model.addAttribute("list", list);
		model.addAttribute("categoryList",categoryList);
		
		return path + "list";
	}
	
	
	@GetMapping("/view/{productCode}")
	public String view(@PathVariable int productCode, Model model) {
		Product item = service.item(productCode);
		service.viewCount(productCode);

		model.addAttribute("item", item);

		return path + "view";
	}

	@GetMapping("/add")
	public String add(Model model, HttpSession session) {
		List<Product> categories = service.categories();

		Account account = (Account) session.getAttribute("account");

		model.addAttribute("productCategories", categories);
		model.addAttribute("account", account);

		return path + "add";
	}

	@ResponseBody
	@PostMapping("/add")
	public String add(@RequestParam("productOptionName") List<String> productOptionNames,
					@RequestParam("productOptionDetailName") List<String> productOptionDetailNames,
					@RequestParam("optionCount") List<Integer> optionCount,
					@RequestParam("ProductImage") List<MultipartFile> ProductImages,
					@RequestParam("productNecessaryOption") List<Integer> necessaryOptionValues,
					@RequestParam("tagNameList") List<String> tagNameList,
					Product product) {
		List<Integer> soldOutValues = new ArrayList<Integer>();
		
		for(int i = 0; i < productOptionDetailNames.size(); i++) {
			soldOutValues.add(0);
		}
		
		service.add(productOptionNames, productOptionDetailNames, optionCount, necessaryOptionValues, soldOutValues, tagNameList, product);
		
		Uploader<ProductImages> uploader = new Uploader<>();
		String root = "productimage/"+product.getSellerId()+"/"+product.getProductCode()+"_"+product.getProductName();

		try {
			List<ProductImages> Images = uploader.makeProductImageList(ProductImages, ProductImages.class,root);
			product.setProductImageList(Images);
			service.imageUpload(product);

		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
}

	@GetMapping("/update/{productCode}")
	public String update(@PathVariable int productCode, Model model) {
		List<Product> categories = service.categories();

		Product item = new Product();

		item.setProductCode(productCode);

		item = service.item(productCode);


		model.addAttribute("item", item);
		model.addAttribute("productCategories", categories);

		return path + "update";
	}

	@PostMapping("/update/{productCode}")
	public String update(@PathVariable int productCode,
						@RequestParam("productOptionName") List<String> productOptionNames,
						@RequestParam("productOptionDetailName") List<String> productOptionDetailNames,
						@RequestParam("optionCount") List<Integer> optionCount,
						@RequestParam("productNecessaryOption") List<Integer> necessaryOptionValues,
						@RequestParam("productSoldOut") List<Integer> soldOutValues,
						@RequestParam("tagList") List<String> tagNameList,
						Product product) {
		product.setProductCode(productCode);

		service.update(productOptionNames, productOptionDetailNames, optionCount, necessaryOptionValues, soldOutValues, tagNameList, product);

		return "redirect:../list";
	}

	@GetMapping("/delete/{productCode}")
	public String delete(@PathVariable int productCode) {
		service.delete(productCode);
		return "redirect:../list";
	}
	
	@GetMapping("/getSoldOut")
	@ResponseBody
	public List<Integer> getSoldOut(@RequestParam("productCode") int productCode) {
		List<Integer> productSoldOutList = service.getSoldOutList(productCode);
		
		return productSoldOutList;
	}
	
	@GetMapping("/getProductCategoryCode")
	@ResponseBody
	public int getProductCategoryCode(@RequestParam("productCode") int productCode) {
		int productCategoryCode = service.getProductCategoryCode(productCode);
		
		return productCategoryCode;
	}

}
