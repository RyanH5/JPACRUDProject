package com.skilldistillery.nationalparks.entities;

import java.util.Date;

import javax.persistence.*;

@Entity
public class Sighting {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="date_seen")
	@Temporal(TemporalType.DATE)
	private Date dateSeen;

	public Sighting(Date dateSeen) {
		super();
		this.dateSeen = dateSeen;
	}

	public Sighting() {
		super();
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
}
