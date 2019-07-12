package com.skilldistillery.nationalparks.data;

import static org.junit.Assert.*;

import javax.persistence.*;
import javax.transaction.Transactional;

import org.junit.*;

import com.skilldistillery.nationalparks.entities.WildFlower;

public class WildFlowerDAOImplTest {
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private static WildFlower expectedWF;
	private static WildFlowerDAOImpl wfDAOImpl;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("NationalParks");
		wfDAOImpl = new WildFlowerDAOImpl();
		
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		emf.close();
		wfDAOImpl = null;
	}

	@Before
	public void setUp() throws Exception {
		em = emf.createEntityManager();
		expectedWF = new WildFlower(
				"Marsh marigold", 
				"Wet meadows, parkwide & Beartooth Mountains",
				"May–July",
				"https://previews.123rf.com/images/voltan1/voltan11205/voltan1120500124/13836048-marsh-marigold-caltha-palustris-in-the-swamp.jpg"
				);
	}

	@After
	public void tearDown() throws Exception {
		em.close();
		expectedWF = null;
	}

	@Test
	public void test_findById() {
		WildFlower myWF = em.find(WildFlower.class, 2);
		assertEquals(expectedWF.getName(), myWF.getName());
	}

}
