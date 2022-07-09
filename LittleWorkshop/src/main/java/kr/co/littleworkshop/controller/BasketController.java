package kr.co.littleworkshop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.model.Basket;
import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.service.BasketService;
import kr.co.littleworkshop.service.OrderService;
import kr.co.littleworkshop.util.CookieManager;

@Controller
@RequestMapping("/basket")
public class BasketController {
	final String path = "basket/";
	
	@Autowired
	BasketService service;



	@RequestMapping("")
	public String list(Model model, HttpSession session) {

		Account account = (Account) session.getAttribute("account");
		List<Product> list = service.list(account.getId());
		List<String> sellerList = new ArrayList<String>();

		for (Product item : list)
			if (!sellerList.contains(item.getSellerId()))
				sellerList.add(item.getSellerId());

		model.addAttribute("sellerList", sellerList);
		model.addAttribute("list", list);
		return "basket";
	}

	@ResponseBody
	@PostMapping("/add")
	public String add(@RequestBody List<Basket> basket, HttpSession session, HttpServletResponse res,
			HttpServletRequest req) {
		CookieManager cookieMgr = new CookieManager();
		Account account = (Account) session.getAttribute("account");

		if (!cookieMgr.getCookie(req, "basket") && account != null) // 쿠키기록 없는 회원
			service.add(basket, account);
		else if (cookieMgr.getCookie(req, "basket") && account != null) { // 쿠키기록 있는 회원

		} else if (!cookieMgr.getCookie(req, "basket") && account == null) { // 쿠키기록 없는 비회원

		} else if (cookieMgr.getCookie(req, "basket") && account == null) { // 쿠키기록 있는 비회원

		}

		return "sesscse";
	}

	@ResponseBody
	@GetMapping("/delete/{code}")
	public String delete(@PathVariable int code, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		service.delete(code, account.getId());
		return "success";
	}

	@ResponseBody
	@PostMapping("/partialDeletion")
	public String partialDeletion(HttpSession session, @RequestBody List<Integer> deleteList) {
		Account account = (Account) session.getAttribute("account");
		service.partialDeletion(deleteList, account.getId());
		return "success";
	}

	@ResponseBody
	@GetMapping("/update/{code}")
	public String update(@PathVariable int code, HttpSession session, @RequestParam(value = "amount") int amount) {
		Account account = (Account) session.getAttribute("account");
		service.update(code, account.getId(), amount);
		return "success";
	}

}
