package com.techelevator.clebrews.controller;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.clebrews.model.Beer;
import com.techelevator.clebrews.model.BeerDAO;
import com.techelevator.clebrews.model.BreweryDAO;
import com.techelevator.clebrews.model.ReviewDAO;



@Controller
public class HomeController {
	
	@Autowired
	BeerDAO beerDAO;
	
	@Autowired
	BreweryDAO breweryDAO;
	
	@Autowired
	ReviewDAO reviewDAO;

	@RequestMapping(path="/", method=RequestMethod.GET)
	public String showHomePage(ModelMap modelHolder) {
		
		modelHolder.put("topBeer", getTopRatedBeer());
		
		
		return "index";
	}
	@RequestMapping(path="/index", method=RequestMethod.GET)
	public String showIndex() {
		
		return "index";
	}
	
private Beer getTopRatedBeer(){
		
		
		List<Beer> beerList = beerDAO.getAllBeer();
		Beer topBeer = beerList.get(0);
		for (int i = 1 ; i < beerList.size() ; i++){
			
			if((beerList.get(i).getRating() == null)){
				beerList.get(i).setRating(new BigDecimal(0));
			}
			
			if(beerList.get(i).getRating().compareTo(topBeer.getRating()) == 0 ){
				if(getReviewCount(beerList.get(i).getId()) > getReviewCount(topBeer.getId())){
				topBeer = beerList.get(i);
				}
			}else if (beerList.get(i).getRating().compareTo(topBeer.getRating()) > 0 ){
				topBeer = beerList.get(i);
			}	
		}
			return topBeer;
	}
	
	public int getReviewCount (long beerId){
		
		return reviewDAO.getReviewCount(beerId);
	}	
	
}
