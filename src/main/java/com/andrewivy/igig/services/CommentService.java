package com.andrewivy.igig.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.andrewivy.igig.models.Comment;
import com.andrewivy.igig.models.Gig;
import com.andrewivy.igig.models.User;
import com.andrewivy.igig.repositories.CommentRepo;

@Service
public class CommentService {
	
	@Autowired
	private CommentRepo CommentRepo;
	
	public List<Comment> allComments() {
		return CommentRepo.findAll();
	}
	
	public Comment createComment(Comment comment, User user,  Gig thisGig) {
		comment.setCreator(user);
		comment.setGig(thisGig);;
		return CommentRepo.save(comment) ;
	}
	
	public Comment findComment(Long id) {
		Optional<Comment> optionalComment = CommentRepo.findById(id);
		if (optionalComment.isPresent()) {
			return optionalComment.get();
		} else {
			return null;
		}
	}
	
	public void delete(Long id) {
		this.CommentRepo.deleteById(id);
	}
}
