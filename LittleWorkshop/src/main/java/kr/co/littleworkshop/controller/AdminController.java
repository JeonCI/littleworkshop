package kr.co.littleworkshop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.service.AdminService;
import kr.co.littleworkshop.util.SaltCode;

@Controller
@RequestMapping("/admin")
public class AdminController {
	final String path = "admin/";
	
	@Autowired
	AdminService service;
	
	@GetMapping("/")
	public String adminLogin() {
		return path + "manageLogin";
	}
	
	@PostMapping("/")
	public String adminLogin(Account account, HttpSession session, Model model) {
		SaltCode salt = new SaltCode();
		salt.accountSaltCode(account);
		
		if(service.adminLogin(account)) {
			account.setPasswd(null);
			session.setAttribute("account", account);
			
			return "redirect:manage";
		}
		
		model.addAttribute("msg", "아이디 또는 비밀번호를 확인해 주세요.");
		
		return "redirect:./";
	}
	
	@GetMapping("/adminLogout")
	public String adminLogout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:./";
	}
	
	@GetMapping("/manage")
	public String manage() {
		return path + "manage";
	}
}
