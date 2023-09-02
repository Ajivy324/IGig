package com.andrewivy.igig.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.andrewivy.igig.models.Gig;
import com.andrewivy.igig.models.User;

@Repository
public interface GigRepo extends CrudRepository<Gig, Long> {
	
	List<Gig> findAll();
	List<Gig> findAllByGigMusiciansNotContains(User user);
}
