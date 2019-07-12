package com.skilldistillery.nationalparks.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.*;

import org.junit.jupiter.api.*;

class AnimalTest {
	private static EntityManagerFactory emf;
	private static EntityManager em;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("NationalParks");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_animal_mappings() {
		Animal daWeasel = em.find(Animal.class, 1);
		assertEquals("Short Tailed Weasel", daWeasel.getName());
		assertNotNull(daWeasel);
	}

}
