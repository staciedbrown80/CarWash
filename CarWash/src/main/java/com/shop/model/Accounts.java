package com.shop.model;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name="account")
public class Accounts {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	private String fname;
	private String lname;
	private String password;
	@Transient
	private String password2;	
	private String image;
	private String email;
	private String role;
	private int active;
	
	@OneToOne(mappedBy = "accounts", cascade = CascadeType.ALL)
	private Addressess address;
	
	@OneToMany(mappedBy="account", cascade=CascadeType.ALL)
	private List<Car> cars;
	
	@OneToMany(mappedBy="accounts", cascade=CascadeType.ALL)
	private List<PaymentMethod> paymentMethod;
	
	

	@ManyToMany(cascade = CascadeType.DETACH )
	@JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"),
	inverseJoinColumns = @JoinColumn(name = "role_id"))
	private Set<Role> roles =new HashSet <Role>();
	
	@OneToMany(mappedBy="account", cascade=CascadeType.ALL)
	private List<Products> products;
		
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public Addressess getAddress() {
		return address;
	}
	public void setAddress(Addressess address) {
		this.address = address;
	}
	
	public List<PaymentMethod> getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(List<PaymentMethod> paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
		
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	
	
	public List<Products> getProducts() {
		return products;
	}
	public void setProducts(List<Products> products) {
		this.products = products;
	}
	
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	
	public List<Car> getCars() {
		return cars;
	}
	public void setCars(List<Car> cars) {
		this.cars = cars;
	}
	
	@Override
	public String toString() {
		return "Accounts [id=" + id + ", fname=" + fname + ", lname=" + lname + ", password=" + password
				+ ", password2=" + password2 + ", email=" + email + ", role=" + role + "]";
	}
	
	
	
	

}
