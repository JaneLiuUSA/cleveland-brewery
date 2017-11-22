package com.techelevator.clebrews.model;

import java.util.List;

public interface BreweryDAO {


	public List<Brewery> getAllBrewery();

	public void saveBrewery(String name, String address, String city, String zipcode, String phoneNumber, String description, String breweryLogoUrl, String imgUrl, String websiteUrl, String businessHour);

	public void updateBrewery(String name, String address, String city, String zipcode, String phoneNumber,
			String description, String breweryLogoUrl, String imgUrl, String websiteUrl, String businessHours, int id);
	
	public boolean searchForBrewery(String name);
	
	public Brewery getBreweryById(int id);


	public Brewery getBreweryByUserId(int userId);
	
	public List<Brewery> getBreweryWhereUserIdIsNULL();


	
}
