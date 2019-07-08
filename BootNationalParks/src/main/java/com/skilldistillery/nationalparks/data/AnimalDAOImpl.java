package com.skilldistillery.nationalparks.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.nationalparks.entities.Animal;

@Service
@Transactional
public class AnimalDAOImpl implements AnimalDAO{
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Animal findById(int id) {
		return em.find(Animal.class, id);
	}

	@Override
	public List<Animal> findAll() {
		String jpql = "SELECT f FROM Animal f";
		List<Animal> Animals = em.createQuery(jpql, Animal.class).getResultList();
		return Animals;
	}

}