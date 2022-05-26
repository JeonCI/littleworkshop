package kr.co.littleworkshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.model.ProductCategory;
import kr.co.littleworkshop.service.CategoryService;
import kr.co.littleworkshop.service.ProductService;

@Controller
@RequestMapping("/admin/product")
public class AdminProductController {
	final String path = "admin/product/";
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CategoryService categoryService;
	
	@GetMapping("/productList")
	public String productList(Model model) {
		List<Product> productList = productService.list();
		
		model.addAttribute("productList", productList);
		
		return path + "productList";
	}
	
	@GetMapping("/productDelete/{productCode}")
	public String deleteProduct(@PathVariable int productCode) {
		productService.delete(productCode);
		
		return "redirect:../productList";
	}
	
	@GetMapping("/productCategoryList")
	public String productCategoryList(Model model) {
		List<ProductCategory> productCategoryList = categoryService.productCategoryList();
		
		model.addAttribute("productCateogryList", productCategoryList);
		
		return path + "productCategoryList";
	}
	
	@PostMapping("/productCategoryAdd")
	public String productCategoryAdd(ProductCategory productCategory) {
		categoryService.productCategoryAdd(productCategory);
		
		return "redirect:productCategoryList";
	}
	
	@GetMapping("/productCategoryUpdate/{productCategoryCode}")
	public String productCategoryUpdate(@PathVariable int productCategoryCode, Model model) {
		ProductCategory item = categoryService.productCategoryItem(productCategoryCode);
		
		model.addAttribute("item", item);
		
		return path + "productCategoryUpdate";
	}
	
	@PostMapping("/productCategoryUpdate/{productCategoryCode}")
	public String productCategoryUpdate(@PathVariable int productCategoryCode, ProductCategory productCategory) {
		productCategory.setProductCateogryCode(productCategoryCode);
		
		categoryService.productCateogryUpdate(productCategory);
		
		return "redirect:../productCategoryList";
	}
	
	@GetMapping("/productCategoryDelete/{productCategoryCode}")
	public String productCategoryDelete(@PathVariable int productCategoryCode) {
		categoryService.productCategoryDelete(productCategoryCode);
		
		return "redirect:../productCategoryList";
	}
}
