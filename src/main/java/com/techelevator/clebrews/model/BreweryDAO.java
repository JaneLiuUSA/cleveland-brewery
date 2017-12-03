package com.techelevator.clebrews.model;

import java.util.List;

public interface BreweryDAO {


	public List<Brewery> getAllBrewery();

	public void saveBrewery(String name, String address, String city, String zipcode, String phoneNumber, String description, String breweryLogoUrl, String imgUrl, String websiteUrl, String businessHour, String googleMapsUrl, String lat, String lng);

	public void updateBrewery(String name, String address, String city, String zipcode, String phoneNumber,
			String description, String breweryLogoUrl, String imgUrl, String websiteUrl, String businessHours, String googleMapsUrl, String lat, String lng, long id);
	
	public boolean searchForBrewery(String name);
	
	public Brewery getBreweryById(long id);


	public Brewery getBreweryByUserId(long l);
	
	public List<Brewery> getBreweryWhereUserIdIsNULL();

	public boolean updateBreweryUserId(long id, int userId);
	
	public Brewery getBreweryByName(String name);


	
}
