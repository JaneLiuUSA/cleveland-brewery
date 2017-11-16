package com.techelevator.clebrews.model;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

public class User {
	private String userName;
	@Min(value=8, message="Password too short, must be at least 8 characters")
	@Pattern.List({
	@Pattern(regexp="[A-Z]", message="Must have a capital"),
	@Pattern(regexp="[a-z]", message="Must have a lowercase"),
	@Pattern(regexp="[0-9]", message="Must have a number")
	})
	@NotNull(message="You must have a password")
	private String password;
	private String confirmPassword;
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
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

}
