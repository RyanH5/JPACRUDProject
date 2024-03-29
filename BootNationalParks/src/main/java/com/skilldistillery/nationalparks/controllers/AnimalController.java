package com.skilldistillery.nationalparks.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.nationalparks.data.AnimalDAO;
import com.skilldistillery.nationalparks.data.SightingDAO;
import com.skilldistillery.nationalparks.data.WildFlowerDAO;
import com.skilldistillery.nationalparks.entities.Animal;
import com.skilldistillery.nationalparks.entities.Sighting;
import com.skilldistillery.nationalparks.entities.WildFlower;

@Controller
public class AnimalController {
	@Autowired
	private AnimalDAO dao;
	@Autowired
	private WildFlowerDAO dao2;
	@Autowired
	private SightingDAO dao3;
	
	@RequestMapping(path= {"/", "goHome.do"})
	public String index(Model model) {
		List<Animal> Animals = dao.findAll();
		List<WildFlower> flowers = dao2.findAll();
		List<Sighting> sightings = dao3.findAll();
		model.addAttribute("wildFlowers", flowers);
		model.addAttribute("animals", Animals);
		model.addAttribute("sightings", sightings);
		System.out.println(model);
	  return "index";
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
	public String showNewAnimal(Animal animal, Model model) {
		Animal newAnimal = dao.addNewAnimal(animal);
		model.addAttribute("animal", newAnimal);
		return "animal/show";
	}
	
	@RequestMapping(path = "getUpdatedAnimal.do")
	public String updateAnimal(@RequestParam("aid") Integer id, Model model) {
		
		model.addAttribute("animal", dao.findById(id));
		return "animal/update";
	}

	@RequestMapping(path = "displayUpdatedAnimal.do", method = RequestMethod.POST)
	public ModelAndView displayUpdatedAnimal(Animal a) {
		Animal updated = dao.updateAnimal(a);
		ModelAndView model = new ModelAndView();
		model.addObject("animal", updated);
		model.setViewName("animal/show");
		return model;
	}
	
	@RequestMapping(path="getDeletedAnimal.do")
	public String deleteAnimal(@RequestParam("aid") Integer id, Model model) {
		dao.deleteAnimal(id);
		List<Animal> animals = dao.findAll();
		List<WildFlower> flowers = dao2.findAll();
		List<Sighting> sightings = dao3.findAll();
		model.addAttribute("animals", animals);
		model.addAttribute("wildFlowers", flowers);
		model.addAttribute("sightings", sightings);
		return "index";
	}
	
		
	

}