package com.techelevator.clebrews.controller;

import java.time.LocalDateTime;

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
import com.techelevator.clebrews.model.Review;
import com.techelevator.clebrews.model.ReviewDAO;

@Controller
public class ReviewController {

	@Autowired
	ReviewDAO reviewDAO;
	
	@Autowired
	BeerDAO beerDAO;
	
	

	@RequestMapping(path="/beerDetails/{id}/review", method=RequestMethod.GET)
	public String showBreweryDetails(@PathVariable("id") long beerId, ModelMap modelHolder, HttpSession session) throws NotFoundException {
		if (beerDAO.getBeerById(beerId) == null) {
			throw new NotFoundException();
		}
		
		if( ! modelHolder.containsAttribute("newReview")){
			modelHolder.put("newReview", new Review());
		}
		
		Beer beer = beerDAO.getBeerById(beerId);
		modelHolder.addAttribute("beer", beer);
		
		return "addReview";
	}
	
	
	
	@RequestMapping(path="/beerDetails/{id}/review", method=RequestMethod.POST)
	public String createNewMessage(@PathVariable("id") long beerId, @Valid @ModelAttribute("newReview") Review review, BindingResult result, RedirectAttributes flash) throws NotFoundException {
		flash.addFlashAttribute("newReview", review);
		
		if (beerDAO.getBeerById(beerId) == null) {
			throw new NotFoundException();
		}
		
		if(result.hasErrors()) {
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "newReview", result);
			return "redirect://beerDetails/{id}/review";
		}
		review.setCreateTime(LocalDateTime.now());
		
		reviewDAO.saveReview(review);
		
		return "redirect:/beerDetails/"+ beerId;
	}
	
}
