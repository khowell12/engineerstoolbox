package com.kelly.EngToolbox.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kelly.EngToolbox.models.Discussion;
import com.kelly.EngToolbox.models.User;
import com.kelly.EngToolbox.services.DiscussionService;
import com.kelly.EngToolbox.services.UserService;

@Controller
public class HomeController{
	@Autowired
	private UserService uService;
	@Autowired
	private DiscussionService discServ;
	
	@RequestMapping("/")
	public String home(HttpSession session, Model viewModel, User user) {
		if (session.getAttribute("user_id")!= null ) {
			User u = uService.findUserById((Long) session.getAttribute("user_id"));
			viewModel.addAttribute("user", u);
			}
		return "home.jsp";
	}
	@RequestMapping("/physics")
	public String physics(@ModelAttribute("discussion") Discussion disc, HttpSession session, Model viewModel, User user) {
		if (session.getAttribute("user_id")!= null ) {
			User u = uService.findUserById((Long) session.getAttribute("user_id"));
			viewModel.addAttribute("user", u);
		}
			viewModel.addAttribute("topic", "physics");
			viewModel.addAttribute("discussions", this.discServ.findAllDiscussionbyTopic("physics"));
		
		return "physics.jsp";
	}

	@RequestMapping("/projectile-motion")
	public String proMo() {
		return "ProjectileMotion.jsp";
	}
	@RequestMapping("/electricity")
	public String electricity(@ModelAttribute("discussion") Discussion disc, HttpSession session, Model viewModel, User user) {
		if (session.getAttribute("user_id")!= null ) {
			User u = uService.findUserById((Long) session.getAttribute("user_id"));
			viewModel.addAttribute("user", u);
		}
			viewModel.addAttribute("topic", "electricity");
			viewModel.addAttribute("discussions", this.discServ.findAllDiscussionbyTopic("electricity"));
		
		return "electricity.jsp";
	}
	@RequestMapping("/thermodynamics")
	public String thermo(@ModelAttribute("discussion") Discussion disc, HttpSession session, Model viewModel, User user) {
		if (session.getAttribute("user_id")!= null ) {
			User u = uService.findUserById((Long) session.getAttribute("user_id"));
			viewModel.addAttribute("user", u);
		}
			viewModel.addAttribute("topic", "thermodynamics");
			viewModel.addAttribute("discussions", this.discServ.findAllDiscussionbyTopic("thermodynamics"));
		
		return "thermo.jsp";
	}
	@RequestMapping("/fluid-mechanics")
	public String fluidMechanics(@ModelAttribute("discussion") Discussion disc, HttpSession session, Model viewModel, User user) {
		if (session.getAttribute("user_id")!= null ) {
			User u = uService.findUserById((Long) session.getAttribute("user_id"));
			viewModel.addAttribute("user", u);
		}
			viewModel.addAttribute("topic", "fluid-mechanics");
			viewModel.addAttribute("discussions", this.discServ.findAllDiscussionbyTopic("fluid-mechanics"));
		
		return "fluids.jsp";
	}
}