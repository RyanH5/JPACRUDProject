package com.skilldistillery.nationalparks.entities;

import javax.persistence.*;

@Entity
public class Animal {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="name")
	private String name;
	
	
	@Column(name="image")
	private String image;


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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Animal [id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append(", image=");
		builder.append(image);
		builder.append("]");
		return builder.toString();
	}


	
}
