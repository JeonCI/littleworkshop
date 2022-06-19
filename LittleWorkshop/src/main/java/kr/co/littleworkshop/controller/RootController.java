package kr.co.littleworkshop.controller;

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
import kr.co.littleworkshop.model.ProductImages;
import kr.co.littleworkshop.service.AccountService;
import kr.co.littleworkshop.service.ProductService;
import kr.co.littleworkshop.util.ProductPager;
import kr.co.littleworkshop.util.SaltCode;

@Controller
public class RootController {
	
	@Autowired
	AccountService accountService;
	
	@Autowired
	ProductService productService;
	
	@RequestMapping("/")
	public String index(Model model, ProductPager pager, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		
		if(account != null) {
			pager.setId(account.getId()); 
		}else {
			pager.setId("");
		}
		
		//최신작품
		pager.setCondition("lates");
		List<Product> latestList = productService.list(pager);
		model.addAttribute("latestList",latestList);
		
		//인기작품
		pager.setCondition("best");
		List<Product> bestList = productService.list(pager);
		model.addAttribute("bestList",bestList);
		
		//추천작품
		if(account != null) 
			pager.setCondition("rcmnd");
		else
			pager.setCondition(null);
		List<Product> rcmndList = productService.list(pager);
		
		model.addAttribute("rcmndList",rcmndList);
		return "index";
	}
	
	@GetMapping("/login")
	public String login(Model model) {
		return "login";
	}
	
	@PostMapping("/login")
	public String login(HttpSession session, Account account, Model model) {
		SaltCode salt = new SaltCode();
		salt.accountSaltCode(account);
		
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
		
		item.setSaltCode(item.getId());
		SaltCode salt = new SaltCode();
		salt.accountSaltCode(item);
		accountService.signup(item);
		
		return "redirect:.";
	}
	
	
	@ResponseBody
	@PostMapping("/checkId")
	public String checkId(@RequestBody Account account){
		
		if(accountService.checkId(account))
			return "OK";
		else
			return "FALSE";
	}
	
	
}
