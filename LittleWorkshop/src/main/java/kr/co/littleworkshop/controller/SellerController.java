package kr.co.littleworkshop.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.model.Order;
import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.model.ProductCategory;
import kr.co.littleworkshop.model.ProductImages;
import kr.co.littleworkshop.model.ProductOption;
import kr.co.littleworkshop.model.ProductOptionDetail;
import kr.co.littleworkshop.service.BuyerService;
import kr.co.littleworkshop.service.CategoryService;
import kr.co.littleworkshop.service.OrderService;
import kr.co.littleworkshop.service.ProductService;
import kr.co.littleworkshop.util.ProductPager;
import kr.co.littleworkshop.util.Uploader;
import kr.co.littleworkshop.util.orderPager;

@Controller
@RequestMapping("/mypage/seller")
public class SellerController {
	final String path = "mypage/seller/";
	
	@Autowired
	BuyerService service;
	
	@Autowired
	CategoryService categoryService;
	@Autowired
	ProductService productService;
	@Autowired
	OrderService orderService;


	// #상품관리
	@RequestMapping("/productMngmn")
	public String productMngmn(Model model, @ModelAttribute("pager") ProductPager pager) {
		List<Product> list = productService.list(pager);
		List<ProductCategory> categoryList = categoryService.productCategoryList();	
		model.addAttribute("list", list);
		model.addAttribute("categoryList",categoryList);
		return path + "productMngmn/list";
	}

	@GetMapping("/productMngmn/view/{productCode}")
	public String view(@PathVariable int productCode, Model model) {
		Product item = productService.item(productCode);
		model.addAttribute("item", item);
		return path + "productMngmn/view";
	}
	// 추가
	@GetMapping("/productMngmn/add")
	public String add(Model model, HttpSession session) {
		List<Product> categories = productService.categories();
		Account account = (Account) session.getAttribute("account");
		model.addAttribute("productCategories", categories);
		model.addAttribute("account", account);
		return path + "productMngmn/add";
	}
	@ResponseBody
	@PostMapping("/add")
	public String add(@RequestParam("productOptionName") List<String> productOptionNames,
					@RequestParam("productOptionDetailName") List<String> productOptionDetailNames,
					@RequestParam("optionCount") List<Integer> optionCount,
					@RequestParam("ProductImage") List<MultipartFile> ProductImages,
					@RequestParam("productNecessaryOption") List<Integer> necessaryOptionValues,
					@RequestParam("tagList") List<String> tagNameList,
					Product product) {
		List<Integer> soldOutValues = new ArrayList<Integer>();
		for(int i = 0; i < productOptionDetailNames.size(); i++) {
			soldOutValues.add(1);
		}
		productService.add(productOptionNames, productOptionDetailNames, optionCount, necessaryOptionValues, soldOutValues, tagNameList, product);
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
	// 수정
	@GetMapping("/productMngmn/update/{productCode}")
	public String update(@PathVariable int productCode, Model model) {
		List<Product> categories = productService.categories();

		Product item = new Product();
		item.setProductCode(productCode);
		item = productService.item(productCode);

		model.addAttribute("item", item);
		model.addAttribute("productCategories", categories);
		return path + "productMngmn/update";
	}
	@PostMapping("/productMngmn/update/{productCode}")
	public String update(@PathVariable int productCode,
						@RequestParam("productOptionName") List<String> productOptionNames,
						@RequestParam("productOptionDetailName") List<String> productOptionDetailNames,
						@RequestParam("optionCount") List<Integer> optionCount,
						@RequestParam("productNecessaryOption") List<Integer> necessaryOptionValues,
						@RequestParam("productSoldOut") List<Integer> soldOutValues,
						@RequestParam("tagList") List<String> tagNameList,
						Product product) {
		product.setProductCode(productCode);
		productService.update(productOptionNames, productOptionDetailNames, optionCount, necessaryOptionValues, soldOutValues, tagNameList, product);
		return "redirect:../../list";
	}
	// 삭제
	@GetMapping("/productMngmn/delete/{productCode}")
	public String delete(@PathVariable int productCode) {
		productService.delete(productCode);
		return "redirect:../../list";
	}
	
	// #주문관리
	@RequestMapping("/orderMngmn")
	public String orderMngmn(Model model, @ModelAttribute("pager") orderPager pager, HttpSession session) {
		Account account = (Account) session.getAttribute("account");

		List<Order> orderList = orderService.orderRequest(account.getId(), pager);

		model.addAttribute("orderHistory", orderList);
	
		return path + "orderMngmn/list";
	}
	
	@ResponseBody
	@PostMapping("/orderMngmn/update")
	public String update(@RequestParam int orderCode) {
		orderService.setOrderStatus(orderCode);
	
		return "success";
	}
	
	
	
	@GetMapping("/orderMngmn/addWaybillNumber")
	public String addWaybillNumber() {
		return path + "orderMngmn/addWaybill";
	}
}
