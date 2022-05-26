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
import kr.co.littleworkshop.model.NoticeCategory;
import kr.co.littleworkshop.service.CategoryService;
import kr.co.littleworkshop.service.NoticeService;

@Controller
@RequestMapping("/admin/notice")
public class AdminNoticeController {
	final String path = "admin/notice/";
			
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	CategoryService categoryService;
	
	@GetMapping("/noticeList")
	public String noticeList(Model model) {
		List<Notice> noticeList = noticeService.list();
		
		model.addAttribute("noticeList", noticeList);
		
		return path + "noticeList";
	}
	
	@GetMapping("/noticeAdd")
	public String noticeAdd(Model model) {
		List<Notice> noticeCategoryList = noticeService.noticeCategoryList();
		
		model.addAttribute("noticeCategoryList", noticeCategoryList);
		
		return path + "noticeAdd";
	}
	
	@PostMapping("/noticeAdd")
	public String noticeAdd(Notice notice) {
		noticeService.noticeAdd(notice);
		
		return "redirect:noticeList";
	}
	
	@GetMapping("/noticeUpdate/{noticeCode}")
	public String noticeUpdate(@PathVariable int noticeCode, Model model) {
		Notice item = noticeService.noticeItem(noticeCode);
		List<Notice> noticeCategoryList = noticeService.noticeCategoryList();
		
		model.addAttribute("item", item);
		model.addAttribute("noticeCategoryList", noticeCategoryList);
		
		return path + "noticeUpdate";
	}
	
	@PostMapping("/noticeUpdate/{noticeCode}")
	public String noticeUpdate(@PathVariable int noticeCode, Notice notice) {
		notice.setNoticeCode(noticeCode);
		
		noticeService.noticeUpdate(notice);
		
		return "redirect:../noticeList";
	}
	
	@GetMapping("/noticeDelete/{noticeCode}")
	public String noticeDelete(@PathVariable int noticeCode) {
		noticeService.noticeDelete(noticeCode);
		
		return "redirect:../noticeList";
	}
	
	@GetMapping("/noticeView/{noticeCode}")
	public String noticeView(@PathVariable int noticeCode, Model model) {
		Notice item = noticeService.noticeItem(noticeCode);
		
		model.addAttribute("item", item);
		
		return path + "noticeView";
	}
	
	@GetMapping("/noticeCategoryList")
	public String noticeCategoryList(Model model) {
		List<NoticeCategory> noticeCategoryList = categoryService.noticeCategoryList();
		
		model.addAttribute("noticeCateogryList", noticeCategoryList);
		
		return path + "noticeCategoryList";
	}
	
	@PostMapping("/noticeCategoryAdd")
	public String noticeCategoryAdd(NoticeCategory noticeCategory) {
		categoryService.noticeCategoryAdd(noticeCategory);
		
		return "redirect:noticeCategoryList";
	}
	
	@GetMapping("/noticeCategoryUpdate/{noticeCategoryCode}")
	public String noticeCategoryUpdate(@PathVariable int noticeCategoryCode, Model model) {
		NoticeCategory item = categoryService.noticeCategoryItem(noticeCategoryCode);
		
		model.addAttribute("item", item);
		
		return path + "noticeCategoryUpdate";
	}
	
	@PostMapping("/noticeCategoryUpdate/{noticeCategoryCode}")
	public String noticeCategoryUpdate(@PathVariable int noticeCategoryCode, NoticeCategory noticeCategory) {
		noticeCategory.setNoticeCategoryCode(noticeCategoryCode);
		
		categoryService.noticeCateogryUpdate(noticeCategory);
		
		return "redirect:../noticeCategoryList";
	}
	
	@GetMapping("/noticeCategoryDelete/{noticeCategoryCode}")
	public String noticeCategoryDelete(@PathVariable int noticeCategoryCode) {
		categoryService.noticeCategoryDelete(noticeCategoryCode);
		
		return "redirect:../noticeCategoryList";
	}
}
