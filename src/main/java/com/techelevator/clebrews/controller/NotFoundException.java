package com.techelevator.clebrews.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

//When there is no content
@ResponseStatus(code=HttpStatus.NOT_FOUND) //Not Found
public class NotFoundException extends Exception {

}
