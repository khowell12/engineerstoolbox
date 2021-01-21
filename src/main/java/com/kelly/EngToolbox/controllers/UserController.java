package com.kelly.EngToolbox.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kelly.EngToolbox.models.User;
import com.kelly.EngToolbox.services.UserService;
import com.kelly.EngToolbox.validators.UserValidator;

@Controller
public class UserController{
	@Autowired
	private UserValidator validator;
	@Autowired
	private UserService uService;
	
	@RequestMapping("/login")
	public String index(@ModelAttribute("user") User user, HttpSession session) {
		if (session.getAttribute("user_id")!= null) {
			return "redirect:/";
		}
		return "loginPage.jsp";
	}
	@PostMapping("/registration")
	public String register(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session, RedirectAttributes redirectAttrs) {
		//check password match and email exist validations
		validator.validate(user, result);
		if(result.hasErrors()) {
			return "loginPage.jsp";
		}
		else {
			//add user to DB and return to home
			User u = uService.registerUser(user);
			session.setAttribute("user_id", u.getId());
			return "redirect:/";
		}
	}
	@PostMapping("/loginUser")
	public String index(@RequestParam("email") String email, @RequestParam("password") String password, Model model, RedirectAttributes redirectAttrs, HttpSession session) {
//		if (session.getAttribute("user_id")!= null) {
//			System.out.println("not null");
//			return "redirect:/";
//			
//		}
		if(!this.uService.authenticateUser(email, password)) {
			redirectAttrs.addFlashAttribute("error", "Invalid credentials");
			System.out.println("not authenticating");
			return "redirect:/login";
		}
		else {
			System.out.println("else");
			User u = uService.findUserByEmail(email);
			session.setAttribute("user_id", u.getId());
			model.addAttribute("user", u);
			return "redirect:/";
		}
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}