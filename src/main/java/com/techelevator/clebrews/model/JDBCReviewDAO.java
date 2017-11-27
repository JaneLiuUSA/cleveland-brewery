package com.techelevator.clebrews.model;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class JDBCReviewDAO implements ReviewDAO  {
	
	private JdbcTemplate jdbcTemplate;
	

	@Override
	public void saveReview(Review review) {
		String sqlSaveReview = "INSERT INTO reviews(review_id, subject, description, rating, create_date, beer_id, user_id) VALUES(?,?,?,?,?,?,?)";
		jdbcTemplate.update(sqlSaveReview,review.getId(), review.getSubject(), review.getDescription(), review.getRating(), 
				review.getCreatTime(), review.getBeerId(), review.getUserId());
				
				
	}

}
