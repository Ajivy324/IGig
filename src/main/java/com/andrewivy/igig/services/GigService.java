package com.andrewivy.igig.services;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.andrewivy.igig.models.Gig;
import com.andrewivy.igig.models.User;
import com.andrewivy.igig.repositories.GigRepo;

@Service
public class GigService {
	
	@Autowired
	private GigRepo GigRepo;
	
	public List<Gig> allGigs() {
		
		return GigRepo.findAll();
	}
	
	public Gig createGig(Gig gig,User user) {
		gig.setCreator(user);
		return GigRepo.save(gig);
	}
	
	public Gig findGig(Long id) {
		Optional<Gig> optionalGig = GigRepo.findById(id);
		if (optionalGig.isPresent()) {
			return optionalGig.get();
		} else {
			return null;
		}
	}
	
	public Gig updateGig(Gig gig,User user) {
		gig.setCreator(user);
		return GigRepo.save(gig);
	}
	
	public void delete(Long id) {
		this.GigRepo.deleteById(id);
	}
	
	public Gig joinGig(Gig gig, User user) {
		gig.getGigMusicians().add(user);
		return this.GigRepo.save(gig);
	}
	
	public void unjoinGig(Gig gig, User user) {
		gig.getGigMusicians().remove(user);
//		gig.getSize().add();
		this.GigRepo.save(gig);
	}
	
	public List<Gig> getAllWithoutUser(User user) {
		
		return this.GigRepo.findAllByGigMusiciansNotContains(user);
	}
	
	
}

