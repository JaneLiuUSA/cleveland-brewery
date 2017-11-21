package com.techelevator.clebrews.model;

import java.util.List;

public interface BreweryDAO {


	public List<Brewery> getAllBrewery();

	public void saveBrewery(String name, String address, String city, String zipcode, String phoneNumber, String description, String breweryLogoUrl, String imgUrl, String websiteUrl, String businessHour);

	public void updateBreweryName(String name);
	
	public void updateBreweryAddress(String address, String name);
	
	public void updateBreweryCity(String city, String name);
	
	public void updateBreweryZipCode(String zipcode, String name);
	
	public void updateBreweryDescription(String description, String name);
	
	public void updateBreweryimgUrl(String imgUrl, String name);
	
	public void updateBreweryWebsiteUrl(String websiteUrl, String name);
	
	public void updateBreweryBusinessHours(String businessHours, String name);
	
	public void updateBreweryUserId(int id, int userId);

	public boolean searchForBrewery(String name);
	
	public Brewery getBreweryById(int id);
	
}
