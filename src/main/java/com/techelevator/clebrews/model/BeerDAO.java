package com.techelevator.clebrews.model;

import java.util.List;

public interface BeerDAO {
	public List<Beer> allBeer();
	
	public Beer getBeerByName(String name);
	
	public Beer getBeerByBrewery(Long breweryId);
	
	public boolean searchForBeerByName(String name);
	
	public void saveBeer(Beer newBeer);
}
