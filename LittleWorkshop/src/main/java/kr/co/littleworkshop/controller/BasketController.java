package kr.co.littleworkshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.littleworkshop.model.Basket;
import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.service.BasketService;
import kr.co.littleworkshop.util.Pager;
import kr.co.littleworkshop.util.ProductPager;

@Controller
@RequestMapping("/basket")
public class BasketController {
	final String path = "basket/";

	@Autowired
	BasketService service;
	
	@RequestMapping("")
	public String list(Model model) {
		
//		List<Basket> list = service.list();
//		model.addAttribute("list", list);
	
		return "basket";
	}
	
	
	@ResponseBody
	@PostMapping("/add")
	public String add(@RequestBody Basket Basket) {

		
		System.out.println(Basket.getBasketCode());
		System.out.println(Basket.getOrderInfo());
		System.out.println(Basket.getProductAmount());
		System.out.println(Basket.getTotalAmount());
		
		
		
		return "sesscse";
	}
}
