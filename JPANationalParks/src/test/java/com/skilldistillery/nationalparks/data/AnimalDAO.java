package com.skilldistillery.nationalparks.data;

import com.skilldistillery.nationalparks.entities.Animal;

public interface AnimalDAO {

	public Animal create(Animal Animal);
	public Animal update(int id, Animal Animal);
	public boolean destroy(int id);
}
