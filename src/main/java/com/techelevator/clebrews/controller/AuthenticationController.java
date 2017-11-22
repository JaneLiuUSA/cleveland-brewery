package com.techelevator.clebrews.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.clebrews.model.BreweryDAO;
import com.techelevator.clebrews.model.User;
import com.techelevator.clebrews.model.UserDAO;



@Controller
//@SessionAttributes("currentUser")
public class AuthenticationController {

	private UserDAO userDAO;
	
	@Autowired
	BreweryDAO breweryDAO;
	
	@Autowired
	public AuthenticationController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@RequestMapping(path="/login", method=RequestMethod.GET)
	public String displayLoginForm() {
		return "login";
	}
	
	@RequestMapping(path="/login", method=RequestMethod.POST)
	public String login(Map<String, Object> model, 
						@RequestParam String userName,
						@RequestParam String password,
						@RequestParam(required=false) String destination,
						HttpServletRequest request) {
		
		if(userDAO.searchForUsernameAndPassword(userName, password)) {
			request.changeSessionId();
			User currentUser = userDAO.getUserByUsername(userName);
			request.getSession().setAttribute("currentUser", currentUser);  //put the user object in the session
			
			if(isValidRedirect(destination)) {
				return "redirect:"+destination;
			} else {
				return "redirect:/";
			}
		} else {
			return "redirect:/login";
		}
	}

	private boolean isValidRedirect(String destination) {
		return destination != null && destination.startsWith("http://localhost");
	}

	@RequestMapping(path="/logout", method=RequestMethod.POST)
	public String logout(Map<String, Object> model, HttpSession session) {
		model.remove("currentUser");
		session.removeAttribute("currentUser");
		session.invalidate();  //kill the object in the session
		return "redirect:/";
	}
}

