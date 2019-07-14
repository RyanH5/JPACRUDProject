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
//		String query = "SELECT s FROM sighting s JOIN animal_has_sighting ahs WHERE s.id = ahs.sighting_id";
//		String query = "SELECT ahs from animal_has_sighting ahs JOIN sighting s on s.id = ahs.sighting_id";
		String query = "SELECT s FROM sighting s JOIN FETCH f.animals a WHERE a.sighting.id = s.id";
		List<Sighting> sightings = em.createQuery(query, Sighting.class).getResultList();
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
		return nuSighting;
	}

	@Override
	public void deleteSighting(int id) {
		em.remove(em.find(Sighting.class, id));	
	}

}
