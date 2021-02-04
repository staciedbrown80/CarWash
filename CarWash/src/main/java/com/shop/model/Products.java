package com.shop.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="products")
public class Products {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	private double price;
	private String type;
	private String vehicleType;

	@ManyToOne(cascade=CascadeType.DETACH)
	@JoinColumn(name="car_id")
	private Car car;
	
	@ManyToOne(cascade=CascadeType.DETACH)
	@JoinColumn(name="payment_id")
	private PaymentMethod payment;
	
	@ManyToOne(cascade=CascadeType.DETACH)
	@JoinColumn(name="accounts_id")
	private Accounts account;
	
	private String img;
	
	public Long getId() {
		return id;
	}
	public Accounts getAccount() {
		return account;
	}
	public void setAccount(Accounts account) {
		this.account = account;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public Car getCar() {
		return car;
	}
	public void setCar(Car car) {
		this.car = car;
	}
	
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}

	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getVehicleType() {
		return vehicleType;
	}
	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}
	public PaymentMethod getPayment() {
		return payment;
	}
	public void setPayment(PaymentMethod payment) {
		this.payment = payment;
	}

	
	
	
}
