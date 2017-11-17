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
	BreweryDAO breweryDao;
	
	
	@RequestMapping(path="/breweries", method=RequestMethod.GET)
	public String showAllBreweries(ModelMap modelHolder, @ModelAttribute Brewery brewery) {
		List<Brewery> breweries = breweryDao.getAllBrewery();
		modelHolder.put("allBreweries", breweries);
		return "breweries";
	}

}
