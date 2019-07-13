package com.skilldistillery.nationalparks.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.nationalparks.data.WildFlowerDAO;
import com.skilldistillery.nationalparks.entities.WildFlower;

@Controller
public class WildFlowerController {
	
	@Autowired
	private WildFlowerDAO dao;
	
	@RequestMapping(path="getFlower.do")
	public String showFlower(@RequestParam("wfid") Integer FlowerId, Model model, WildFlower wildFlower) {
		WildFlower wf = dao.findById(FlowerId);
		model.addAttribute("flower", wf);
		return "flower/show";
	}
	
	@RequestMapping(path="getUpdatedFlower.do")
	public String updateFlower(@RequestParam("wfid") Integer id, Model model) {
		model.addAttribute("flower", dao.findById(id));
		return "flower/update";
	}
	
//	WHY WAS I UNABLE TO RETURN STRING FROM HERE LIKE W/ ANIMAL
	@RequestMapping(path="displayUpdatedFlower.do", method = RequestMethod.POST)
	public ModelAndView displayUpdatedFlower(WildFlower flower) {
		WildFlower updatedFlower = dao.updateWildFlower(flower);
		ModelAndView model = new ModelAndView();
		model.addObject("flower", updatedFlower);
		model.setViewName("flower/show");
		return model;
	}
	
	@RequestMapping(path = "getWildFlowerAdd.do")
	public String addNewWildFlower() {
		return "flower/add";
	}
	
	@RequestMapping(path = "newWildFlower.do") 
	public String showNewWildFlower(WildFlower flower, Model model) {
		WildFlower wf = dao.addNewWildFlower(flower);
		model.addAttribute("flower", wf);
		return "flower/show";
	}

}
