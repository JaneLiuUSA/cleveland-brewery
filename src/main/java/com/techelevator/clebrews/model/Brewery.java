package com.techelevator.clebrews.model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

public class Brewery {

	private int id;
	@NotBlank(message="Name cannot be blank")
	private String name;
	@NotNull(message="required")
	private String address;
	@NotNull(message="Address is required")
	private String city;
	@NotNull(message="Zipcode is required")
	private String zipcode;
	@NotNull(message="required")
	private String phoneNumber;
	@NotNull(message="required")
	private String description;
	private String breweryLogoUrl;
	private String imgUrl;
	private String websiteUrl;
	private String businessHours;
	private int userId;
	
	
	public Brewery(){} //default constructor
	
	public Brewery(String name, String location, String description) {
		this.name = name;
		this.address = location;
		this.description = description;
	}

	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getWebsiteUrl() {
		return websiteUrl;
	}


	public void setWebsiteUrl(String websiteUrl) {
		this.websiteUrl = websiteUrl;
	}


	public String getBusinessHours() {
		return businessHours;
	}


	public void setBusinessHours(String businessHours) {
		this.businessHours = businessHours;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getZipcode() {
		return zipcode;
	}


	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getBreweryLogoUrl() {
		return breweryLogoUrl;
	}

	public void setBreweryLogoUrl(String breweryLogoUrl) {
		this.breweryLogoUrl = breweryLogoUrl;
	}
	
}
