package com.kelly.EngToolbox.services;

import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class CalculatorService{
	//This class is to replace the front end calculators which use javascript
	//TODO: calculators for Physics
	//TODO: calculators for Thermo
	//TODO: calculators for Electricity
	//TODO: calculators for Fluid Mech
	
	
	//Physics
	public JSONObject physics(int v0, double theta) {
		//Time to maximum height
		//TODO add validators
		//Use JSONObject to create an array of multiple equation answers
		JSONObject jAns = new JSONObject();
		int timeAns = (int) (v0 * (Math.sin(theta)) / 9.81);
		//int timeAns = 10;
		//System.out.println("time ans from Calc Service: "+timeAns);
		jAns.put("time", timeAns);
		//System.out.println(v0 + theta);
		
		return jAns;
	}
}