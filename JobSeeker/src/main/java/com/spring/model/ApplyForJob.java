package com.spring.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class ApplyForJob {

	@Id
	@GeneratedValue
	private int id;
	@ManyToOne
	private UserJobDesc jobtaker;
	@ManyToOne
	private JobDescription jobprovider;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public UserJobDesc getJobtaker() {
		return jobtaker;
	}
	public void setJobtaker(UserJobDesc jobtaker) {
		this.jobtaker = jobtaker;
	}
	public JobDescription getJobprovider() {
		return jobprovider;
	}
	public void setJobprovider(JobDescription jobprovider) {
		this.jobprovider = jobprovider;
	}
	public ApplyForJob() {
		super();
		// TODO Auto-generated constructor stub
	}
}
