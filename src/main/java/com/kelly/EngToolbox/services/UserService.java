package com.kelly.EngToolbox.services;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kelly.EngToolbox.models.User;
import com.kelly.EngToolbox.repositories.UserRepository;

@Service
public class UserService{
	@Autowired
	private UserRepository uRepo;
	
	//create
	public User registerUser(User user) {
		String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hashed);
		return uRepo.save(user);
	}
	//authenticate user
	public boolean authenticateUser(String email, String password) {
		User u = uRepo.findByEmail(email);
		if (u==null) {
			System.out.println("user retured null");
			return false;
		}
		else {
			if(BCrypt.checkpw(password, u.getPassword())) {
				return true;
			}
			else {
				System.out.println("check pw returned false");
				return false;
			}
		}
	}
	//find users
	public User findUserById(Long id) {
		return uRepo.findById(id).orElse(null);
	}
	public User findUserByEmail(String email) {
		return uRepo.findByEmail(email);
	}
	
	//delete
}