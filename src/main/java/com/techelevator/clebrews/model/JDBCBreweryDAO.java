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
			brewery.setZipcode(results.getString("zipcode"));
			brewery.setPhoneNumber(results.getString("phone_number"));
			brewery.setDescription(results.getString("description"));
			brewery.setBreweryLogoUrl(results.getString("brewery_logo_url"));
			brewery.setImgUrl(results.getString("img_url"));
			brewery.setWebsiteUrl(results.getString("website_url"));
			brewery.setBusinessHours(results.getString("business_hours"));
			brewery.setUserId(results.getInt("user_id"));
			allBreweries.add(brewery);
		}
		return allBreweries;
	}

	@Override
	public void saveBrewery(String name, String address, String city, String zipcode, String phoneNumber, String description, String breweryLogoUrl, String imgUrl, String websiteUrl, String businessHours) {
		jdbcTemplate.update("INSERT INTO breweries(name, address, city, zipcode, phone_number, description, brewery_logo_url, img_url, website_url, business_hours) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
				name, address, city, zipcode, phoneNumber, description, breweryLogoUrl, imgUrl, websiteUrl, businessHours);
	}


	@Override
	public boolean searchForBrewery(String name) {
		String sqlSearchForBrewery = "SELECT * " +
									 "FROM breweries " +
									 "WHERE UPPER(name) = ?";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForBrewery, name.toUpperCase());
		if(results.next()) {
			return true;
		} else {
		return false;
	}
	}


	@Override
	public Brewery getBreweryById(int id) {
		Brewery details = new Brewery();
		String sqlGetBreweryById = "SELECT * FROM breweries " +
								   "WHERE brewery_id = ?";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetBreweryById);
		
		while(results.next()) {
			details.setName(results.getString("name"));
			details.setAddress(results.getString("address"));
			details.setCity(results.getString("city"));
			details.setZipcode(results.getString("zipcode"));
			details.setPhoneNumber(results.getString("phone_number"));
			details.setDescription(results.getString("description"));
			details.setBreweryLogoUrl(results.getString("brewery_logo_url"));
			details.setImgUrl(results.getString("img_url"));
			details.setWebsiteUrl(results.getString("website_url"));
			details.setBusinessHours(results.getString("bussines_hours"));
		}
		return details;
	}

}
