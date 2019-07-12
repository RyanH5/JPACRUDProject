package com.skilldistillery.nationalparks.data;

import java.util.List;

import javax.persistence.*;
import javax.transaction.Transactional;

import org.springframework.stereotype.*;

import com.skilldistillery.nationalparks.entities.WildFlower;

@Service
@Transactional
public class WildFlowerDAOImpl implements WildFlowerDAO{

	@PersistenceContext
	private EntityManager em;
	@Override
	public WildFlower findById(int id) {		
		return em.find(WildFlower.class, id);
	}

	@Override
	public List<WildFlower> findAll() {
		String jpql = "SELECT wf FROM WildFlower wf";
		List<WildFlower> wildFlowers = em.createQuery(jpql, WildFlower.class).getResultList();
		return wildFlowers;
	}

	@Override
	public WildFlower addNewWildFlower(WildFlower wildFlower) {
		
		return null;
	}

	@Override
	public WildFlower updateWildFlower(WildFlower wildFlower) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteWildFlower(int id) {
		// TODO Auto-generated method stub
		
	}

}
