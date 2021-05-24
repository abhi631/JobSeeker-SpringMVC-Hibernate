package com.spring.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.SystemEnvironmentPropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.ApplyForJob;
import com.spring.model.JobDescription;
import com.spring.model.User;
import com.spring.model.UserJobDesc;
import com.spring.repositary.UserDao;

@Controller
public class UserController {

	@Autowired
	private UserDao userdao;
	public UserDao getUserdao() {
		return userdao;
	}
	public void setUserdao(UserDao userdao) {
		this.userdao = userdao;
	}

	@PostMapping("loginUser")
	public ModelAndView loginUser(@ModelAttribute("email") String email,@ModelAttribute("password") String pass,HttpSession session){
		ModelAndView mv = new ModelAndView();
		User user=userdao.getUser(email);
		if(user != null){
			if(user.getPassword().equals(pass)){
				session.setAttribute("user",user);
				mv.addObject("user", user);
				if(user.getType().equals("JobProvider")){
					mv.setViewName("addJob");
				}
				else{
					mv.setViewName("redirect:/showJobs");
				}
			}else{
				mv.addObject("msg","Try again ! Wrong Password");
				mv.setViewName("login");
			}
		}else{
			mv.addObject("msg","Try again ! Wrong Email ");
			mv.setViewName("login");
		}
		
		return mv;
	}

	@RequestMapping("/Userregesteration")
	public ModelAndView regesterUser(User user,HttpSession session,MultipartFile myfile,HttpServletRequest req){
		uplod(myfile,req);
		user.setProfilepic(myfile.getOriginalFilename());
		ModelAndView mv=new ModelAndView();
		session.setAttribute("user",user);
		int setUser = userdao.setUser(user);
		if(setUser == 1){
			if(("JobProvider").equals(user.getType())){
				mv.setViewName("redirect:/addJob");
			}
			else{
				mv.setViewName("addSkils");
			}
		}else{
			mv.setViewName("error");
		}	
		return mv;
	}
	
	
	private void uplod(MultipartFile myfile,HttpServletRequest req){

		String projectloc=req.getServletContext().getRealPath("/")+myfile.getOriginalFilename();
		File folder=new File(projectloc,"img");
		folder.mkdir();
		try{
		byte[] data=myfile.getBytes();
		FileOutputStream fos=new FileOutputStream(projectloc);
		System.out.println(projectloc);
		fos.write(data);
		fos.close();
		
		}catch (Exception e) {
			System.out.println(e);
		}
	}
	
	
	
//********Job Taker *******************************************************************************	
	@PostMapping("/postJobDesc")
	public ModelAndView postJobDesc(UserJobDesc userJobDesc,HttpSession session){
		ModelAndView mv=new ModelAndView();
		User user=(User) session.getAttribute("user");
		userJobDesc.setUser(user);
		userdao.userJobDesc(userJobDesc);
		mv.addObject("msg","Job Desctiption Added Succesfully");
		mv.setViewName("redirect:/showJobs");
		return mv;
	}
	
	
	@RequestMapping("/showJobs")
	public ModelAndView showjobs(HttpSession session){
		ModelAndView mv=new ModelAndView();
		User user = (User)session.getAttribute("user");
		System.out.println(user.getEmail());
		UserJobDesc userDesc = userdao.getUserDesc(user);
		String tech=userDesc.getTech();
		List<JobDescription> list=userdao.findJobs(tech);
		List<ApplyForJob> applyforjob=userdao.getApplieJobs(userDesc);
		mv.addObject("joblist",applyforjob);
		mv.addObject("list", list);
		mv.setViewName("showJobs");
		return mv;
	}
	
	
	@PostMapping("/applyForJob")
	public ModelAndView applyForJob(@ModelAttribute("id") String Id,HttpSession session){
		ModelAndView mv=new ModelAndView();
		ApplyForJob afj=new ApplyForJob();
		int id=Integer.parseInt(Id);
		JobDescription jd=(JobDescription)userdao.getJobDescription(id);
		User user=(User)session.getAttribute("user");
		UserJobDesc userjobdesc=userdao.getUserDesc(user);
		List<ApplyForJob> list=userdao.getApplieJobs(userjobdesc);
		for (ApplyForJob applyForJob : list) {
			if(jd.getId()==applyForJob.getJobprovider().getId()){
				mv.setViewName("redirect:/showJobs");
				return mv;
			}
		}
		
		afj.setJobprovider(jd);
		afj.setJobtaker(userjobdesc);
		
		userdao.applyForJob(afj);
		mv.setViewName("redirect:/showJobs");
		return mv;
	}
	
	@PostMapping("updateUser")
	public ModelAndView updateUser(HttpSession session,
			@ModelAttribute("jobpackage") String jobpackage,
			@ModelAttribute("tech") String tech,
			@ModelAttribute("sgpa") Double sgpa,
			@ModelAttribute("jobPlace") String jobPlace){
		ModelAndView mv=new ModelAndView();
		User user=(User) session.getAttribute("user");
		UserJobDesc userDesc = userdao.getUserDesc(user);
		userDesc.setJobpackage(jobpackage);
		userDesc.setTech(tech);
		userDesc.setSgpa(sgpa);
		userDesc.setJobPlace(jobPlace);
		
		userdao.updateUser(userDesc);
		mv.setViewName("redirect:/showJobs");
		return mv;
	}
	
	
//********************Job Provider*********************************************************************

	
	

	@PostMapping("/postjob")
	public ModelAndView addjob(JobDescription jd,HttpSession session){
		ModelAndView mv=new ModelAndView();
		User user=(User) session.getAttribute("user");
		jd.setUser(user);
		userdao.addjob(jd);
		mv.addObject("msg","Job Desctiption Added Succesfully");
		mv.setViewName("addJob");
		return mv;
	}
	
	
	
	@GetMapping("/addedJobs")
	public ModelAndView addedJobs(HttpSession session){
		ModelAndView mv=new ModelAndView();
		User user=(User)session.getAttribute("user");
		List<JobDescription> jobs = userdao.getJobs(user);
		mv.addObject("list",jobs);
		mv.setViewName("addedJobs");
		return mv;
	}
	

		
	
	@RequestMapping("/deleteJob")
	public ModelAndView deletejob(JobDescription jd,HttpSession session){
		ModelAndView mv = new ModelAndView();
		jd.setUser((User)session.getAttribute("user"));
		userdao.delete(jd);
		mv.setViewName("redirect:/addedJobs");
		return mv;
	}
	
	@RequestMapping("/getApplicants")
	public ModelAndView getApplicants(HttpSession session){
		ModelAndView mv = new ModelAndView();
		List<ApplyForJob> list=(List<ApplyForJob>)applicants(session);
		mv.addObject("list",list);
		mv.setViewName("showApplicants");
		for(ApplyForJob l : list){
			System.out.println(l.getJobtaker().getUser().getName());
		}
		return mv;
	}
	 
	private List<ApplyForJob> applicants(HttpSession session){
		User user=(User)session.getAttribute("user");
		List<ApplyForJob> list  = new ArrayList();
		List<JobDescription> jobdesc=userdao.getJobs(user);
		for(JobDescription j:jobdesc){
			List<ApplyForJob> list1=userdao.getApplicants(j);
			for(ApplyForJob afj : list1){
				System.out.println(afj.getJobtaker().getUser().getName());
				list.add(afj);
			}
		}
		System.out.println("done");
		return list;
	}
	
	@GetMapping("/sortedlist")
	public ModelAndView getSortedList(@ModelAttribute("sgpa") String sgpa,HttpSession session){
		ModelAndView mv=new ModelAndView();
		double marks=Double.valueOf(sgpa);
		List<ApplyForJob> sortedlist=new ArrayList<ApplyForJob>();
		List<ApplyForJob> list=(List<ApplyForJob>)applicants(session);
		for(ApplyForJob afb:list){
			if(afb.getJobtaker().getSgpa()>=marks){
				sortedlist.add(afb);
			}
		}
		mv.addObject("list",sortedlist);
		mv.setViewName("showApplicants");
		return mv;
	}
	
	
	
}
