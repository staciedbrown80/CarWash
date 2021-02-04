package com.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shop.model.Addressess;

public interface AddressRepository extends JpaRepository<Addressess, Long> {
	
	
}
