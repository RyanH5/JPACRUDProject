package com.skilldistillery.nationalparks.data;

import java.util.List;

import com.skilldistillery.nationalparks.entities.Animal;

public interface AnimalDAO {
	Animal findById(int id);
	List<Animal> findAll();

}