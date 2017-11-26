package com.techelevator.clebrews.controller;

import java.time.LocalDateTime;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.clebrews.model.Beer;
import com.techelevator.clebrews.model.BeerDAO;
import com.techelevator.clebrews.model.Review;
import com.techelevator.clebrews.model.ReviewDAO;

@Controller
public class ReviewController {

	@Autowired
	ReviewDAO reviewDAO;
	
	@Autowired
	BeerDAO beerDAO;
	
	

	@RequestMapping(path="/beerDetails/{id}/review", method=RequestMethod.GET)
	public String showBreweryDetails(@PathVariable("id") long beerId, ModelMap modelHolder, HttpSession session) {
		
		if( ! modelHolder.containsAttribute("newReview")){
			modelHolder.put("newReview", new Review());
		}
		
		Beer beer = beerDAO.getBeerById(beerId);
		modelHolder.addAttribute("beer", beer);
		
		return "addReview";
	}
	
	
	
	@RequestMapping(path="/beerDetails/{beerId}/review", method=RequestMethod.POST)
	public String createNewMessage(@Valid @PathVariable String userName,@PathVariable long beerId, @ModelAttribute("newReview") Review review) {
		
		review.setCreatTime(LocalDateTime.now());
		
		reviewDAO.saveReview(review);
		
		return "redirect:/beerDetails/"+ beerId;
	}
	
}
