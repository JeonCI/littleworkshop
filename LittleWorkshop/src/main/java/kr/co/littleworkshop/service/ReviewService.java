package kr.co.littleworkshop.service;

import java.util.List;

import kr.co.littleworkshop.model.Product;
import kr.co.littleworkshop.model.Review;

public interface ReviewService {

	List<Product> reviewList(String id);

	void add(Review review);

	List<Product> myReview(String id);

	void update(Review review);

	void delete(int code, String id);

}
