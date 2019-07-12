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
		em.persist(wildFlower);
		return wildFlower;
	}

	@Override
	public WildFlower updateWildFlower(WildFlower wildFlower) {
		WildFlower wf = em.find(WildFlower.class, wildFlower.getId());
		wf.setName(wildFlower.getName());
		wf.setLocation(wildFlower.getLocation());
		wf.setImage(wildFlower.getImage());
		wf.setBloomingPeriod(wildFlower.getBloomingPeriod()	);
		em.persist(wf);
		System.out.println("______________________________");
		System.out.println(wf);
		System.out.println("______________________________");
		return wf;
	}

	@Override
	public void deleteWildFlower(int id) {
		em.remove(em.find(WildFlower.class, id));
		
	}

}
