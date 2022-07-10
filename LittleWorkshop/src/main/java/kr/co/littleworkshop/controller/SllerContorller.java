package kr.co.littleworkshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.model.ProfileImage;
import kr.co.littleworkshop.service.AccountService;
import kr.co.littleworkshop.service.ProductService;
import kr.co.littleworkshop.util.ProductPager;

@Controller
@RequestMapping("/seller")
public class SllerContorller {
	final String path = "seller/";
	
	@Autowired
	ProductService productService;
	@Autowired
	AccountService accountService;
	
	@RequestMapping("/{id}")
	public String sellerPage(@PathVariable String id, ProductPager pager, Model model) {
		pager.setSellerId(id);
		ProfileImage profileImage = accountService.getProfileImage(id);
		model.addAttribute("profileImage", profileImage);
		
		Account seller = accountService.item(id);
		model.addAttribute("seller", seller);
		
		List<Product> list = productService.list(pager);
		model.addAttribute("list", list);
		return path + "/list";
	}


}
