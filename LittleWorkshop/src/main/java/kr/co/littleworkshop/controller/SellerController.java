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
import kr.co.littleworkshop.service.BuyerService;
import kr.co.littleworkshop.service.CategoryService;
import kr.co.littleworkshop.service.ProductService;
import kr.co.littleworkshop.util.ProductPager;
import kr.co.littleworkshop.util.Uploader;

@Controller
@RequestMapping("/mypage/seller")
public class SellerController {
	final String path = "mypage/seller/";

	@Autowired
	ProductService productService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	BuyerService service;
	
	@RequestMapping("/")
	public String seller(Model model) {

		return "mypage/seller";
	}
	
	//상품관리
	@RequestMapping("/productMngmn")
	public String productMngmn(Model model, @ModelAttribute("pager") ProductPager pager) {
		
		List<Product> list = productService.list(pager);
		List<ProductCategory> categoryList = categoryService.productCategoryList();
		
		model.addAttribute("list", list);
		model.addAttribute("categoryList",categoryList);
		
		return path + "productMngmn";
	}
	
	@GetMapping("/productMngmn/view/{productCode}")
	public String view(@PathVariable int productCode, Model model) {
		Product item = productService.item(productCode);

		model.addAttribute("item", item);

		return path + "view";
	}


	@GetMapping("/productMngmn/add")
	public String add(Model model, HttpSession session) {
		List<Product> categories = productService.categories();

		Account account = (Account) session.getAttribute("account");

		model.addAttribute("productCategories", categories);
		model.addAttribute("account", account);

		return path + "add";
	}

	@ResponseBody
	@PostMapping("/productMngmn/add")
	public String add(@RequestParam("productOptionName") List<String> productOptionNames,
					@RequestParam("productOptionDetailName") List<String> productOptionDetailNames,
					@RequestParam("optionCount") List<Integer> optionCount,
					@RequestParam("ProductImage") List<MultipartFile> ProductImages,
					@RequestParam("productNecessaryOption") List<Integer> necessaryOptionValues,
					Product product) {
		List<Integer> soldOutValues = new ArrayList<Integer>();
		
		for(int i = 0; i < productOptionDetailNames.size(); i++) {
			soldOutValues.add(0);
		}
		
		productService.add(productOptionNames, productOptionDetailNames, optionCount, necessaryOptionValues, soldOutValues, product);
		
		Uploader<ProductImages> uploader = new Uploader<>();
		String root = "productimage/"+product.getSellerId()+"/"+product.getProductCode()+"_"+product.getProductName();

		try {
			List<ProductImages> Images = uploader.makeProductImageList(ProductImages, ProductImages.class,root);
			product.setProductImageList(Images);
			productService.imageUpload(product);

		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
}

	@GetMapping("/productMngmn/update/{productCode}")
	public String update(@PathVariable int productCode, Model model) {
		List<Product> categories = productService.categories();

		Product item = new Product();

		item.setProductCode(productCode);

		item = productService.item(productCode);

		model.addAttribute("item", item);
		model.addAttribute("productCategories", categories);

		return path + "update";
	}

	@PostMapping("/productMngmn/update/{productCode}")
	public String update(@PathVariable int productCode,
						@RequestParam("productOptionName") List<String> productOptionNames,
						@RequestParam("productOptionDetailName") List<String> productOptionDetailNames,
						@RequestParam("optionCount") List<Integer> optionCount,
						@RequestParam("productNecessaryOption") List<Integer> necessaryOptionValues,
						@RequestParam("productSoldOut") List<Integer> soldOutValues,
						Product product) {
		product.setProductCode(productCode);

		productService.update(productOptionNames, productOptionDetailNames, optionCount, necessaryOptionValues, soldOutValues, product);

		return "redirect:../../productMngmn";
	}

	@GetMapping("/productMngmn/delete/{productCode}")
	public String delete(@PathVariable int productCode) {
		productService.delete(productCode);
		return "redirect:../../productMngmn";
	}
	
	//주문관리

}
