package com.kelly.EngToolbox.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.kelly.EngToolbox.models.Calculator;
import com.kelly.EngToolbox.services.CalculatorService;
/*
 * This controler's main function is for the view to post form data for use in calculations
 * Make a fat model, atr of topic and then an atr for each variable that would be input into any equation on the website,
 * make a constructor for each equation used?
 */
@Controller
public class CalcController{
	
	@Autowired
	private CalculatorService cServ;
	
	@PostMapping("/PhysicsCalculate")
	public String calculate(@Valid @ModelAttribute("calc") Calculator calc, BindingResult result, HttpSession session) {
		//form must send equation string which will tell the service which equation to run
		//Service creates JSONObject of answers for equations on physics page
		//JSONObject ans = this.cServ.physics(calc.getV0(), calc.getTheta());
		//Get answer to Time to max height - stored in "time" key
		//Add answers to physics page
		session.setAttribute("time", 10);
		return "redirect:/physics";
	}
}