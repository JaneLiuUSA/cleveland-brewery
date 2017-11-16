package com.techelevator.clebrews.model;

public interface BreweryDAO {

	public void saveBrewery(String name, String location, String description);
	
	public Brewery getAllBrewery();
	public Brewery getBreweryById(int id);
	public void updateBreweryName();
	public void updateBreweryLocation();
	public void updateBreweryDescription();
	public void updateBreweryimgUrl();
	public void updateBreweryWebsiteUrl();
	public void updateBreweryBusinessHours();
	
	
}
