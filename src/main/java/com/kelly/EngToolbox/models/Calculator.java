package com.kelly.EngToolbox.models;

public class Calculator{
	//Set different variables as atrs for all equations on site
	
	private int v0;
	private int theta;
	private String equation;
	
	
	public Calculator(){
		//Pojo
	}
	
	public Calculator(int v0, int theta) {
		//Physics projectile motion
		
		this.theta = theta;
		this.v0 = v0;
	}
	
	
	public int getV0() {
		return v0;
	}



	public void setV0(int v0) {
		this.v0 = v0;
	}



	public int getTheta() {
		return theta;
	}



	public void setTheta(int theta) {
		this.theta = theta;
	}



	public String getEquation() {
		return equation;
	}



	public void setEquation(String equation) {
		this.equation = equation;
	}



}