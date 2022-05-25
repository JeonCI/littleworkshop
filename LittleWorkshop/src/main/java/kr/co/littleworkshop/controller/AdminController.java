package kr.co.littleworkshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.model.Notice;
import kr.co.littleworkshop.model.NoticeCategory;
import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.model.ProductCategory;
import kr.co.littleworkshop.service.AccountService;
import kr.co.littleworkshop.service.CategoryService;
import kr.co.littleworkshop.service.NoticeService;
import kr.co.littleworkshop.service.ProductService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	final String path = "admin/";
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	AccountService accountService;
	
	@Autowired
	NoticeService noticeService;
	
	@GetMapping("/manage")
	public String admin() {
		return path + "manage";
	}
	
	@GetMapping("/productList")
	public String productList(Model model) {
		List<Product> productList = productService.list();
		
		model.addAttribute("productList", productList);
		
		return path + "productList";
	}
	
	@GetMapping("/accountList")
	public String accountList(Model model) {
		List<Account> accountList = accountService.list();
		
		model.addAttribute("accountList", accountList);
		
		return path + "accountList";
	}
	
	@GetMapping("/noticeList")
	public String noticeList(Model model) {
		List<Notice> noticeList = noticeService.list();
		
		model.addAttribute("noticeList", noticeList);
		
		return path + "noticeList";
	}
	
	@GetMapping("/deleteProduct/{productCode}")
	public String deleteProduct(@PathVariable int productCode) {
		productService.delete(productCode);
		
		return "redirect:../productList";
	}
	
	@GetMapping("/deleteAccount/{accountid}")
	public String deleteAccount(@PathVariable String id) {
		accountService.delete(id);
		
		return "redirect:../accountList";
	}
	
	@GetMapping("/noticeAdd")
	public String noticeAdd(Model model) {
		List<Notice> noticeCategoryList = noticeService.noticeCategoryList();
		
		model.addAttribute("noticeCategoryList", noticeCategoryList);
		
		return path + "noticeAdd";
	}
	
	@PostMapping("/noticeAdd")
	public String noticeAdd(Notice notice) {
		noticeService.noticeAdd(notice);
		
		return "redirect:noticeList";
	}
	
	@GetMapping("/noticeUpdate/{noticeCode}")
	public String noticeUpdate(@PathVariable int noticeCode, Model model) {
		Notice item = noticeService.noticeItem(noticeCode);
		List<Notice> noticeCategoryList = noticeService.noticeCategoryList();
		
		model.addAttribute("item", item);
		model.addAttribute("noticeCategoryList", noticeCategoryList);
		
		return path + "noticeUpdate";
	}
	
	@PostMapping("/noticeUpdate/{noticeCode}")
	public String noticeUpdate(@PathVariable int noticeCode, Notice notice) {
		notice.setNoticeCode(noticeCode);
		
		noticeService.noticeUpdate(notice);
		
		return "redirect:../noticeList";
	}
	
	@GetMapping("/noticeDelete/{noticeCode}")
	public String noticeDelete(@PathVariable int noticeCode) {
		noticeService.noticeDelete(noticeCode);
		
		return "redirect:../noticeList";
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
	
	@GetMapping("/noticeCategoryList")
	public String noticeCategoryList(Model model) {
		List<NoticeCategory> noticeCategoryList = categoryService.noticeCategoryList();
		
		model.addAttribute("noticeCateogryList", noticeCategoryList);
		
		return path + "noticeCategoryList";
	}
	
	@PostMapping("/noticeCategoryAdd")
	public String noticeCategoryAdd(NoticeCategory noticeCategory) {
		categoryService.noticeCategoryAdd(noticeCategory);
		
		return "redirect:noticeCategoryList";
	}
	
	@GetMapping("/noticeCategoryUpdate/{noticeCategoryCode}")
	public String noticeCategoryUpdate(@PathVariable int noticeCategoryCode, Model model) {
		NoticeCategory item = categoryService.noticeCategoryItem(noticeCategoryCode);
		
		model.addAttribute("item", item);
		
		return path + "noticeCategoryUpdate";
	}
	
	@PostMapping("/noticeCategoryUpdate/{noticeCategoryCode}")
	public String noticeCategoryUpdate(@PathVariable int noticeCategoryCode, NoticeCategory noticeCategory) {
		noticeCategory.setNoticeCategoryCode(noticeCategoryCode);
		
		categoryService.noticeCateogryUpdate(noticeCategory);
		
		return "redirect:../noticeCategoryList";
	}
	
	@GetMapping("/noticeCategoryDelete/{noticeCategoryCode}")
	public String noticeCategoryDelete(@PathVariable int noticeCategoryCode) {
		categoryService.noticeCategoryDelete(noticeCategoryCode);
		
		return "redirect:../noticeCategoryList";
	}
}
