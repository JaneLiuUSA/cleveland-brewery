package com.techelevator.clebrews.model;

import javax.validation.constraints.NotNull;

public class Brewery {

	private int id;
	@NotNull(message="required")
	private String name;
	@NotNull(message="required")
	private String address;
	@NotNull(message="Address is required")
	private String city;
	@NotNull(message="Zipcode is required")
	private String zipcode;
	@NotNull(message="required")
	private String description;
	private String imgUrl;
	private String websitieUrl;
	private String businessHour;
	
	
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


	public String getLocation() {
		return address;
	}


	public void setLocation(String location) {
		this.address = location;
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


	public String getWebsitieUrl() {
		return websitieUrl;
	}


	public void setWebsitieUrl(String websitieUrl) {
		this.websitieUrl = websitieUrl;
	}


	public String getBusinessHour() {
		return businessHour;
	}


	public void setBusinessHour(String businessHour) {
		this.businessHour = businessHour;
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
	
	
	
	
	
}
