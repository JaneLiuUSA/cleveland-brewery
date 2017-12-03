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
public class BreweryController {
	
	@Autowired
	BreweryDAO breweryDAO;
	
	@Autowired
	BeerDAO beerDAO;
	
	
	@RequestMapping(path="/breweries", method=RequestMethod.GET)
	public String showAllBreweries(ModelMap modelHolder, @ModelAttribute Brewery brewery) {
		List<Brewery> breweries = breweryDAO.getAllBrewery();
		modelHolder.put("allBreweries", breweries);
		return "breweries";
	}
	
	@RequestMapping(path="/breweries/new", method=RequestMethod.GET)
	public String displayNewBreweryForm(ModelMap modelHolder, HttpSession session) throws NotAllowedException {
		User currentUser = (User) session.getAttribute("currentUser");
		
		//Verify if the user is logged in and if the user is admin
		if(currentUser == null || currentUser.getRoleId() != 1){
			throw new NotAllowedException(); //call the NotAllowedException class
		}
		if( ! modelHolder.containsAttribute("newBrewery")){
			modelHolder.put("newBrewery", new Brewery());
		}
		return "addBrewery";
	}
	
	@RequestMapping(path="/breweries", method=RequestMethod.POST)
	public String createBrewery(@Valid @ModelAttribute("newBrewery") Brewery newBrewery, BindingResult result, RedirectAttributes flash) {
		flash.addFlashAttribute("newBrewery", newBrewery);

		if(result.hasErrors()) {
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "newBrewery", result);
			return "redirect:/breweries/new";
		}
		if(!breweryDAO.searchForBrewery(newBrewery.getName())) { 

			newBrewery.setBreweryLogoUrl("http://res.cloudinary.com/teclebrew/" + newBrewery.getBreweryLogoUrl()); 
			newBrewery.setImgUrl("http://res.cloudinary.com/teclebrew/" + newBrewery.getImgUrl()); 

			breweryDAO.saveBrewery(newBrewery.getName(), newBrewery.getAddress(), newBrewery.getCity(), newBrewery.getZipcode(), 
					newBrewery.getPhoneNumber(), newBrewery.getDescription(), newBrewery.getBreweryLogoUrl(), newBrewery.getImgUrl(), newBrewery.getWebsiteUrl(), newBrewery.getBusinessHours(), newBrewery.getGoogleMapsUrl(), newBrewery.getLat(), newBrewery.getLng());
			return "redirect:/breweries";
		} else {
			flash.addFlashAttribute("message", "This brewery alreadys exists");
			return "redirect:/breweries/new";
		}
	}
	
	@RequestMapping(path="/breweryDetails/{id}", method=RequestMethod.GET)
	public String showBreweryDetails(@PathVariable long id, ModelMap modelHolder) {
		Brewery breweryDetails = breweryDAO.getBreweryById(id);

		modelHolder.addAttribute("details", breweryDetails);
		
		List<Beer> breweryBeerList = beerDAO.getBeerByBrewery((long) id);
		modelHolder.addAttribute("beers", breweryBeerList);
		
		return "breweryDetails";
	}
	

	@RequestMapping(path="/updateBreweryInfo", method=RequestMethod.GET)
	public String updateBreweryInfo (HttpSession session, ModelMap modelHolder) {
		
		User currentUser = (User) session.getAttribute("currentUser");
		
		if(currentUser == null){
			return "redirect:/login";
		}
		
	
		
		Brewery brewery = breweryDAO.getBreweryByUserId(currentUser.getId());
		modelHolder.put("brewery", brewery);
		
	 return "updateBreweryInfo";
	 
		}
	
	@RequestMapping(path="/updateBreweryInfo", method=RequestMethod.POST)
	public String updateBreweryInfo (@Valid @ModelAttribute("updatedBrewery") Brewery updatedBrewery, BindingResult result, RedirectAttributes flash){
		flash.addFlashAttribute("updatedBrewery", updatedBrewery);
		
		if(result.hasErrors()) {
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "updatedBrewery", result);
			return "redirect:/updateBreweryInfo";
		}
		if (! updatedBrewery.getBreweryLogoUrl().startsWith("http://res.cloudinary.com/teclebrew/")) {
			updatedBrewery.setBreweryLogoUrl("http://res.cloudinary.com/teclebrew/" + updatedBrewery.getBreweryLogoUrl());
		}
		if (! updatedBrewery.getImgUrl().startsWith("http://res.cloudinary.com/teclebrew/")) {
			updatedBrewery.setImgUrl("http://res.cloudinary.com/teclebrew/" + updatedBrewery.getImgUrl());
		}
		
		breweryDAO.updateBrewery(updatedBrewery.getName(), updatedBrewery.getAddress(), updatedBrewery.getCity(), updatedBrewery.getZipcode(), 
			updatedBrewery.getPhoneNumber(), updatedBrewery.getDescription(), updatedBrewery.getBreweryLogoUrl(), updatedBrewery.getImgUrl(), 
			updatedBrewery.getWebsiteUrl(), updatedBrewery.getBusinessHours(), updatedBrewery.getGoogleMapsUrl(), updatedBrewery.getLat(), updatedBrewery.getLng(), updatedBrewery.getId());
		return "redirect:/breweries";
		}
		
}

