package com.spring.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class UserJobDesc {

	@Id
	@GeneratedValue
	private int id;
	private String jobPlace;
	private Double sgpa;
	private String tech;
	private String jobpackage;
	@OneToOne(cascade=CascadeType.ALL)
	private User user;
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
	public Double getSgpa() {
		return sgpa;
	}
	public void setSgpa(Double sgpa) {
		this.sgpa = sgpa;
	}
	public String getTech(){
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
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public UserJobDesc() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
