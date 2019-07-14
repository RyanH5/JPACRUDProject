package com.skilldistillery.nationalparks.entities;

import java.util.*;

import javax.persistence.*;

@Entity
public class Sighting {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="date_seen")
	@Temporal(TemporalType.DATE)
	private Date dateSeen;
	
	@ManyToMany(cascade= {CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinTable(name="animal_has_sighting",
	joinColumns=@JoinColumn(name="sighting_id"),
	inverseJoinColumns=@JoinColumn(name="animal_id"))
	private List<Animal> animals;
	
	@ManyToMany(cascade= {CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinTable(name="sighting_has_wild_flower",
	joinColumns=@JoinColumn(name="sighting_id"),
	inverseJoinColumns=@JoinColumn(name="wild_flower_id"))
	private List<WildFlower> wildFlowers;

	public Sighting(Date dateSeen) {
		super();
		this.dateSeen = dateSeen;
	}

	public Sighting() {
		super();
	}
	
	public void addAnimal(Animal animal) {
		if (animals == null) {
			animals = new ArrayList<>();
		}
		
		if (!animals.contains(animal)) {
			animals.add(animal);
			animal.addSighting(this);
		}
	}
	
	public void removeAnimal(Animal animal) {
		if (animals != null && animals.contains(animal)) {
			animals.remove(animal);
			animal.removeSighting(this);
		}
	}
	
	public void addWildFlower(WildFlower flower) {
		if (wildFlowers == null) {
			wildFlowers = new ArrayList<>();
		}
		
		if (!wildFlowers.contains(flower)) {
			wildFlowers.add(flower);
			flower.addSighting(this);
		}
	}
	
	public void removeWildFlower(WildFlower flower) {
		if (wildFlowers != null && wildFlowers.contains(flower)) {
			wildFlowers.remove(flower);
			flower.removeSighting(this);
		}
	}

	public List<Animal> getAnimals() {
		return animals;
	}

	public void setAnimals(List<Animal> animals) {
		this.animals = animals;
	}

	public List<WildFlower> getWildFlowers() {
		return wildFlowers;
	}

	public void setWildFlowers(List<WildFlower> wildFlowers) {
		this.wildFlowers = wildFlowers;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDateSeen() {		
		return dateSeen;
	}

	public void setDateSeen(Date dateSeen) {
		this.dateSeen = dateSeen;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Sighting [id=");
		builder.append(id);
		builder.append(", dateSeen=");
		builder.append(dateSeen);
		builder.append("]");
		return builder.toString();
	}
	
	
}
