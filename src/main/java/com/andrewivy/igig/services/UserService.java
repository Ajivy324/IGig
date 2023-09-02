package com.andrewivy.igig.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.andrewivy.igig.models.User;
import com.andrewivy.igig.repositories.UserRepo;
import com.andrewivy.igig.validators.LoginValidator;



@Service
public class UserService {
	
	@Autowired
	private UserRepo userRepo;
	
	public User findUser(Long id) {
		return this.userRepo.findById(id).orElse(null);
	}
	
    // This method will be called from the controller
    // whenever a user submits a registration form.
    
    public User register(User newUser, BindingResult result) {
    
    	// TO-DO - Reject values or register if no errors:
    	Optional<User> potentialUser = userRepo.findByEmail(newUser.getEmail());
    	
        // Reject if email is taken (present in database)
    	if(potentialUser.isPresent()) {
    		result.rejectValue("email", "Matches", "Username not available!");
    	}
        // Reject if password doesn't match confirmation
        if(!newUser.getPassword().equals(newUser.getConfirm())) {
        	result.rejectValue("confirm", "Matches", "Your Passwords don't match!");
        }
        // Return null if result has errors
        if(result.hasErrors()) {
        	return null;
        }
        // Hash and set password, save user to database
        String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hashed);
        return this.userRepo.save(newUser); 
    }
    
    public User login(LoginValidator newLoginObject, BindingResult result) {
        // TO-DO - Reject values:
        
    	// Find user in the DB by email
        // Reject if NOT present
    	Optional<User> potentialUser = userRepo.findByEmail(newLoginObject.getEmail());
    	if(potentialUser.isPresent()) {
    		User user = potentialUser.get();
    		if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
        	    result.rejectValue("email", "Matches", "Invalid Credentials!");
        	}
    		return user;
    	}else {
        // Reject if BCrypt password match fails
    		result.rejectValue("email", "Matches", "Invalid Credentials!");
    	    	
    		return null;
    	}

    }
}
