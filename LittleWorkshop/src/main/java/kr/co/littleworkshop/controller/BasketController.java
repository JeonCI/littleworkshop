package kr.co.littleworkshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.model.Basket;

import kr.co.littleworkshop.service.BasketService;
import kr.co.littleworkshop.util.CookieManager;


@Controller
@RequestMapping("/basket")
public class BasketController {
	final String path = "basket/";

	@Autowired
	BasketService service;
	
	@RequestMapping("")
	public String list(Model model) {
		
		//List<Basket> list = service.list();
		model.addAttribute("list", null);
	
		return "basket";
	}
	
	
	@ResponseBody
	@PostMapping("/add")
	public String add(@RequestBody List<Basket> basket, HttpSession session, HttpServletResponse res, HttpServletRequest req) {
		CookieManager cookieMgr = new CookieManager();
		Account account = (Account) session.getAttribute("account");

		if(!cookieMgr.getCookie(req, "basket") && account != null)  // 쿠키기록 없는 회원 
			service.add(basket, account);
		else if(cookieMgr.getCookie(req, "basket") && account != null) {  // 쿠키기록 있는 회원
			
		}else if(!cookieMgr.getCookie(req, "basket") && account == null){ // 쿠키기록 없는 비회원
			
		}else if(cookieMgr.getCookie(req, "basket") && account == null){ // 쿠키기록 있는 비회원
			
		}
	
		
		return "sesscse";
	}
}
