package com.skilldistillery.nationalparks.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.nationalparks.data.SightingDAO;
import com.skilldistillery.nationalparks.entities.Sighting;

@Controller
public class SightingController {

	@Autowired
	private SightingDAO dao;
	
	@RequestMapping(path="getSighting.do")
	public String showSighting(@RequestParam("sid") Integer sightingId, Model model, Sighting sighting) {
		System.out.println("====================================================================");
		Sighting appearance = dao.findById(sightingId);
		System.out.println(appearance);
		model.addAttribute("sighting", appearance);
		return "sighting/show";
	}
	
	@RequestMapping(path="getSightingAdd.do")
	public String addNewSighting() {
		return "sighting/add";
	}
	
}
