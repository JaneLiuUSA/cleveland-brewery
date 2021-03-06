package com.techelevator.clebrews.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.techelevator.clebrews.model.Beer;
import com.techelevator.clebrews.model.BeerDAO;
import com.techelevator.clebrews.model.BreweryDAO;
import com.techelevator.clebrews.model.User;
import com.techelevator.clebrews.model.UserDAO;

@Controller
public class BrewerProfileController {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private BreweryDAO breweryDAO;
	
	@Autowired
	private BeerDAO beerDAO;
	
	
		@RequestMapping(path="/brewerAccounts", method=RequestMethod.GET)
		public String showAllBreweryAccounts(ModelMap modelHolder, HttpSession session) throws NotAllowedException {
			User currentUser = (User) session.getAttribute("currentUser");
			
			//Verify if the user is logged in and if the user is admin
			if(currentUser == null || currentUser.getRoleId() != 1){
				throw new NotAllowedException(); //call the NotAllowedException class
			}
			
			List<User> brewers = userDAO.getUserByRoleId(2); //brewer role_id = 2
			modelHolder.put("allBrewers", brewers);
			return "brewerAccounts";
		}
		
		@ResponseBody  //tell spring don't run true.jsp , true is response body
		@RequestMapping(path="/brewerActive", method=RequestMethod.POST)
		public boolean updateActiveBreweryAccount(@RequestParam int brewerId, @RequestParam boolean active){
			userDAO.UpdatetActiveByUserId(brewerId, active);
			
			return true;
		}
	
		@RequestMapping(path="/breweryBeers", method=RequestMethod.GET)
		public String showAllBreweryBeers(ModelMap modelHolder, HttpSession session) throws NotAllowedException {
			User currentUser = (User) session.getAttribute("currentUser");
			
			if (currentUser == null || currentUser.getRoleId() != 2) {
				throw new NotAllowedException();
			}

			Long breweryId = (long) breweryDAO.getBreweryByUserId(currentUser.getId()).getId();

			List<Beer> breweryBeerList = beerDAO.getAllBeerByBrewery(breweryId);
			modelHolder.put("beers", breweryBeerList);
			return "breweryBeers";
		}
		
		@ResponseBody
		@RequestMapping(path="/breweryBeerActive", method=RequestMethod.POST)
		public boolean updateBreweryActiveBeer(@RequestParam Long beerId, @RequestParam boolean isActive) {
			beerDAO.updateActiveBeerByBrewery(beerId, isActive);
			return true;
		}
		
		@ResponseBody
		@RequestMapping(path="/breweryBeerRemove", method=RequestMethod.POST)
		public boolean deleteBeerFromBrewery(@RequestParam Long beerId) {
			beerDAO.removeBeer(beerId);
			return true;
		}
		
}
