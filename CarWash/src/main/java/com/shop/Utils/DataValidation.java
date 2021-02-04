package com.shop.Utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.shop.model.Accounts;
import com.shop.repository.AccountsRepository;

@Component
public class DataValidation implements Validator {

	String emailRegex ="^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
	String passwordRegex ="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=])(?=\\S+$).{8,}$";	
	
	@Autowired
	private AccountsRepository accountsRepository;
		
	@Override
	public boolean supports(Class<?> clazz) {		
		return Accounts.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object o, Errors errors) {
		
		Accounts user=(Accounts) o;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fname", "size.user.fname");		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lname", "size.user.lname");	
				
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");		
		if (accountsRepository.findByEmail(user.getEmail()).isPresent()) {
	    	errors.rejectValue("email", "size.user.unique");
	    }
		       
	    ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password2", "NotEmpty");
        if (!user.getPassword2().equals(user.getPassword())) {
	    	errors.rejectValue("password2", "match.user.password2");
	    }
        		
		if(!user.getEmail().matches(emailRegex)) { 
			errors.rejectValue("email","size.user.email"); 
		}
		 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (!user.getPassword().matches(passwordRegex)) {
        	errors.rejectValue("password", "size.user.password");
	    }
		
		
		
	}

}
