package com.skilldistillery.nationalparks.controllers;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.nationalparks.data.*;
import com.skilldistillery.nationalparks.entities.*;

@Controller
public class SightingController {

	@Autowired
	private SightingDAO dao;
	@Autowired
	private WildFlowerDAO flowerDAO;
	@Autowired
	private AnimalDAO animalDAO;
	
	
	@RequestMapping(path="getSighting.do")
	public String showSighting(@RequestParam("sid") Integer sightingId, Model model, Sighting sighting) {
		Sighting appearance = dao.findById(sightingId);
		model.addAttribute("sighting", appearance);
		if (appearance.getWildFlowers().size() > 0) {
		model.addAttribute("flower", appearance.getWildFlowers().get(0));
	}	else if (appearance.getAnimals().size() > 0) {
		model.addAttribute("animal", appearance.getAnimals().get(0));
	} else {
			model.addAttribute("errorMsg", "Sorry, no sightings that day");
		}
		return "sighting/show";
	}
	
	@RequestMapping(path="getSightingAdd.do")
	public ModelAndView addNewSighting() {
		ModelAndView model = new ModelAndView();
		model.addObject("animals", animalDAO.findAll());
		model.addObject("flowers", flowerDAO.findAll());
		model.setViewName("sighting/add");
		return model;
	}
	
//	@RequestMapping(path="newSighting.do")
//	public ModelAndView displayUpdatedSighting(@RequestParam("sid") Integer id, 
//			@RequestParam("sighting") String sighting, Date dateSeen, ModelAndView model) {
//		
//		model.addObject())
//		return model;
//	}
	
	@RequestMapping(path="getUpdatedSighting.do")
	public String updateSighting(@RequestParam("sid") Integer sightingId, Model model, Sighting sighting) {
		
		model.addAttribute("sighting", dao.findById(sightingId));
		
		return "sighting/update";
	}
	
	@RequestMapping(path="displayUpdatedSighting.do", method = RequestMethod.POST)
	public ModelAndView displayUpdatedSighting(
			@RequestParam("sid") Integer id,
			@RequestParam("dateSeen") @DateTimeFormat(pattern = "yyyy-MM-dd") Date date) {

		Sighting oldSighting = dao.findById(id);
		oldSighting.setDateSeen(date);
		Sighting updatedSighting = dao.updateSighting(oldSighting);
		
		ModelAndView model = new ModelAndView();
		model.addObject("sighting", updatedSighting);
		model.setViewName("sighting/show");
		return model;
		
	}
	
	@RequestMapping(path="deleteSighting.do")
	public String deleteSighting(@RequestParam("sid") Integer id, Model model) {
		dao.deleteSighting(id);
		List<Sighting> sightings = dao.findAll();
		List<WildFlower> wildFlowers = flowerDAO.findAll();
		List<Animal> animals = animalDAO.findAll();
		model.addAttribute("sightings", sightings);
		model.addAttribute("wildFlowers", wildFlowers);
		model.addAttribute("animals", animals);
		
		return "index";
	}
	
}
