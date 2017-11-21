package com.techelevator.clebrews.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;


// When the user is not authorized, then send back 401 
@ResponseStatus(code=HttpStatus.UNAUTHORIZED) //UNAUTHORIZED
public class NotAllowedException extends Exception {
	
	
	
	
}
