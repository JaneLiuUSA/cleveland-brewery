package com.techelevator.clebrews.controller;

import java.math.BigDecimal;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.clebrews.model.Beer;
import com.techelevator.clebrews.model.BeerDAO;
import com.techelevator.clebrews.model.Brewery;
import com.techelevator.clebrews.model.BreweryDAO;
import com.techelevator.clebrews.model.Review;
import com.techelevator.clebrews.model.ReviewDAO;
import com.techelevator.clebrews.model.User;

@Controller
public class BeerController {
	
	@Autowired
	BeerDAO beerDAO;
	
	@Autowired
	BreweryDAO breweryDAO;
	
	@Autowired
	ReviewDAO reviewDAO;

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
	public String addNewBeer(@Valid @ModelAttribute("newBeer") Beer newBeer, @RequestParam int breweryId, HttpSession session, BindingResult result, RedirectAttributes flash) {
		flash.addFlashAttribute("newBeer", newBeer);
		
		if(result.hasErrors()) {
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "newBrewery", result);
			return "redirect:/breweries/new";
		} 
		if(!beerDAO.searchForBeerByName(newBeer.getName())) { 
			newBeer.setImgUrl("http://res.cloudinary.com/teclebrew/" + newBeer.getImgUrl());
			
			newBeer.setBreweryId((long) breweryId);
			beerDAO.saveBeer(newBeer);
			return "redirect:/breweryBeers";
		} else {
			flash.addFlashAttribute("message", "This brewery alreadys exists");
			return "redirect:/breweries/new";
		}
	}
	
	@RequestMapping(path="/beerDetails/{id}", method=RequestMethod.GET)
	public String showBreweryDetails(@PathVariable long id, ModelMap modelHolder) {
		Beer beer = beerDAO.getBeerById(id);
		Brewery brewery = breweryDAO.getBreweryById(beer.getBreweryId());
		List<Review> reviews = reviewDAO.searchReviewsByBeerId(id);
		modelHolder.addAttribute("beer", beer);
		modelHolder.addAttribute("brewery", brewery);
		modelHolder.addAttribute("reviews", reviews);
		
		return "beerDetails";
	}
	
	
	
	
	@RequestMapping(path="{beerId}/updateInfo", method=RequestMethod.GET)
	public String updateBreweryInfo (@PathVariable long beerId, HttpSession session, ModelMap modelHolder) throws NotAllowedException {
		
		User currentUser = (User) session.getAttribute("currentUser");
		
		if(currentUser == null){
			return "redirect:/login";
		}
		
		if( ! modelHolder.containsAttribute("updatedBeer")){
			modelHolder.put("updatedBeer", new Beer());
		}
	// Check if the beer belongs to the brewery
		Beer beer = beerDAO.getBeerById(beerId);
		Brewery brewery = breweryDAO.getBreweryById(beer.getBreweryId());
		if(currentUser.getId() != brewery.getUserId()){
			throw new NotAllowedException();
		}
		modelHolder.put("beer",beer);
		
	 return "updateBeerInfo";
	 
		}
	
	@RequestMapping(path="/updateBeerInfo", method=RequestMethod.POST)
	public String updateBreweryInfo (@Valid @ModelAttribute Beer updatedBeer, 
			BindingResult result, RedirectAttributes flash){
		
		flash.addFlashAttribute("updatedBeer", updatedBeer);
		
		if(result.hasErrors()) {
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "updatedBeer", result);
			return "redirect:/{beerId}/updateInfo";
		}
		if (! updatedBeer.getImgUrl().startsWith("http://res.cloudinary.com/teclebrew/")) {
			updatedBeer.setImgUrl("http://res.cloudinary.com/teclebrew/" + updatedBeer.getImgUrl());
		}
		
		beerDAO.updateBeerInfo(updatedBeer.getName(), updatedBeer.getAbv(), updatedBeer.getIbu(),updatedBeer.getType(),
				updatedBeer.getInfo(), updatedBeer.getImgUrl(), updatedBeer.getId());
		
		return "redirect:/breweryBeers";
		}
	
	
//	public Beer getTopRatedBeer(){
//		
//		BigDecimal maxRating = new BigDecimal(0);
//		
//		List<Beer> beerList = beerDAO.getAllBeer();
//		Beer topBeer = beerList.get(0);
//		for (int i = 0 ; i < beerList.size() ; i++){
//			if( beerList.get(i).getRating().topBeer.getRating()){
//				maxRating = beer.getRating();
//			}
//		}
//		List<Beer> topBeers = beerDAO.getBeersByRating(maxRating);
//		
//		return topBeer;
//		
//	}
}
