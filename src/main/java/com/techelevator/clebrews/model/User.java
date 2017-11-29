package com.techelevator.clebrews.model;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

public class User {
	private long id;
	@NotBlank(message="Username cannnot be blank")
	private String userName;
	
	@Size(min=8, message="Password too short, must be at least 8 characters")
	@NotBlank(message="You must have a password")
	@Pattern.List({
	@Pattern(regexp="^.*[A-Z].*$", message="Must have a capital"),
	@Pattern(regexp="^.*[a-z].*$", message="Must have a lowercase"),
	@Pattern(regexp="^.*[0-9].*$", message="Must have a number")
	})
	private String password;
	
	@NotBlank(message="Email cannot be blank")
	@Email(message="Must be a valid email address")
	private String email;
	private long roleId;
	
	private boolean active = false;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public long getRoleId() {
		return roleId;
	}
	public void setRoleId(long roleId) {
		this.roleId = roleId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean isActive) {
		this.active = isActive;
	}

}
