package kr.co.littleworkshop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.model.AccountAddress;
import kr.co.littleworkshop.model.ReceiveRequest;
import kr.co.littleworkshop.service.AccountAddressService;
import kr.co.littleworkshop.service.BuyerService;
import kr.co.littleworkshop.util.Pager;



@Controller
@RequestMapping("/mypage/buyer")
public class BuyerController {
	final String path = "mypage/";

	@Autowired
	BuyerService service;
	
	@Autowired
	AccountAddressService addressService;
	
	@RequestMapping("/")
	public String list(Model model, Pager pager) {
		
//		List<Product> list = service.list(pager);
//		model.addAttribute("list", list);
	
		return path + "buyer";
	}
	
	
	
	
	// ###  배송주소 관리  ###
	@RequestMapping("/address")
	public String address(Model model, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		
		List<AccountAddress> list = addressService.list(account.getId());
		model.addAttribute("list", list);
		return path + "address/list";
	}
	// 추가
	@GetMapping("/address/add")
	public String addAddress(Model model) {
		List<ReceiveRequest> requestList = addressService.requestList();
		model.addAttribute("requestList", requestList);
		return path + "address/add";
	}
	@PostMapping("/address/add")
	public String addAddress(AccountAddress address, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		address.setId(account.getId());
		addressService.add(address);
		return "redirect:../address";
	}
	
	
	// 수정
	@GetMapping("/address/update/{code}")
	public String updateAddress(Model model, @PathVariable int code, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		AccountAddress item = addressService.item(code, account.getId());
		List<ReceiveRequest> requestList = addressService.requestList();
		
		model.addAttribute("requestList", requestList);
		model.addAttribute("item", item);
		return path + "address/update";
	}
	@PostMapping("/address/update/{code}")
	public String updateAddress(AccountAddress address, @PathVariable int code, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		address.setId(account.getId());
		address.setAddressCode(code);
		addressService.update(address);
		return "redirect:../../address";
	}
	
	// 삭제
	@GetMapping("/address/delete/{code}")
	public String deleteAddress(@PathVariable int code, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		addressService.delete(code, account.getId());
		return "redirect:../../address";
	}

}
