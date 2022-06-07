package kr.co.littleworkshop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.model.Fd;
import kr.co.littleworkshop.model.ProductCategory;
import kr.co.littleworkshop.service.CategoryService;
import kr.co.littleworkshop.service.FdService;
import kr.co.littleworkshop.service.KeywordService;
import kr.co.littleworkshop.util.FdPager;

@Controller
@RequestMapping("/fd")
public class FdController {
	final String path = "fd/";
	
	@Autowired
	FdService service;
	
	@Autowired
	KeywordService keywordService;
	
	@Autowired
	CategoryService categoryService;
	
	@GetMapping("/fdMain")
	public String fdMain(Model model) {
		return path + "fdMain";
	}
	
	@GetMapping("/list")
	public String list(Model model, FdPager pager, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		
		if(pager.getKeyword() != null) {
			keywordService.addKeyword(pager.getKeyword());
			
			if(account != null) {
				String id = account.getId();
				String keyword = pager.getKeyword();
				
				keywordService.addAttentionKeyword(id, keyword);
			}
		}
		
		System.out.println(pager.getSearch());	
		List<Fd> list = service.list(pager);
		List<ProductCategory> categoryList = categoryService.productCategoryList();
		
		for(ProductCategory item : categoryList) {
			System.out.println( item.getProductCategoryCode()+":"+item.getProductCategory());
		}
		
		model.addAttribute("list", list);
		model.addAttribute("categoryList",categoryList);
		
		return path + "list";
	}
	
	@GetMapping("/view/{fdCode}")
	public String view(Model model, @PathVariable int fdCode) {
		Fd item = service.item(fdCode);
		service.viewCount(fdCode);
		
		model.addAttribute("item", item);
		
		return path + "view";
	}
	
	@GetMapping("/add")
	public String view(Model model, HttpSession session) {
		List<Fd> fdCategories = service.categories();
		
		Account account = (Account) session.getAttribute("account");
		
		model.addAttribute("fdCategories", fdCategories);
		model.addAttribute("account", account);
		
		return path + "add";
	}
	
	@PostMapping("/add")
	public String add(@RequestParam("fdOptionName") List<String> fdOptionNames,
					@RequestParam("fdOptionDetailName") List<String> fdOptionDetailNames,
					@RequestParam("optionCount") List<Integer> optionCount,
					@RequestParam("fdtNecessaryOption") List<Integer> necessaryOptionValues,
					@RequestParam("tagNameList") List<String> tagNameList,
					Fd fd) {
		List<Integer> soldOutValues = new ArrayList<Integer>();
		
		for(int i = 0; i < fdOptionDetailNames.size(); i++) {
			soldOutValues.add(0);
		}
		
		service.add(fdOptionNames, fdOptionDetailNames, optionCount, necessaryOptionValues, soldOutValues, tagNameList, fd);
		
		return "redirect:list";
	}
	
	@GetMapping("/update/{fdCode}")
	public String update(@PathVariable int fdCode, Model model) {
		Fd item = service.item(fdCode);
		
		List<Fd> fdCategories = service.categories();
		
		model.addAttribute("item", item);
		model.addAttribute("fdCategories", fdCategories);
		
		return path + "update";
	}
	
	@PostMapping("/update/{fdCode}")
	public String update(@PathVariable int fdCode,
						@RequestParam("fdOptionName") List<String> fdOptionNames,
						@RequestParam("fdOptionDetailName") List<String> fdOptionDetailNames,
						@RequestParam("optionCount") List<Integer> optionCount,
						@RequestParam("fdNecessaryOption") List<Integer> necessaryOptionValues,
						@RequestParam("fdSoldOut") List<Integer> soldOutValues,
						@RequestParam("tagList") List<String> tagNameList,
						Fd fd) {
		fd.setFdCode(fdCode);
		
		service.update(fdOptionNames, fdOptionDetailNames, optionCount, necessaryOptionValues, soldOutValues, tagNameList, fd);
		
		return "redirect:../list";
	}
	
	@GetMapping("/delete/{fdCode}")
	public String delete(@PathVariable int fdCode) {
		service.delete(fdCode);
		
		return "redirect:../list";
	}
	
	@GetMapping("/participateFd/{fdCode}")
	public String participateFd(@PathVariable int fdCode, @RequestParam("participationPrice") int participationPrice, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		service.participateFd(participationPrice, fdCode, account.getId());
		
		return "redirect:../view/" + fdCode;
	}
}
