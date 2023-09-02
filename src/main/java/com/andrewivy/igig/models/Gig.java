package com.andrewivy.igig.models;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.FutureOrPresent;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="gigs")
public class Gig {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	@Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
    
    @NotBlank(message="Name is required!")
    @Size(min=3, max=30, message="Name must be between 3 and 30 characters")
    private String name;
    
    @NotBlank(message="Location is required!")
    @Size(min=2, max=30, message="Location must be between 2 and 30 characters")
    private String location;
    
    @NotNull(message="Date is required")
    @FutureOrPresent(message="date must not be in the past")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date gigDate;
    
    @NotBlank(message="Field is required!")
    @Size(min=3, max=100, message="Field must be at least 3 characters")
    private String gigInfo;
    
    @NotNull(message="Field is required!")
    @Min(1)
    private Integer size;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="creator_id")
    private User creator;
    
  @ManyToMany(fetch = FetchType.LAZY)
  @JoinTable(
          name = "user_gigs", 
          joinColumns = @JoinColumn(name = "gig_id"), 
          inverseJoinColumns = @JoinColumn(name = "user_id")
      )
      private List<User> gigMusicians;
    
//    @OneToMany(mappedBy="gig", fetch = FetchType.LAZY)
//    private List<Comment> gigComments;
    
	public Gig() {
		
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Date getGigDate() {
		return gigDate;
	}
	public void setGigDate(Date gigDate) {
		this.gigDate = gigDate;
	}
	public String getGigInfo() {
		return gigInfo;
	}
	public void setGigInfo(String gigInfo) {
		this.gigInfo = gigInfo;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	public User getCreator() {
		return creator;
	}
	public void setCreator(User creator) {
		this.creator = creator;
	}
	public List<User> getGigMusicians() {
		return gigMusicians;
	}
	public void setGigMusicians(List<User> gigMusicians) {
		this.gigMusicians = gigMusicians;
	}
	
    
}
