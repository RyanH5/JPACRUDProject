package com.skilldistillery.nationalparks.entities;

import static org.junit.jupiter.api.Assertions.*;
import javax.persistence.*;
import org.junit.jupiter.api.*;

class WildFlowerTest {
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
	void test_wildflower_mappings() {
		WildFlower wf = em.find(WildFlower.class, 2);
		System.out.println(wf);
		assertEquals("Marsh marigold", wf.getName());
		assertEquals("Wet meadows, parkwide & Beartooth Mountains", wf.getLocation());
		assertNotNull(wf);
		assertEquals("2003-12-12", wf.getSightings().get(0).getDateSeen().toString());
	}

}
