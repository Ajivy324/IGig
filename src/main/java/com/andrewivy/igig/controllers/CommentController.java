package com.andrewivy.igig.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.andrewivy.igig.services.CommentService;
import com.andrewivy.igig.services.GigService;
import com.andrewivy.igig.services.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/comments")
public class CommentController {
	
	@Autowired
	private CommentService CommentService;
	
	
	@GetMapping("/delete/{commentId}")
	public String delete(@PathVariable("commentId") Long commentId, Model viewmodel, HttpSession session) {
		this.CommentService.delete(commentId);
		return "redirect:/gigs" ;
	}
}
