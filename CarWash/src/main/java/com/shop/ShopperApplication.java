package com.shop;

import java.util.HashSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.shop.model.Accounts;
import com.shop.model.Role;
import com.shop.repository.AccountsRepository;
import com.shop.repository.RoleRepository;

@SpringBootApplication
public class ShopperApplication implements CommandLineRunner{

	@Autowired 
	private AccountsRepository userRepository; 
	@Autowired 
	private RoleRepository roleRepository;
	@Autowired 
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    
	public static void main(String[] args) {
		SpringApplication.run(ShopperApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
			 
		if(!userRepository.findByEmail("admin@email.com").isPresent()) {
			Accounts user=new Accounts();
			user.setFname("Admin");
			user.setLname("Admin");
			user.setEmail("admin@email.com");
			user.setPassword("123");
			user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
	        user.setActive(1);
	        user.setRoles(new HashSet<Role>(roleRepository.findAll()));
	        userRepository.save(user);
	       
		}
	}
}
