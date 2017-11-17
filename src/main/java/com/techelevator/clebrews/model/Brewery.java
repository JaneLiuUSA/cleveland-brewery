package com.techelevator.clebrews.model;

public class Brewery {

	private int id;
	private String name;
<<<<<<< HEAD
	@NotNull(message="required")
	private String address;
	@NotNull(message="Address is required")
	private String city;
	@NotNull(message="Zipcode is required")
	private String zipcode;
	@NotNull(message="required")
=======
	private String address;
	private String city;
	private int zipcode;
>>>>>>> f8aef1c014a5aaa76adbf830fd9676ae85594180
	private String description;
	private String imgUrl;
	private String websitieUrl;
	private String businessHour;
	private int userId;
	
<<<<<<< HEAD
	
	public Brewery(String name, String location, String description) {
		this.name = name;
		this.address = location;
		this.description = description;
	}

=======
>>>>>>> f8aef1c014a5aaa76adbf830fd9676ae85594180

	
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


<<<<<<< HEAD
	public String getLocation() {
		return address;
	}


	public void setLocation(String location) {
		this.address = location;
	}
=======
>>>>>>> f8aef1c014a5aaa76adbf830fd9676ae85594180


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


<<<<<<< HEAD
=======
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


>>>>>>> f8aef1c014a5aaa76adbf830fd9676ae85594180
	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


<<<<<<< HEAD
	public String getZipcode() {
=======
	public int getZipcode() {
>>>>>>> f8aef1c014a5aaa76adbf830fd9676ae85594180
		return zipcode;
	}


<<<<<<< HEAD
	public void setZipcode(String zipcode) {
=======
	public void setZipcode(int zipcode) {
>>>>>>> f8aef1c014a5aaa76adbf830fd9676ae85594180
		this.zipcode = zipcode;
	}
	
	
	
	
	
}
