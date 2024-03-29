package com.example.demo;

import java.io.File;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.example.demo.controller.UserController;

@SpringBootApplication
public class DemoApplication {

	public static void main(String[] args) {
		 new File(UserController.uploadDirectory).mkdir();
		SpringApplication.run(DemoApplication.class, args);
	}

}
