package kr.co.littleworkshop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.service.AccountService;

@Controller
@RequestMapping("/account")
public class AccountController {
	final String path = "account/";
	
	@Autowired
	AccountService service;
	
	@GetMapping("/myPage")
	public String myPage(Model model, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		
		model.addAttribute("account", account);
		
		return path + "myPage";
	}
}
