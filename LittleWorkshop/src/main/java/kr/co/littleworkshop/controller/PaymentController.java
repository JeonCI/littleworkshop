package kr.co.littleworkshop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.model.AccountAddress;
import kr.co.littleworkshop.model.Basket;
import kr.co.littleworkshop.model.Order;
import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.model.ProductOrderDetail;
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
		Account account = (Account) session.getAttribute("account");
		List<AccountAddress> addressList = addressService.list(account.getId());
		List<Product> paymentItems = new ArrayList<Product>();
		
		if(productCode != null) // 장바구니 구매
			paymentItems = service.basketPaymentList(productCode, account.getId());
		
		else if(items.getItems() != null) { // 바로 구매
			Product paymentItem = service.productPaymentList(items.getItems().get(0).getProductCode());
			paymentItem.setBasketList(items.getItems());
			paymentItems.add(paymentItem);
			
		}
		
		model.addAttribute("paymentItems", paymentItems);
		model.addAttribute("addressList", addressList);

		return "payment";

	}	
	
	@ResponseBody
	@PostMapping("orderRequest")
	public String payment(@RequestBody Order order, HttpSession session) {		
		Account account = (Account) session.getAttribute("account");
		order.setId(account.getId());
		service.add(order);
		

		return "sessecs";

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
