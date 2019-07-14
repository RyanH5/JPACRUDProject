package com.skilldistillery.nationalparks.controllers;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.nationalparks.data.SightingDAO;
import com.skilldistillery.nationalparks.entities.*;

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
	}	else if (appearance.getAnimals().size() > 0) {
		model.addAttribute("animal", appearance.getAnimals().get(0));
	} else {
			model.addAttribute("errorMsg", "Sorry, no sightings that day");
		}
		return "sighting/show";
	}
	
	@RequestMapping(path="getSightingAdd.do")
	public String addNewSighting() {
		return "sighting/add";
	}
	
	@RequestMapping(path="getUpdatedSighting.do")
	public String updateSighting(@RequestParam("sid") Integer sightingId, Model model, Sighting sighting) {
		
		model.addAttribute("sighting", dao.findById(sightingId));
		
		return "sighting/update";
	}
	
	@RequestMapping(path="displayUpdatedSighting.do", method = RequestMethod.POST)
	public ModelAndView displayUpdatedSighting(
			@RequestParam("sid") Integer id,
			@RequestParam("dateSeen") @DateTimeFormat(pattern = "yyyy-MM-dd") Date date 
	) {

		Sighting oldSighting = dao.findById(id);
		oldSighting.setDateSeen(date);
		System.out.println("------------------------------------------------------------------");
		Sighting updatedSighting = dao.updateSighting(oldSighting);
		
		ModelAndView model = new ModelAndView();
		model.addObject("sighting", updatedSighting);
		model.setViewName("sighting/show");
		return model;
		
	}
	
}
