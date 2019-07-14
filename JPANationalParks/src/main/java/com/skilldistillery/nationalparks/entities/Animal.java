package com.skilldistillery.nationalparks.entities;

import java.util.*;

import javax.persistence.*;

@Entity
public class Animal {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String image;

	private String description;


	@ManyToMany(mappedBy="animals")
	private List<Sighting> sightings;
	
	public Animal() {
		super();
	}

	public Animal(String name, String image, String description) {
		super();
		this.name = name;
		this.image = image;
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void addSighting(Sighting sighting) {
		if (sightings == null) {
			sightings = new ArrayList<>();
		}
		
		if (!sightings.contains(sighting)) {
			sightings.add(sighting);
			sighting.addAnimal(this);
		}
	}
	
	public void removeSighting(Sighting sighting) {
		if (sightings != null && sightings.contains(sighting)) {
			sightings.remove(sighting);
			sighting.removeAnimal(this);
		}
	}
	
	public List<Sighting> getSightings() {
		return sightings;
	}

	public void setSightings(List<Sighting> sightings) {
		this.sightings = sightings;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Animal [id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append(", image=");
		builder.append(image);
		builder.append(", description=");
		builder.append(description);
		builder.append("]");
		return builder.toString();
	}

	


}
