package com.techelevator.clebrews.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.clebrews.model.Brewery;
import com.techelevator.clebrews.model.BreweryDAO;



@Controller
public class BreweryController {
	
	@Autowired
	BreweryDAO breweryDAO;
	
	
	@RequestMapping(path="/breweries", method=RequestMethod.GET)
	public String showAllBreweries(ModelMap modelHolder, @ModelAttribute Brewery brewery) {
		List<Brewery> breweries = breweryDAO.getAllBrewery();
		modelHolder.put("allBreweries", breweries);
		return "breweries";
	}
	
	@RequestMapping(path="/breweries/new", method=RequestMethod.GET)
	public String displayNewBreweryForm() {
		return "addBrewery";
	}
	
	@RequestMapping(path="/breweries", method=RequestMethod.POST)
	public String createBrewery(@ModelAttribute Brewery newBrewery) {
		breweryDAO.saveBrewery(newBrewery.getName(), newBrewery.getAddress(), newBrewery.getCity(), newBrewery.getZipcode(), newBrewery.getPhoneNumber(), newBrewery.getDescription(), newBrewery.getBreweryLogoUrl(), newBrewery.getImgUrl(), newBrewery.getWebsitieUrl(), newBrewery.getBusinessHour(), newBrewery.getUserId() );
		return "redirect:/breweries";
	}
	
}
