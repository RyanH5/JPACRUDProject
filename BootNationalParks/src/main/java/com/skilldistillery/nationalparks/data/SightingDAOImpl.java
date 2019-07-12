package com.skilldistillery.nationalparks.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.nationalparks.entities.Sighting;

@Service
@Transactional
public class SightingDAOImpl implements SightingDAO{
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Sighting findById(int id) {
		return em.find(Sighting.class, id);
	}

	@Override
	public List<Sighting> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Sighting addNewSighting(Sighting sighting) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Sighting updateSighting(Sighting sighting) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteSighting(int id) {
		// TODO Auto-generated method stub
		
	}

}
