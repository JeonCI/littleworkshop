package kr.co.littleworkshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.model.FdOpinion;
import kr.co.littleworkshop.service.FdOpinionService;
import kr.co.littleworkshop.util.FdPager;

@Controller
@RequestMapping("/fd/fdConferencHall")
public class FdOpinionController {
	final String path = "fd/fdOpinion/";
	
	@Autowired
	FdOpinionService service;
	
	@GetMapping("/fdOpinionList/{fdCode}")
	public String fdOpinionList(Model model, @PathVariable int fdCode, FdPager pager) {
		pager.setFdCode(fdCode);
		
		List<FdOpinion> list = service.fdOpinionList(pager);
		
		model.addAttribute("list", list);
		
		return path + "fdOpinionList";
	}
	
	@PostMapping("/fdOpinionAdd")
	public String fdOpinionAdd(FdOpinion fdOpinion, HttpSession session, HttpServletRequest request) {
		String url = request.getHeader("REFERER");
		
		String[] urlSplit = url.split("/");
		
		int fdCode = Integer.parseInt(urlSplit[(urlSplit.length)-1]);
		
		System.out.println(fdCode);
		
		Account account = (Account) session.getAttribute("session");
		
		fdOpinion.setWriterId(account.getId());
		fdOpinion.setFdCode(fdCode);
		
		service.fdOpinionAdd(fdOpinion);
		
		return "redirect:" + url;
	}
}
