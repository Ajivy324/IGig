package com.andrewivy.igig.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.andrewivy.igig.models.User;
import com.andrewivy.igig.services.UserService;
import com.andrewivy.igig.validators.LoginValidator;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/users")
public class UserController {
	
	@Autowired
	private UserService UserService;
	

	@GetMapping("")
	public String index(Model viewModel, 
			@ModelAttribute("newUser") User newUser) {
		viewModel.addAttribute("loginUser", new LoginValidator());
		return "index.jsp";
	}
	
	@PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        
        // TO-DO Later -- call a register method in the service 
        // to do some extra validations and create a new user!
        User nUser = this.UserService.register(newUser, result);
        if(result.hasErrors()) {
            // Be sure to send in the empty LoginUser before 
            // re-rendering the page.
            model.addAttribute("loginUser", new LoginValidator());
            return "index.jsp";
        }
        
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session,
        session.setAttribute("userId", nUser.getId());
        // in other words, log them in.
    
        return "redirect:/gigs";
        
    }
	
	@PostMapping("/login")
    public String login(@Valid @ModelAttribute("loginUser") LoginValidator newLogin, 
            BindingResult result, Model model, HttpSession session) {
        
        // Add once service is implemented:
         User user = UserService.login(newLogin, result);
    
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
        // TO-DO Later: Store their ID from the DB in session, 
        // in other words, log them in.
        session.setAttribute("userId", user.getId());
    
        return "redirect:/gigs";
    }
	
	@GetMapping("/account/{userId}")
	public String showAccount(Model viewmodel, @PathVariable("userId") Long userId, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
    	viewmodel.addAttribute("currentUser", this.UserService.findUser(userId));
		return "accountDetails.jsp";
	}
	
	
	@GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
	
}
