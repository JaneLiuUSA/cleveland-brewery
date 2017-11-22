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
			allBreweries.add(mapRowToBrewery(results));
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
		String sqlGetBreweryById = "SELECT * FROM breweries WHERE brewery_id = ?";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetBreweryById, id);
		
		if (results.next()) {
			details = mapRowToBrewery(results);
		}
		return details;
	}
	

	@Override
	public void updateBreweryUserId(int id, int userId) {
		jdbcTemplate.update("UPDATE breweries SET user_id = ? WHERE brewery_id = ?",userId,id);
	}


	@Override
	public void updateBreweryName(String name) {
		jdbcTemplate.update("UPDATE breweries SET name = ? WHERE name = ?", name);
		
	}


	@Override
	public void updateBreweryAddress(String address, String name) {
		jdbcTemplate.update("UPDATE breweries SET address = ? WHERE name = ?", name);
		
	}
	
	@Override
	public void updateBreweryCity(String city, String name) {
		jdbcTemplate.update("UPDATE breweries SET city = ? WHERE name = ?", name);
	}
	
	@Override
	public void updateBreweryZipCode(String zipcode, String name) {
		jdbcTemplate.update("UPDATE breweries SET zipcode = ? WHERE name = ?", name);
	}

	@Override
	public void updateBreweryDescription(String description, String name) {
		jdbcTemplate.update("UPDATE breweries SET description = ? WHERE name = ?", name);
		
	}


	@Override
	public void updateBreweryimgUrl(String imgUrl, String name) {
		jdbcTemplate.update("UPDATE breweries SET img_url = ? WHERE name = ?", name);
		
	}


	@Override
	public void updateBreweryWebsiteUrl(String websiteUrl, String name) {
		jdbcTemplate.update("UPDATE breweries SET website_url = ? WHERE name = ?", name);
		
	}


	@Override
	public void updateBreweryBusinessHours(String businessHours, String name) {
		jdbcTemplate.update("UPDATE breweries SET business_hours = ? WHERE name = ?", name);
		
	}


	@Override
	public List<Brewery> getBreweryWhereUserIdIsNULL() {
		List<Brewery> breweryList = new ArrayList<>();
		String sqlGetBreweryById = "SELECT * FROM breweries WHERE user_id IS NULL";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetBreweryById);
		while (results.next()) {
			breweryList.add(mapRowToBrewery(results));
		}
		return breweryList;
	}
	
	private Brewery mapRowToBrewery(SqlRowSet row) {
		Brewery newBrewery = new Brewery();
		newBrewery.setId(row.getInt("brewery_id"));
		newBrewery.setName(row.getString("name"));
		newBrewery.setAddress(row.getString("address"));
		newBrewery.setCity(row.getString("city"));
		newBrewery.setZipcode(row.getString("zipcode"));
		newBrewery.setPhoneNumber(row.getString("phone_number"));
		newBrewery.setDescription(row.getString("description"));
		newBrewery.setBreweryLogoUrl(row.getString("brewery_logo_url"));
		newBrewery.setImgUrl(row.getString("img_url"));
		newBrewery.setWebsiteUrl(row.getString("website_url"));
		newBrewery.setBusinessHours(row.getString("business_hours"));
		
		return newBrewery;
	}

}
