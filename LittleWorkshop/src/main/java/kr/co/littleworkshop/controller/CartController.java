package kr.co.littleworkshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.littleworkshop.util.Pager;
import kr.co.littleworkshop.util.ProductPager;

@Controller
@RequestMapping("/cart")
public class CartController {
	final String path = "cart/";
	
	public String list(Model model, @ModelAttribute("pager") ProductPager pager) {
		
//		List<Product> list = service.list(pager);
//		model.addAttribute("list", list);
	
		return path+"cart";
	}

	
	
}
