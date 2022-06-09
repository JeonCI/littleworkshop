package kr.co.littleworkshop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.model.AccountAddress;
import kr.co.littleworkshop.model.Basket;
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
	
	@PostMapping
	public String payment(int productCode[], @ModelAttribute(name= "items") Basket items, HttpSession session, Model model) {		
		if(productCode != null) {
			for(int item : productCode) {
				System.out.println(item);
			}
		}
		if(items.getItems() != null) {
			System.out.println("에엥");
			System.out.println(items.getBasketCode());
			for(Basket item : items.getItems()) {
				System.out.println(item.getProductCode());
				System.out.println(item.getProductAmount());
				System.out.println(item.getOrderInfo());
			}
		}
//	
//		Account account = (Account) session.getAttribute("account");
//		List<AccountAddress> addressList = addressService.list(account.getId());
//		List<Product> paymentList = service.paymentList(productCode, account.getId());
//		
//		model.addAttribute("paymentList", paymentList);
//		model.addAttribute("addressList", addressList);
//	
		return "payment";

	}	
	
//	@GetMapping("")
//	public 	String payment(int productCode[], HttpSession session,Model model) {
//		Account account = (Account) session.getAttribute("account");
//		List<AccountAddress> addressList = addressService.list(account.getId());
//		List<Product> productList = service.paymentList(productCode, account.getId());
//		
//		model.addAttribute("productList", productList);
//		model.addAttribute("addressList", addressList);
//		
//		return "payment";
//
//	}

	
}
