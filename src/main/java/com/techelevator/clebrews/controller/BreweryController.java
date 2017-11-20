package com.techelevator.clebrews.controller;

import java.util.List;

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
	public String displayNewBreweryForm(ModelMap modelHolder) {
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
			breweryDAO.saveBrewery(newBrewery.getName(), newBrewery.getAddress(), newBrewery.getCity(), newBrewery.getZipcode(), newBrewery.getPhoneNumber(), newBrewery.getDescription(), newBrewery.getBreweryLogoUrl(), newBrewery.getImgUrl(), newBrewery.getWebsiteUrl(), newBrewery.getBusinessHours());
			return "redirect:/breweries";
		} else {
			flash.addFlashAttribute("message", "This brewery alreadys exists");
			return "redirect:/breweries/new";
		}
	}
	
	@RequestMapping(path="/breweryDetails/{id}", method=RequestMethod.GET)
	public String showBreweryDetails(@PathVariable int id, ModelMap ModelHolder) {
		Brewery breweryDetails = breweryDAO.getBreweryById(id);
		ModelHolder.put("details", breweryDetails);
		
		return "breweryDetails";
	}
	
}
