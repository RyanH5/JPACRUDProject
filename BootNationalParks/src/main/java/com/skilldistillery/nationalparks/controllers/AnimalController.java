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
		model.addAttribute("animals", Animals);
	  return "index";
	}
	
	public String showAnimal() {
		return "Animal/index";
	}
	
	@RequestMapping(path="getAnimal.do")
	public String showAnimal(@RequestParam("aid") Integer AnimalId, Model model) {
		Animal Animal = dao.findById(AnimalId);
		model.addAttribute("animal", Animal);
		return "animal/show";
	}
	
	@RequestMapping(path = "getAnimalAdd.do")
	public String addAnimal(Model model) {
		return "animal/add";
	}
	
	@RequestMapping(path = "newAnimal.do")
	public String showNewAnimal(@RequestParam("name") String name,
			@RequestParam("description") String description,
			@RequestParam("image") String image, Model model)  {
		model.addAttribute("animal", dao.addNewAnimal(new Animal(name, image, description)));
		
		return "animal/show";
	}
	
	@RequestMapping(path = "getUpdatedAnimal.do")
	public String updateAnimal(@RequestParam("aid") Integer id, Model model) {
		
		model.addAttribute("animal", dao.findById(id));
		return "animal/update";
	}

	@RequestMapping(path = "displayUpdatedAnimal.do")
	public String displayUpdatedAnimal(@RequestParam("aid") Integer id,
			@RequestParam("name") String name,
			@RequestParam("description") String description,
			@RequestParam("image") String image, Model model) {
		model.addAttribute("animal", dao.updateAnimal(id, new Animal(name, description, image)));
		
		return "animal/show";
	}
	
		
	

}