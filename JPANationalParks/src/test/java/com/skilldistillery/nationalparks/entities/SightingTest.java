package com.skilldistillery.nationalparks.entities;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Date;

import javax.persistence.*;

import org.junit.jupiter.api.*;

class SightingTest {

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
	void test_sighting_mappings() {
		Sighting s1 = em.find(Sighting.class, 1);
		System.out.println(s1);
		assertEquals("2019-02-03", s1.getDateSeen().toString());
	}

}
