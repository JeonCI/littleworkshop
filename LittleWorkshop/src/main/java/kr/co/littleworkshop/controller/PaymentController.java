package kr.co.littleworkshop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.service.OrderService;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	@Autowired
	OrderService service;

	@GetMapping("")
	public 	String payment(int productCode[], HttpSession session,Model model) {
		Account account = (Account) session.getAttribute("account");
		
		List<Product> list = service.paymentList(productCode, account.getId());
		List<String> sellerList = new ArrayList<String>();

		for (Product item : list)
			if (!sellerList.contains(item.getSellerId()))
				sellerList.add(item.getSellerId());
		
		model.addAttribute("list", list);
		model.addAttribute("sellerList", sellerList);
		
		return "payment";

	}

	
}
