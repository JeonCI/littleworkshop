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
import kr.co.littleworkshop.model.AccountInquery;
import kr.co.littleworkshop.service.AccountInqueryService;

@Controller
@RequestMapping("/accountInquery")
public class AccountInqueryController {
	final String path = "accountInquery/";
	
	@Autowired
	AccountInqueryService service;
	
	@GetMapping("/list")
	public String list(Model model) {
		List<AccountInquery> list = service.list();
		
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@GetMapping("/add")
	public String add(Model model, HttpSession session) {
		List<AccountInquery> categoryList = service.CategoryList();
		Account account = (Account) session.getAttribute("account");
		
		model.addAttribute("categories", categoryList);
		model.addAttribute("account", account);
		
		return path + "add";
	}
	
	@PostMapping("/add")
	public String add(AccountInquery item) {
		service.add(item);
		
		return "redirect:./list";
	}
	
	@GetMapping("/update/{accountInqueryCode}")
	public String update(@PathVariable int accountInqueryCode, Model model) {
		AccountInquery item = service.item(accountInqueryCode);
		List<AccountInquery> categoryList = service.CategoryList();
		
		model.addAttribute("item", item);
		model.addAttribute("categories", categoryList);
		
		return path + "update";
	}
	
	@PostMapping("/update/{accountInqueryCode}")
	public String update(@PathVariable int accountInqueryCode, AccountInquery item) {
		item.setAccountInqueryCode(accountInqueryCode);
		
		service.update(item);
		
		return "redirect:../list";
	}
	
	@GetMapping("/delete/{accountInqueryCode}")
	public String delete(@PathVariable int accountInqueryCode) {
		service.delete(accountInqueryCode);
		
		return "redirect:../list";
	}
}
