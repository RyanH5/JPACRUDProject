package com.skilldistillery.nationalparks.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.nationalparks.data.SightingDAO;
import com.skilldistillery.nationalparks.entities.Animal;
import com.skilldistillery.nationalparks.entities.Sighting;
import com.skilldistillery.nationalparks.entities.WildFlower;

@Controller
public class SightingController {

	@Autowired
	private SightingDAO dao;
	
	@RequestMapping(path="getSighting.do")
	public String showSighting(@RequestParam("sid") Integer sightingId, Model model, Sighting sighting) {
		Sighting appearance = dao.findById(sightingId);
		model.addAttribute("sighting", appearance);
		if (appearance.getWildFlowers().size() > 0) {
		model.addAttribute("flower", appearance.getWildFlowers().get(0));
		System.out.println(appearance.getWildFlowers().get(0));
	}	else if (appearance.getAnimals().size() > 0) {
		model.addAttribute("animal", appearance.getAnimals().get(0));
		System.out.println(appearance.getAnimals().get(0));
	} else {
			model.addAttribute("errorMsg", "Sorry, no sightings that day");
		}
		return "sighting/show";
	}
	
	@RequestMapping(path="getSightingAdd.do")
	public String addNewSighting() {
		return "sighting/add";
	}
	
}
