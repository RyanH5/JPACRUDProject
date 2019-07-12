package com.skilldistillery.nationalparks.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.nationalparks.data.WildFlowerDAO;
import com.skilldistillery.nationalparks.entities.WildFlower;

@Controller
public class WildFlowerController {
	
	@Autowired
	private WildFlowerDAO dao;
	
	@RequestMapping(path="getFlower.do")
	public String showFlower(@RequestParam("wfid") Integer FlowerId, Model model, WildFlower wildFlower) {
		WildFlower wf = dao.findById(FlowerId);
		model.addAttribute("wildFlowers", wf);
		return "flower/show";
	}

}
