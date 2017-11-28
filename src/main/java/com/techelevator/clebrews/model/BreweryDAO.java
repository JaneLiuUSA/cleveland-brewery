package com.techelevator.clebrews.model;

import java.util.List;

public interface BreweryDAO {


	public List<Brewery> getAllBrewery();

	public void saveBrewery(String name, String address, String city, String zipcode, String phoneNumber, String description, String breweryLogoUrl, String imgUrl, String websiteUrl, String businessHour);

	public void updateBrewery(String name, String address, String city, String zipcode, String phoneNumber,
			String description, String breweryLogoUrl, String imgUrl, String websiteUrl, String businessHours, long id);
	
	public boolean searchForBrewery(String name);
	
	public Brewery getBreweryById(long id);


	public Brewery getBreweryByUserId(int userId);
	
	public List<Brewery> getBreweryWhereUserIdIsNULL();

	public void updateBreweryUserId(long id, int userId);
	
	public Brewery getBreweryByName(String name);


	
}
