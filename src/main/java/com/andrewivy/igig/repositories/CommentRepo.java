package com.andrewivy.igig.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.andrewivy.igig.models.Comment;

public interface CommentRepo extends CrudRepository<Comment, Long>{

	List<Comment> findAll();
}
