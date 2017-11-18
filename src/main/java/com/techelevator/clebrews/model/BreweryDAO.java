package com.techelevator.clebrews.model;

import java.util.List;

public interface BreweryDAO {


	public List<Brewery> getAllBrewery();

	public void saveBrewery(String name, String address, String city, int zipcode, String phoneNumber, String description, String breweryLogoUrl, String imageUrl, String websiteUrl, String businessHour, int userId);
//	public Brewery getBreweryById(int id);
//	public void updateBreweryName();
//	public void updateBreweryLocation();
//	public void updateBreweryDescription();
//	public void updateBreweryimgUrl();
//	public void updateBreweryWebsiteUrl();
//	public void updateBreweryBusinessHours();


	
	
}
