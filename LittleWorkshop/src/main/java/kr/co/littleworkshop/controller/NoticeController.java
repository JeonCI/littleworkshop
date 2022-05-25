package kr.co.littleworkshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.littleworkshop.model.Notice;
import kr.co.littleworkshop.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	final String path = "notice/";
	
	@Autowired
	NoticeService service;
	
	@GetMapping("/list")
	public String list(Model model) {
		List<Notice> list = service.list();
		
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@GetMapping("/view/{noticeCode}")
	public String view(@PathVariable int noticeCode, Model model) {
		Notice item = service.noticeItem(noticeCode);
		
		model.addAttribute("item", item);
		
		return path + "view";
	}
}
