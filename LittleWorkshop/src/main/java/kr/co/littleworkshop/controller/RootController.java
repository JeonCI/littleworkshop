package kr.co.littleworkshop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.service.AccountService;
import kr.co.littleworkshop.service.ProductService;

@Controller
public class RootController {
	
	@Autowired
	AccountService accountService;
	
	@Autowired
	ProductService productService;
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/login")
	public String login(Model model) {
		return "login";
	}
	
	@PostMapping("/login")
	public String login(HttpSession session, Account account, Model model) {
		if(accountService.login(account)) {
			account.setPasswd(null);
			
			session.setAttribute("account", account);
			model.addAttribute("account", account);
			
			return "redirect:.";
		}
		
		model.addAttribute("msg", "아이디 또는 비밀번호를 확인해 주세요!");
		
		return "redirect:login";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:.";
	}
	
	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}
	
	@PostMapping("/signup")
	public String signup(Account item) {
		accountService.signup(item);
		
		return "redirect:.";
	}
}
