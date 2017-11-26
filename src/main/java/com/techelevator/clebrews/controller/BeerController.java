package com.techelevator.clebrews.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.clebrews.model.Beer;
import com.techelevator.clebrews.model.BeerDAO;
import com.techelevator.clebrews.model.Brewery;
import com.techelevator.clebrews.model.BreweryDAO;
import com.techelevator.clebrews.model.User;

@Controller
public class BeerController {
	
	@Autowired
	BeerDAO beerDAO;
	
	@Autowired
	BreweryDAO breweryDAO;

	@RequestMapping(path="/beers", method=RequestMethod.GET)
	public String showAllBeers(ModelMap modelHolder) {
		List<Beer> beerList = beerDAO.getAllBeer();
		List<Brewery> breweries = breweryDAO.getAllBrewery();
		
		modelHolder.put("allBeers", beerList);
		modelHolder.put("allBreweries", breweries);
		return "beers";
	}
	
	@RequestMapping(path="/addBeer", method=RequestMethod.GET)
	public String showAddBeer(ModelMap modelHolder, HttpSession session) throws NotAllowedException {
		User currentUser= (User) session.getAttribute("currentUser");
		
		if(currentUser == null || currentUser.getRoleId() != 2) {
			throw new NotAllowedException();
		}
		if( ! modelHolder.containsAttribute("newBeer")){
			modelHolder.put("newBeer", new Beer());
		}
		
		Brewery currentBrewery = breweryDAO.getBreweryByUserId(currentUser.getId());
		modelHolder.put("brewery", currentBrewery);
		
		return "addBeer";
	}
	
	@RequestMapping(path="/addBeer", method=RequestMethod.POST)
	public String addNewBeer(@Valid @ModelAttribute("newBeer") Beer newBeer, BindingResult result, RedirectAttributes flash) {
		flash.addFlashAttribute("newBeer", newBeer);

		if(result.hasErrors()) {
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "newBrewery", result);
			return "redirect:/breweries/new";
		} 
		if(!beerDAO.searchForBeerByName(newBeer.getName())) { 
			newBeer.setImgUrl("http://res.cloudinary.com/teclebrew/" + newBeer.getImgUrl());
			
			beerDAO.saveBeer(newBeer);
			return "redirect:/breweries";
		} else {
			flash.addFlashAttribute("message", "This brewery alreadys exists");
			return "redirect:/breweries/new";
		}
	}
	
	@RequestMapping(path="/beerDetails/{id}", method=RequestMethod.GET)
	public String showBreweryDetails(@PathVariable long id, ModelMap modelHolder) {
		Beer beer = beerDAO.getBeerById(id);
		System.out.print(beer.getBreweryId());
		Brewery brewery = breweryDAO.getBreweryById(beer.getBreweryId());
		modelHolder.addAttribute("beer", beer);
		modelHolder.addAttribute("brewery", brewery);
		
		return "beerDetails";
	}
}
