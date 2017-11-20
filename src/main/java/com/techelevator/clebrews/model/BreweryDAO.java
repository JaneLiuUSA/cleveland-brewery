package com.techelevator.clebrews.model;

import java.util.List;

public interface BreweryDAO {


	public List<Brewery> getAllBrewery();

	public void saveBrewery(String name, String address, String city, String zipcode, String phoneNumber, String description, String breweryLogoUrl, String imgUrl, String websiteUrl, String businessHour);

//	public void updateBreweryName();
//	public void updateBreweryLocation();
//	public void updateBreweryDescription();
//	public void updateBreweryimgUrl();
//	public void updateBreweryWebsiteUrl();
//	public void updateBreweryBusinessHours();
	public void updateBreweryUserId(int id, int userId);

	public boolean searchForBrewery(String name);
	
	public Brewery getBreweryById(int id);
	
}
