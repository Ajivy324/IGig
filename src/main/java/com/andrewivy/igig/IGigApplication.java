package com.andrewivy.igig;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@SpringBootApplication
@Controller
public class IGigApplication {

	public static void main(String[] args) {
		SpringApplication.run(IGigApplication.class, args);
	}
	
	@GetMapping("")
	public String index() {
		return "redirect:/users";
	}

}
