package com.shop.model;

import java.util.List;

import javax.persistence.*;

@Entity
@Table(name="cars")
public class Car {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	
	private String make;
	
	private String model;
	
	private String color;
	
	private String licensePlate;
	
	@OneToMany(mappedBy="car", cascade=CascadeType.ALL)
	private List<Products> orders;
	
	@ManyToOne(cascade=CascadeType.DETACH)
	@JoinColumn(name="accounts_id")
	private Accounts account;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getLicensePlate() {
		return licensePlate;
	}

	public void setLicensePlate(String licensePlate) {
		this.licensePlate = licensePlate;
	}

	public Accounts getAccount() {
		return account;
	}

	public void setAccount(Accounts account) {
		this.account = account;
	}

	public List<Products> getOrders() {
		return orders;
	}

	public void setOrders(List<Products> orders) {
		this.orders = orders;
	}
}
