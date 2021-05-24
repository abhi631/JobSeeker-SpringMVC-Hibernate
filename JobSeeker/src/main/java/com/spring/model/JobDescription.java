package com.spring.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class JobDescription {

	@Id
	@GeneratedValue
	private int id;
	private String jobPlace;
	private String location;
	private String tech;
	private String jobpackage;
	@ManyToOne
	private User user;
	
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getJobPlace() {
		return jobPlace;
	}
	public void setJobPlace(String jobPlace) {
		this.jobPlace = jobPlace;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getTech() {
		return tech;
	}
	public void setTech(String tech) {
		this.tech = tech;
	}
	public String getJobpackage() {
		return jobpackage;
	}
	public void setJobpackage(String jobpackage) {
		this.jobpackage = jobpackage;
	}
	public JobDescription() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
