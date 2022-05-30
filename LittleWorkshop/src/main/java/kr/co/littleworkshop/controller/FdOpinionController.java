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
import kr.co.littleworkshop.model.FdOpinion;
import kr.co.littleworkshop.service.FdOpinionService;

@Controller
@RequestMapping("/fd/fdOpinion")
public class FdOpinionController {
	final String path = "fd/fdOpinion/";
	
	@Autowired
	FdOpinionService service;
	
	@GetMapping("/fdOpinionList")
	public String fdOpinionList(Model model) {
		List<FdOpinion> list = service.fdOpinionList();
		
		model.addAttribute("list", list);
		
		return path + "fdOpinionList";
	}
	
	@PostMapping("/fdOpinionAdd")
	public String fdOpinionAdd(FdOpinion fdOpinion, HttpSession session) {
		Account account = (Account) session.getAttribute("session");
		
		fdOpinion.setWriterId(account.getId());
		
		service.fdOpinionAdd(fdOpinion);
		
		return "redirect:./";
	}
}
