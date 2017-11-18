package com.techelevator.clebrews.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCBreweryDAO implements BreweryDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCBreweryDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}	
	

	@Override
	public List<Brewery> getAllBrewery() {
		List<Brewery> allBreweries = new ArrayList<>();
		String sqlSelectAllBreweries = "SELECT * FROM breweries ORDER BY name";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllBreweries);
		while(results.next()) {
			Brewery brewery = new Brewery();
			brewery.setId(results.getInt("brewery_id"));
			brewery.setName(results.getString("name"));
			brewery.setAddress(results.getString("address"));
			brewery.setCity(results.getString("city"));
			brewery.setZipcode(results.getInt("zipcode"));
			brewery.setPhoneNumber(results.getString("phone_number"));
			brewery.setDescription(results.getString("description"));
			brewery.setBreweryLogoUrl(results.getString("brewery_logo_url"));
			brewery.setImgUrl(results.getString("img_url"));
			brewery.setWebsitieUrl(results.getString("website_url"));
			brewery.setBusinessHour(results.getString("business_hours"));
			brewery.setUserId(results.getInt("user_id"));
			allBreweries.add(brewery);
		}
		return allBreweries;
	}

//	@Override
//	public void saveBrewery(String name, String location, String description, String imgUrl, String websiteUrl, String businessHours, int userId) {
//		jdbcTemplate.update("INSERT INTO breweries(name, location, description, img_url, website_url, business_hours, user_id) VALUES (?, ?, ?, ?, ?, ?, ?)",
//				name, location, description, imgUrl, websiteUrl, businessHours, userId);
//	}

}
