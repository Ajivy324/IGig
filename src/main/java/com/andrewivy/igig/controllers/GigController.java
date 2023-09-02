package com.andrewivy.igig.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.andrewivy.igig.models.Comment;
import com.andrewivy.igig.models.Gig;
import com.andrewivy.igig.models.User;
import com.andrewivy.igig.services.CommentService;
import com.andrewivy.igig.services.GigService;
import com.andrewivy.igig.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/gigs")
public class GigController {
	
	@Autowired
	private UserService UserService;
	
	@Autowired
	private GigService GigService;
	
	@Autowired
	private CommentService CommentService;
	
	@GetMapping("")
	public String home(Model viewmodel,HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		viewmodel.addAttribute("Gigs", this.GigService.allGigs());
    	Long userId = (Long) session.getAttribute("userId");
    	User currentUser = this.UserService.findUser((long) session.getAttribute("userId"));
    	viewmodel.addAttribute("currentUser", this.UserService.findUser(userId));
    	viewmodel.addAttribute("NotJoinedGigs", this.GigService.getAllWithoutUser(currentUser));
		return "dashboard.jsp";
	}
	
	@GetMapping("/new")
	public String addGig(@ModelAttribute("newGig") Gig newGig, Model viewmodel,
			HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		
		User user = UserService.findUser((Long) session.getAttribute("userId"));
		viewmodel.addAttribute("user", user);
		return "createGig.jsp";
	}
	
	@PostMapping("/new")
	public String createGig(@Valid @ModelAttribute("newGig")  Gig newGig,
			BindingResult result, Model viewmodel, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		if (result.hasErrors()) {
			System.out.println(result);
			
			return "createGig.jsp";
		} else {
			
			
			this.GigService.createGig(newGig, this.UserService.findUser((long) session.getAttribute("userId")));
		return "redirect:/gigs";
		}
	}
	
	@GetMapping("/{gigId}")
	public String show(Model viewmodel,
			@ModelAttribute("newComment") Comment newComment,
			@PathVariable("gigId") Long gigId,
			HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		viewmodel.addAttribute("gig", this.GigService.findGig(gigId));
		Long userId = (Long) session.getAttribute("userId");
    	viewmodel.addAttribute("currentUser", this.UserService.findUser(userId));
    	viewmodel.addAttribute("gigComments", this.CommentService.allComments());
		return "showGig.jsp";
	}
	
	@PostMapping("comment/{gigId}")
	public String createComment(@Valid @ModelAttribute("newComment") Comment newComment,
			BindingResult result,
			Model viewmodel, 
			HttpSession session,
			@PathVariable("gigId") Long gigId) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		if (result.hasErrors()) {
			viewmodel.addAttribute("gig", this.GigService.findGig(gigId));
			viewmodel.addAttribute("gigComments", this.CommentService.allComments());
			return "showGig.jsp";
		}else {
			User currentUser = this.UserService.findUser((long) session.getAttribute("userId"));
			CommentService.createComment(newComment, currentUser,  this.GigService.findGig(gigId));
			return "redirect:/gigs/{gigId}";
		}
	}
	
	@GetMapping("/edit/{gigId}")
	public String editGig(@PathVariable("gigId") Long gigId, Model viewmodel, HttpSession session ) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		Long userId = (Long) session.getAttribute("userId");
		User currentUser = this.UserService.findUser((long) session.getAttribute("userId"));
		viewmodel.addAttribute("currentUser", this.UserService.findUser(userId));
		viewmodel.addAttribute("editedGig", this.GigService.findGig(gigId));
		return "editGig.jsp";
	}
	
	@PutMapping("/edit/{id}")
	public String updateGig(@Valid @ModelAttribute("editedGig") Gig editedGig,
			BindingResult result, Model viewmodel, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		if (result.hasErrors()) {
			viewmodel.addAttribute("gig", editedGig);
			return "editGig.jsp";
		} else {
			this.GigService.updateGig(editedGig, this.UserService.findUser((long) session.getAttribute("userId")));
			return "redirect:/gigs";
		}
	}
	
	@GetMapping("/delete/{gigId}")
	public String delete(@PathVariable("gigId") Long gigId) {
		this.GigService.delete(gigId);
		return "redirect:/gigs";
	}
	
	@GetMapping("/join/{gigId}")
	public String joinGig(@PathVariable("gigId")Long gigId, HttpSession session) {
		Long currentUserId = (Long)session.getAttribute("userId");
		if (currentUserId == null) {
			return "redirect:/";
		}
		this.GigService.joinGig(this.GigService.findGig(gigId), this.UserService.findUser(currentUserId));
		return "redirect:/gigs";
	}

	@GetMapping("/quit/{gigId}")
	public String quitGig(@PathVariable("gigId")Long gigId, HttpSession session) {
		Long currentUserId = (Long)session.getAttribute("userId");
		if (currentUserId == null) {
			return "redirect:/";
		}
		this.GigService.unjoinGig(this.GigService.findGig(gigId), this.UserService.findUser(currentUserId));
		return "redirect:/gigs";
	}
}
