package kr.co.littleworkshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.littleworkshop.dao.ReviewDao;
import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.model.Review;
@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDao dao;
	
	@Autowired
	OrderService orderService;
	
	@Override
	public List<Product> reviewList(String id) {
		return dao.reviewList(id);
	}

	@Override
	public void add(Review review) {
		dao.add(review);
		orderService.setReviewStatus(review);
	}

	@Override
	public List<Product> myReview(String id) {
		return dao.myReview(id);
	}

	@Override
	public void update(Review review) {
		dao.update(review);
	}

	@Override
	public void delete(int code, String id) {
		dao.delete(code ,id);
		
	}

}
