package com.skilldistillery.nationalparks.data;

import java.util.List;

import com.skilldistillery.nationalparks.entities.Sighting;

public interface SightingDAO {

	Sighting findById(int id);
	List<Sighting> findAll();
	Sighting addNewSighting(Sighting sighting);
	Sighting updateSighting(Sighting sighting);
	void deleteSighting(int id);
}
