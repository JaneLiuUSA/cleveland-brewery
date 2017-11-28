package com.techelevator.clebrews.model;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

public class Review {
	private long id;
	
	@NotBlank
	private String subject;
	
	@NotBlank
	private String description;
	@NotNull
	@Min(value = 0, message="Rating must be between 1 and 5")
	@Max(value = 5, message="Rating must be between 1 and 5")
	private int rating;
	
	private LocalDateTime createTime;
	
	@NotNull
	private long beerId;
	private long userId;
	
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public long getBeerId() {
		return beerId;
	}
	public void setBeerId(long beerId) {
		this.beerId = beerId;
	}
	public LocalDateTime getCreateTime() {
		
		return createTime;
	}
	
	public Date getCreateTimeAsDate() {
		Instant instant = createTime.toInstant(ZoneOffset.of("-5"));
		return Date.from(instant);
	}
	
	public void setCreateTime(LocalDateTime createTime) {
		this.createTime = createTime;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	
	
	public String getFormatDateTime(){
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formatDateTime = createTime.format(formatter);
        
		return formatDateTime;
	}
	
	
	
}
