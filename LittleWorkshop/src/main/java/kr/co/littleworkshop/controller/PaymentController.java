package kr.co.littleworkshop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.model.AccountAddress;
import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.service.AccountAddressService;
import kr.co.littleworkshop.service.OrderService;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	@Autowired
	OrderService service;
	@Autowired
	AccountAddressService addressService;
	
	@GetMapping("")
	public 	String payment(int productCode[], HttpSession session,Model model) {
		Account account = (Account) session.getAttribute("account");
		List<AccountAddress> addressList = addressService.list(account.getId());
		List<Product> productList = service.paymentList(productCode, account.getId());
		
		model.addAttribute("productList", productList);
		model.addAttribute("addressList", addressList);
		
		return "payment";

	}

	
}
