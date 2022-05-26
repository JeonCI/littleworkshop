package kr.co.littleworkshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.service.AccountService;
import kr.co.littleworkshop.service.CategoryService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	final String path = "admin/";
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	AccountService accountService;
	
	@GetMapping("/manage")
	public String admin() {
		return path + "manage";
	}
	
	@GetMapping("/accountList")
	public String accountList(Model model) {
		List<Account> accountList = accountService.list();
		
		model.addAttribute("accountList", accountList);
		
		return path + "accountList";
	}
	
	@GetMapping("/deleteAccount/{accountid}")
	public String deleteAccount(@PathVariable String id) {
		accountService.delete(id);
		
		return "redirect:../accountList";
	}
}
