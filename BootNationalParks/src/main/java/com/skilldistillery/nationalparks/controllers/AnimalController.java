package com.skilldistillery.nationalparks.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.nationalparks.data.AnimalDAO;
import com.skilldistillery.nationalparks.entities.Animal;

@Controller
public class AnimalController {
	@Autowired
	private AnimalDAO dao;
	
	@RequestMapping(path="/")
	public String index(Model model) {
		List<Animal> Animals = dao.findAll();
		model.addAttribute("Animals", Animals);
	  return "WEB-INF/index.jsp";
	}
	
	public String showAnimal() {
		return "WEB-INF/Animal/index.jsp";
	}
	
	@RequestMapping(path="getAnimal.do")
	public String showAnimal(@RequestParam("fid") Integer AnimalId, Model model) {
		Animal Animal = dao.findById(AnimalId);
		model.addAttribute("Animal", Animal);
		return "WEB-INF/Animal/show.jsp";
	}
	

}