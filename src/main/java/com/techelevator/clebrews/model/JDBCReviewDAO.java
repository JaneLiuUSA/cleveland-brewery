package com.techelevator.clebrews.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCReviewDAO implements ReviewDAO  {
	
	
	private JdbcTemplate jdbcTemplate;
	
	
	@Autowired
	public JDBCReviewDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void saveReview(Review review) {
		String sqlSaveReview = "INSERT INTO reviews(subject, description, rating, create_date, beer_id) VALUES(?,?,?,?,?)";
		jdbcTemplate.update(sqlSaveReview, review.getSubject(), review.getDescription(), review.getRating(), 
				review.getCreateTime(), review.getBeerId());
				
				
	}

	@Override
	public List<Review> searchReviewsByBeerId(long beerId) {
		List<Review> reviewList = new ArrayList<>();
		String sqlSearchReviewByBeerId = "SELECT * FROM reviews WHERE beer_id = ? ORDER BY create_date DESC LIMIT 10";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchReviewByBeerId, beerId);
		
		while(results.next()){
			reviewList.add(mapRowToReview(results));
		}
		
		
		return reviewList;
	}

	private Review mapRowToReview(SqlRowSet row) {
		Review review = new Review();
		
		review.setId(row.getLong("review_id"));
		review.setSubject(row.getString("subject"));
		review.setDescription(row.getString("description"));
		review.setRating(row.getInt("rating"));
		review.setCreateTime(row.getTimestamp("create_date").toLocalDateTime());
		review.setBeerId(row.getInt("beer_id"));

		return review;
	}

	@Override
	public int getReviewCount(long beerId) {
		String sqlGetReviewCount = "SELECT COUNT(*) FROM reviews WHERE beer_id = ?";		
		int numOfReviews = jdbcTemplate.queryForObject(sqlGetReviewCount, int.class, beerId);
		return numOfReviews;
	}
	
}
