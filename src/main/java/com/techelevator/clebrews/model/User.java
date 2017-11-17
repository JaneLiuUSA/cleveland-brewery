package com.techelevator.clebrews.model;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

public class User {
	
	private String userName;
	@Size(min=8, message="Password too short, must be at least 8 characters")
	@NotBlank(message="You must have a password")
	@Pattern.List({
	@Pattern(regexp="^.*[A-Z].*$", message="Must have a capital"),
	@Pattern(regexp="^.*[a-z].*$", message="Must have a lowercase"),
	@Pattern(regexp="^.*[0-9].*$", message="Must have a number")
	})
	
	private String password;

	private int roleId;
	
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

	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

}
