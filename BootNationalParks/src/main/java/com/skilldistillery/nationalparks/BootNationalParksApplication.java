package com.skilldistillery.nationalparks;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class BootNationalParksApplication extends SpringBootServletInitializer {
	@Override
	  protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
	    return application.sources(BootNationalParksApplication.class);
	  }

	public static void main(String[] args) {
		SpringApplication.run(BootNationalParksApplication.class, args);
	}
}
