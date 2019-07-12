package com.skilldistillery.nationalparks.data;

import java.util.List;

import com.skilldistillery.nationalparks.entities.WildFlower;

public interface WildFlowerDAO {

	WildFlower findById(int id);
	List<WildFlower> findAll();
	WildFlower addNewWildFlower(WildFlower wildFlower);
	WildFlower updateWildFlower(WildFlower wildFlower);
	void deleteWildFlower(int id);
}
