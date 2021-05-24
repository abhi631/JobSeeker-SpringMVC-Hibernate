package com.spring.repositary;

import java.io.Serializable;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.ApplyForJob;
import com.spring.model.JobDescription;
import com.spring.model.User;
import com.spring.model.UserJobDesc;

@Repository
public class UserDao {

	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Transactional
	public int setUser(User user){
		int i = 0;
		sessionFactory.getCurrentSession().save(user);
		return i = 1;
	}
	
	@Transactional
	public User getUser(String email) {
		Query q= (Query) sessionFactory.getCurrentSession().createQuery("from User where email=:email");
		 q.setParameter("email" , email);
		 User u=(User) q.uniqueResult();
		return u;
	}

	@Transactional
	public void addjob(JobDescription jd) {
		sessionFactory.getCurrentSession().save(jd);
	}
	
	@Transactional
	public List<JobDescription> getJobs(User user){
		Query q= (Query) sessionFactory.getCurrentSession().createQuery("from JobDescription where user=:user");
		q.setParameter("user", user);
		List<JobDescription> list=q.list();
		return list;
	}

	@Transactional
	public void userJobDesc(UserJobDesc userJobDesc) {
		sessionFactory.getCurrentSession().save(userJobDesc);
		
	}
	
	@Transactional
	public UserJobDesc getUserDesc(User user){
		Query q = sessionFactory.getCurrentSession().createQuery("from UserJobDesc where user=:user");
		q.setParameter("user" ,user);
		UserJobDesc ujd=(UserJobDesc) q.uniqueResult();
		return ujd;
	}

	@Transactional
	public List<JobDescription> findJobs(String tech) {
		Query q = sessionFactory.getCurrentSession().createQuery("from JobDescription where tech=:tech");
		//Query q=sessionFactory.openSession().createQuery("from JobDescription where tech=:tech");
		q.setParameter("tech", tech);
		List<JobDescription> list=q.list();
		return list;
	}

	@Transactional
	public void delete(JobDescription jd) {
		Query q = sessionFactory.getCurrentSession().createQuery("delete from ApplyForJob where jobprovider=:jobprovider");
		q.setParameter("jobprovider",jd);
		q.executeUpdate();
		sessionFactory.getCurrentSession().delete(jd);
	}

	@Transactional
	public JobDescription getJobDescription(int id) {
		Query q = sessionFactory.getCurrentSession().createQuery("from JobDescription where id=:id");
		q.setParameter("id",id);
		JobDescription jd=(JobDescription)q.uniqueResult();
		return jd;
	}
	
	@Transactional
	public void applyForJob(ApplyForJob applyForJob) {
		sessionFactory.getCurrentSession().save(applyForJob);
	}

	
	public List<ApplyForJob> getApplieJobs(UserJobDesc jobtaker) {
		Query q = sessionFactory.openSession().createQuery("from ApplyForJob where jobtaker=:jobtaker");
		q.setParameter("jobtaker",jobtaker);
		List<ApplyForJob> joblist=q.list();
		return joblist;
	}

	@Transactional
	public void updateUser(UserJobDesc userjobdesc) {
		sessionFactory.getCurrentSession().update(userjobdesc);
	}

	@Transactional
	public List<ApplyForJob> getApplicants(JobDescription jobprovider) {
		Query q = sessionFactory.openSession().createQuery("from ApplyForJob where jobprovider=:jobprovider");
		q.setParameter("jobprovider",jobprovider);
		List<ApplyForJob> joblist=q.list();
//		for(ApplyForJob l : joblist){
//			System.out.println(l.getJobtaker().getName());
//		}
		return joblist;
	}
	

	
}
