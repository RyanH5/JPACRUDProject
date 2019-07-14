package com.skilldistillery.nationalparks.entities;

import java.util.*;

import javax.persistence.*;

@Entity
@Table(name="wild_flower")
public class WildFlower {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	private String image;
	private String location;
	
	@Column(name="blooming_period")
	private String bloomingPeriod;
	
	@ManyToMany(mappedBy="wildFlowers")
	private List<Sighting> sightings; 
	
	
	public WildFlower() {
		super();
	}

	public WildFlower(String name, String image, String location, String bloomingPeriod) {
		super();
		this.name = name;
		this.image = image;
		this.location = location;
		this.bloomingPeriod = bloomingPeriod;
	}
	
	public void addSighting(Sighting sighting) {
		if (sightings == null) {
			sightings = new ArrayList<>();
		}
		
		if (!sightings.contains(sighting)) {
			sightings.add(sighting);
			sighting.addWildFlower(this);
		}
	}
	
	public List<Sighting> getSightings() {
		return sightings;
	}

	public void setSightings(List<Sighting> sightings) {
		this.sightings = sightings;
	}

	public void removeSighting(Sighting sighting) {
		if (sightings != null && sightings.contains(sighting)) {
			sightings.remove(sighting);
			sighting.removeWildFlower(this);
		}
	}

	public int getId() {
		return id;
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

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getBloomingPeriod() {
		return bloomingPeriod;
	}

	public void setBloomingPeriod(String bloomingPeriod) {
		this.bloomingPeriod = bloomingPeriod;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("WildFlower [id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append(", image=");
		builder.append(image);
		builder.append(", location=");
		builder.append(location);
		builder.append(", bloomingPeriod=");
		builder.append(bloomingPeriod);
		builder.append("]");
		return builder.toString();
	}
	
}
