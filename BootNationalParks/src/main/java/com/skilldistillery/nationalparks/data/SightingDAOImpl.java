package com.skilldistillery.nationalparks.data;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
//		"CAPITAL S" Sighting because jpql deals in Objects, SQL deals in column_names
		String query = "SELECT s from Sighting s";
		List<Sighting> sightings = em.createQuery(query, Sighting.class).getResultList();
		System.out.println(sightings);
		return sightings;
	}

	@Override
	public Sighting addNewSighting(Sighting sighting) {
		em.persist(sighting);
		return sighting;
	}

	@Override
	public Sighting updateSighting(Sighting sighting) {
		Sighting nuSighting = em.find(Sighting.class, sighting.getId());
		nuSighting.setDateSeen(sighting.getDateSeen());
		em.persist(nuSighting);
		
		return nuSighting;
	}

	@Override
	public void deleteSighting(int id) {
		em.remove(em.find(Sighting.class, id));	
	}

}
