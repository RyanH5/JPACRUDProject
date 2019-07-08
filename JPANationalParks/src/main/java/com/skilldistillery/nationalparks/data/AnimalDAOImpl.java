package com.skilldistillery.nationalparks.data;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.skilldistillery.nationalparks.entities.Animal;

public class AnimalDAOImpl implements AnimalDAO{
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("NationalParks");

	@Override
	public Animal create(Animal Animal) {
		EntityManager em = emf.createEntityManager();
		
		// start the transaction
	    em.getTransaction().begin();
	    
	    // write the customer to the database
	    em.persist(Animal);
	    
	    // update the "local" Customer object
	    em.flush();
	    
	    // commit the changes (actually perform the operation)
	    em.getTransaction().commit();

	    // return the Animal object
		em.close();
		return Animal;
	}

	@Override
	public Animal update(int id, Animal Animal) {
		EntityManager em = emf.createEntityManager();
		
		em.getTransaction().begin();
		
		Animal managedAnimal = em.find(Animal.class, id);
		managedAnimal.setName(Animal.getName());
		managedAnimal.setName(Animal.getName());
		managedAnimal.setImage(Animal.getImage());
		managedAnimal.setImage(Animal.getImage());

		em.getTransaction().commit();
		em.close();
		return managedAnimal;
	}

	@Override
	public boolean destroy(int id) {
		EntityManager em = emf.createEntityManager();
		
		em.getTransaction().begin();
		Animal Animal = em.find(Animal.class, id);
		em.remove(Animal);
	
		em.getTransaction().commit();
		System.out.println(Animal);
		em.close();
//		noramlly have try catch so if you dont delete an Animal you return FALSE
		return true;
	}

}
