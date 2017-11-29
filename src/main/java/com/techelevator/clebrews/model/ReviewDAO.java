package com.techelevator.clebrews.model;

import java.util.List;

public interface ReviewDAO {

	public void saveReview(Review review);
	public List<Review> searchReviewsByBeerId(long beerId);
	public int getReviewCount(long beerId);
	
}
