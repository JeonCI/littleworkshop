package kr.co.littleworkshop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.model.AccountAddress;
import kr.co.littleworkshop.model.Order;
import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.model.ProductImages;
import kr.co.littleworkshop.model.ProfileImage;
import kr.co.littleworkshop.model.ReceiveRequest;
import kr.co.littleworkshop.model.Review;
import kr.co.littleworkshop.service.AccountAddressService;
import kr.co.littleworkshop.service.AccountService;
import kr.co.littleworkshop.service.BuyerService;
import kr.co.littleworkshop.service.OrderService;
import kr.co.littleworkshop.service.ProductService;
import kr.co.littleworkshop.service.ReviewService;
import kr.co.littleworkshop.util.DeleteFile;
import kr.co.littleworkshop.util.Pager;
import kr.co.littleworkshop.util.UploadFile;
import kr.co.littleworkshop.util.Uploader;



@Controller
@RequestMapping("/mypage")
public class BuyerMypageController {
	final String path = "mypage/";

	@Autowired
	BuyerService service;
	@Autowired
	AccountAddressService addressService;
	@Autowired
	OrderService orderService;
	@Autowired
	AccountService accountService;
	@Autowired
	ProductService productService;
	@Autowired
	ReviewService reviewService;
	
	@RequestMapping("/")
	public String list(Model model, Pager pager, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		model.addAttribute("account", account);
		
		ProfileImage profileImage = accountService.getProfileImage(account.getId());
		model.addAttribute("profileImage", profileImage);
		
		if(account.getClassify() == 2) 
			return path + "sellerPage";
		
		List<Order> orderList = orderService.orderHistory(account.getId(), pager);
		model.addAttribute("orderHistory", orderList);
		
		List<Product> list = productService.likeList(account.getId());
		model.addAttribute("likeList", list);
		
		Order status = orderService.orderStatusInfo(account.getId());
		model.addAttribute("status", status);
		
		return path + "buyerPage";
	}
	
	// #????????????
	@RequestMapping("/orderList")
	public String order(Model model, Pager pager, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		List<Order> orderList = orderService.orderHistory(account.getId(), pager);
		model.addAttribute("orderHistory", orderList);
		return path + "order/list";
	}
	
	
	// #???????????? ??????
	@RequestMapping("/address")
	public String address(Model model, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		List<AccountAddress> list = addressService.list(account.getId());
		model.addAttribute("list", list);
		return path + "address/list";
	}
	// ??????
	@GetMapping("/address/add")
	public String addAddress(Model model) {
		List<ReceiveRequest> requestList = addressService.requestList();
		model.addAttribute("requestList", requestList);
		return path + "address/add";
	}
	@PostMapping("/address/add")
	public String addAddress(AccountAddress address, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		address.setId(account.getId());
		addressService.add(address);
		return "redirect:../address";
	}
	// ??????
	@GetMapping("/address/update/{code}")
	public String updateAddress(Model model, @PathVariable int code, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		AccountAddress item = addressService.item(code, account.getId());
		List<ReceiveRequest> requestList = addressService.requestList();
		model.addAttribute("requestList", requestList);
		model.addAttribute("item", item);
		return path + "address/update";
	}
	@PostMapping("/address/update/{code}")
	public String updateAddress(AccountAddress address, @PathVariable int code, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		address.setId(account.getId());
		address.setAddressCode(code);
		addressService.update(address);
		return "redirect:../../address";
	}
	// ??????
	@GetMapping("/address/delete/{code}")
	public String deleteAddress(@PathVariable int code, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		addressService.delete(code, account.getId());
		return "redirect:../../address";
	}
	
	
	
	// #???????????? ??????
	@GetMapping("/accountInfo_Edit")
	public String accountInfoEdit(Model model, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		Account item = accountService.item(account.getId());
		model.addAttribute("item", item);
		return path + "accountInfo";
	}
	
	@ResponseBody
	@PostMapping("/accountInfo_Edit")
	public boolean accountInfoEdit(Account item, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		item.setId(account.getId());
		item.setClassify(account.getClassify());
		accountService.update(item);
		return true;
	}
	
	
	// #?????????
	@GetMapping("/like")
	public String likeList(Model model, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		List<Product> list = productService.likeList(account.getId());
		model.addAttribute("list", list);
		return path + "like";
	}
	// #????????? ?????????
	@ResponseBody
	@PostMapping("/profileImg")
	public String profileImg(@RequestBody MultipartFile profileImg, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		String root  =  "profileImg/"+account.getId();
		Uploader<ProfileImage> uploader = new Uploader<>();
		ProfileImage image = accountService.getProfileImage(account.getId());
		ProfileImage item = null;
		try {

			if(image != null) {
				DeleteFile<UploadFile> deleteFile = new DeleteFile<UploadFile>();
				deleteFile.deleteImage(root);
				item = uploader.makeProfileImage(profileImg, ProfileImage.class,root);
				item.setId(account.getId());
				accountService.updateProfileImage(item);

			}else {
				item = uploader.makeProfileImage(profileImg, ProfileImage.class,root);
				item.setId(account.getId());
				accountService.addProfileImage(item);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}
	
	// #????????????
	@GetMapping("/reviewList")
	public String reviewList(Model model, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		List<Product> list = reviewService.reviewList(account.getId());
		model.addAttribute("list", list);
		return path + "reviewList";
	}
	
	@PostMapping("/reviewList")
	public String reviewList(Review review, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		review.setId(account.getId());
		reviewService.add(review);
		return "redirect:./reviewList";
	}
	
	// #?????? ??? ??????
	@GetMapping("/myReview")
	public String myReview(Model model, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		List<Product> list = reviewService.myReview(account.getId());
		model.addAttribute("list", list);
		return path + "myReview";
	}
	
	@PostMapping("/myReview/{code}")
	public String myReview(@PathVariable int code, Review review, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		review.setId(account.getId());
		review.setReviewCode(code);
		reviewService.update(review);
		return "redirect:../myReview";
	}
	
	@GetMapping("/myReview/delete/{code}")
	public String deleteReview(@PathVariable int code, HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		reviewService.delete(code, account.getId());
		return "redirect:../..//myReview";
	}
	
}
