package kr.co.littleworkshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String fdOpinionList(Model model, @PathVariable int fdCode, FdPager pager, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		
		pager.setFdCode(fdCode);
		
		List<FdOpinion> list = service.fdOpinionList(pager);
		
		model.addAttribute("list", list);
		model.addAttribute("fdCode", fdCode);
		model.addAttribute("account", account);
		
		return path + "fdOpinionList";
	}
	
	@PostMapping("/fdOpinionAdd")
	public String fdOpinionAdd(FdOpinion fdOpinion, HttpSession session) {
		
		Account account = (Account) session.getAttribute("account");
		
		fdOpinion.setWriterId(account.getId());
		
		service.fdOpinionAdd(fdOpinion);
		
		return "redirect:fdOpinionList/" + fdOpinion.getFdCode();
	}
	
	@GetMapping("/confirm/{fdCode}/{fdOpinionCode}")
	@ResponseBody
	public String confirm(@PathVariable int fdCode, @PathVariable int fdOpinionCode) {
		FdOpinion fdOpinion = new FdOpinion();
		
		fdOpinion.setFdCode(fdCode);
		fdOpinion.setFdOpinionCode(fdOpinionCode);
		
		service.confirm(fdOpinion);
		
		return "";
	}
	
	@GetMapping("/removeConfirm/{fdCode}/{fdOpinionCode}")
	@ResponseBody
	public String removeConfirm(@PathVariable int fdCode, @PathVariable int fdOpinionCode) {
		FdOpinion fdOpinion = new FdOpinion();
		
		fdOpinion.setFdCode(fdCode);
		fdOpinion.setFdOpinionCode(fdOpinionCode);
		
		service.removeConfirm(fdOpinion);
		return "";
	}
}
