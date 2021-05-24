package com.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.model.User;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String home(){
		return "index";
	}
	
	
	@RequestMapping("/home")
	public String home(HttpSession session){
		User user = (User)session.getAttribute("user");
		if(("JobProvider").equals(user.getType())){
			return ("redirect:/addJob");
		}else{
			return ("redirect:/showJobs");
		}
	}
	
	
	@RequestMapping("/regester")
	public String regester(){
		return "regester";
	}
	
	
	@RequestMapping("/login")
	public String login(){
		return "index";
	}
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.removeAttribute("user");
		session.invalidate();
		return "redirect:/";
	}
	
	
	@RequestMapping("/updateUserInfo")
	public String updateUserInfo(){
		return "updateUser";
	}
	
	
	@RequestMapping("/addJob")
	public String addjob(){
		return "addJob";
	}
	
}
