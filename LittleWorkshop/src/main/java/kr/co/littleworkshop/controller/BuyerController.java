package kr.co.littleworkshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.co.littleworkshop.service.BuyerService;
import kr.co.littleworkshop.util.Pager;



@Controller
@RequestMapping("/mypage/buyer")
public class BuyerController {
	final String path = "mypage/";

	@Autowired
	BuyerService service;
	
	@RequestMapping("/")
	public String list(Model model, Pager pager) {
		
//		List<Product> list = service.list(pager);
//		model.addAttribute("list", list);
	
		return path + "buyer";
	}

}
