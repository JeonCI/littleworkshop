package kr.co.littleworkshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.service.AccountService;

@Controller
@RequestMapping("/admin/account")
public class AdminAccountController {
	final String path = "admin/account/";
	
	@Autowired
	AccountService accountService;
	
	@GetMapping("/accountList")
	public String accountList(Model model) {
		List<Account> accountList = accountService.list();
		
		model.addAttribute("accountList", accountList);
		
		return path + "accountList";
	}
	
	@GetMapping("/accountDelete/{accountid}")
	public String deleteAccount(@PathVariable String id) {
		accountService.delete(id);
		
		return "redirect:../accountList";
	}
	
	@GetMapping("/accountUpdate/{id}")
	public String accountUpdate(@PathVariable String id, Model model) {
		Account item = accountService.item(id);
		
		model.addAttribute("item", item);
		
		return path + "accountUpdate";
	}
	
	@PostMapping("/accountUpdate/{id}")
	public String accountUpdate(@PathVariable String id, Account account) {
		account.setId(id);
		
		accountService.update(account);
		
		return "redirect:../accountList";
	}
}
