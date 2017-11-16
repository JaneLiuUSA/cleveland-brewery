package com.techelevator.clebrews.model;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;


public class JDBCBreweryDAO implements BreweryDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCBreweryDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}	
	
	@Override
	public void saveBrewery(String name, String location, String description, String imgUrl, String websiteUrl, String businessHours, int userId) {
		jdbcTemplate.update("INSERT INTO breweries(name, location, description, img_url, website_url, business_hours, user_id) VALUES (?, ?, ?, ?, ?, ?, ?)",
				name, location, description, imgUrl, websiteUrl, businessHours, userId);
	}

	@Override
	public Brewery getAllBrewery() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Brewery getBreweryById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateBreweryName() {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateBreweryLocation() {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateBreweryDescription() {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateBreweryimgUrl() {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateBreweryWebsiteUrl() {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateBreweryBusinessHours() {
		// TODO Auto-generated method stub

	}

}
