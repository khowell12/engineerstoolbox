package com.kelly.EngToolbox.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import com.kelly.EngToolbox.models.User;
import com.kelly.EngToolbox.repositories.UserRepository;

@Component
public class UserValidator{
	@Autowired
	private UserRepository uRepo;
	
	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}
	
	public void validate(Object target, Errors errors) {
		User user = (User) target;
		
		//Passwords match?
		if(!user.getPasswordConfirmation().equals(user.getPassword())) {
			errors.rejectValue("password", "Match", "Passwords do not match");
		}
		//Check if email exists
		if(uRepo.existsByEmail(user.getEmail())){
			errors.rejectValue("email", "Unique", "Email already exists");
		}
	}
}